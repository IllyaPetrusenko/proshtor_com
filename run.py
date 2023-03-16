from flask import Flask, render_template

app = Flask(__name__, template_folder='application/templates', static_folder='application/static')


@app.route("/")
def home():
    return render_template('test.html')


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80, ssl_context=('fullchain1.pem', 'privkey1.pem'))
