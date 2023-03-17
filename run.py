from flask import Flask, render_template
from flask_sslify import SSLify


app = Flask(__name__, template_folder='application/templates', static_folder='application/static')
sslify = SSLify(app)


@app.route("/")
def home():
    return render_template('test.html')


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80, debug=True, ssl_context=("cert.pem", "key.pem"))
