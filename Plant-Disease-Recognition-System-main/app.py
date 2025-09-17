from flask import Flask, render_template, request, redirect, send_from_directory
import requests
import uuid
import os

app = Flask(__name__)

# --- API URLs from Colab ngrok ---
COLAB_API_URL_PREDICT = "https://ee08856e8fc9.ngrok-free.app/predict"
COLAB_API_URL_PROBLEM = "https://ee08856e8fc9.ngrok-free.app/classify_problem"


# --- Route: Serve uploaded images ---
@app.route('/uploadimages/<path:filename>')
def uploaded_images(filename):
    return send_from_directory('./uploadimages', filename)


# --- Route: Home page ---
@app.route('/', methods=['GET'])
def home():
    return render_template('home.html')


# --- Route: Crop Disease Detection (Image Upload) ---
@app.route('/upload/', methods=['POST'])
def uploadimage():
    image_file = request.files['img']
    if image_file.filename == '':
        return redirect(request.url)

    # Save uploaded image locally
    temp_dir = "uploadimages"
    os.makedirs(temp_dir, exist_ok=True)
    filename = f"temp_{uuid.uuid4().hex}{os.path.splitext(image_file.filename)[1]}"
    image_path = os.path.join(temp_dir, filename)
    image_file.save(image_path)
    display_path = f'/{temp_dir}/{filename}'

    # Send image to Colab API
    prediction_result = "Error: Could not get prediction."
    try:
        with open(image_path, 'rb') as f:
            files = {'file': (image_file.filename, f, image_file.content_type)}
            response = requests.post(COLAB_API_URL_PREDICT, files=files, timeout=60)
            if response.status_code == 200:
                prediction_result = response.json().get('prediction', 'No prediction found in response.')
            else:
                prediction_result = f"API Error: {response.text}"
    except requests.exceptions.RequestException as e:
        prediction_result = f"Network Error: {e}"

    return render_template('home.html',
                           result=True,
                           imagepath=display_path,
                           prediction=prediction_result)


# --- Route: Farmer Problem Classification (Text Input) ---
@app.route('/submit_problem', methods=['POST'])
def submit_problem():
    problem_text = request.form.get("problem")
    prediction_result = "Error: Could not classify problem."

    try:
        response = requests.post(
            COLAB_API_URL_PROBLEM,
            json={"problem": problem_text},
            timeout=60
        )
        if response.status_code == 200:
            prediction_result = response.json().get("prediction", "No prediction found.")
        else:
            prediction_result = f"API Error: {response.text}"
    except requests.exceptions.RequestException as e:
        prediction_result = f"Network Error: {e}"

    return render_template("home.html",
                           problem_result=prediction_result,
                           problem_text=problem_text)


if __name__ == "__main__":
    app.run(debug=True)
