from flask import Flask, render_template
import os

app = Flask(__name__)


@app.route('/')
def hello_world():
    return render_template('index.html')

@app.route('/images')
def images():
    image_names = os.listdir('static/images')
    print(image_names)
    return render_template("images.html", image_names=image_names)


if __name__ == '__main__':
    app.run(port=5001, debug=True)
