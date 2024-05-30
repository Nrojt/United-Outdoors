from flask import Flask, render_template, send_from_directory
import os

app = Flask(__name__)


@app.route('/')
def main_page():
    return render_template('index.html')


# route that can be used to download any file from the files directory
@app.route('/download/<path:filename>', methods=['GET'])
def download(filename):
    directory = os.path.join(os.getcwd(), 'files')
    return send_from_directory(directory=directory, path=filename, as_attachment=True)


@app.route('/images')
def images():
    # This will technically list all files in the images directory, but since only we have access to the server,
    # it's fine
    image_names = os.listdir('static/images')
    print(image_names)
    # send the list of image names to the template
    return render_template("images.html", image_names=image_names)


if __name__ == '__main__':
    # custom port
    app.run(port=5001, debug=True)
