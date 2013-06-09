from flask import Flask, jsonify, abort, make_response, request, url_for

app = Flask(__name__)

@app.route('/')
def index():
    return 'Index'

if __name__ == '__main__':
    app.run()
