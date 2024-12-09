# flaskapp.py
from flask import Flask
from gunicorn.app.wsgiapp import WSGIApplication

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, World!"

class FlaskApp(WSGIApplication):
    def init(self, parser, opts, args):
        return {
            'bind': '0.0.0.0:8000',
            'workers': 4,
        }

    def load(self):
        return app

if __name__ == "__main__":
    FlaskApp().run()