from flask import Flask, render_template, send_from_directory, request
import os
import shutil

app = Flask(__name__)


@app.route('/')
def main_page():
    return render_template('index.html')


# route that can be used to download any file from the files directory
@app.route('/download/<path:filename>', methods=['GET'])
def download(filename):
    directory = os.path.join(os.getcwd(), 'files')
    return send_from_directory(directory=directory, path=filename, as_attachment=True)


# route that can be used to download this directory
@app.route('/download_dir/<path:directory>', methods=['GET'])
def download_dir(directory):
    directory = os.path.join(os.path.dirname(os.getcwd()), directory)

    output_filename = os.path.basename(directory) + '.zip'

    # output path
    output_path = os.path.join(os.getcwd(), 'files', output_filename)
    print(f'Output filename: {output_path}')

    # Check if the zip file already exists
    if not os.path.exists(output_path):
        print(f'Creating a zip file of the directory: {directory} with the name: {output_path}')
        # creating a zip file of the directory
        shutil.make_archive(output_path.split('.')[0], 'zip', directory)
    else:
        print(f'Zip file {output_path} already exists.')

    print(f'Sending the zip file: {output_path}')
    # Send the zip file from the 'files' directory
    return send_from_directory(directory=os.path.join(os.getcwd(), 'files'), path=output_filename, as_attachment=True)


# route for training page, which visualizes the training process
@app.route('/training/<path:type_of_training>', methods=['GET', 'POST'])
def training_regression(type_of_training):
    training_folders = next(os.walk('./static/training/' + type_of_training))[1]  # getting all the folders in the
    # training directory
    training_info = None
    if request.method == 'POST':
        training_info = request.form.get('training_info')  # getting the selected training info
    return render_template('training.html', folders=training_folders, selected_training_info=training_info,
                           type_of_training=type_of_training)


if __name__ == '__main__':
    # custom port
    app.run(port=5001, debug=True)
