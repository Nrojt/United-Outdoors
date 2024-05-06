from flask import Flask, render_template, send_from_directory
import os

app = Flask(__name__)


@app.route('/')
def hello_world():
    return render_template('index.html')


# route that can be used to download any file from the files directory
@app.route('/download/<path:filename>', methods=['GET'])
def download(filename):
    directory = os.path.join(os.getcwd(), 'files')
    return send_from_directory(directory=directory, path=filename, as_attachment=True)


@app.route('/images')
def images():
    image_names = os.listdir('static/images')
    print(image_names)
    return render_template("images.html", image_names=image_names)


if __name__ == '__main__':
    app.run(port=5001, debug=True)
