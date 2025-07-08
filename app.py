from flask import Flask, jsonify, make_response, g
from werkzeug.exceptions import HTTPException
import mysql.connector
import os
from api.login import login_bp
from api.users import users_bp
from api.categories import categories_bp

app = Flask(__name__)
# Registra i gestori che gestiranno le chiamate all'api
app.register_blueprint(login_bp, url_prefix="/api")
app.register_blueprint(users_bp, url_prefix="/api")
app.register_blueprint(categories_bp, url_prefix="/api")

@app.before_request
def before_request():
    """
    Crea la connessione al database
    """
    g.db = mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=int(os.getenv("DB_PORT", 3306)),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME")
    )

@app.teardown_request
def teardown_request(exception):
    """
    Chiude la connessione al database
    """
    db = getattr(g, 'db', None)
    if db:
        db.close()

@app.errorhandler(Exception)
def handle_exception(e):
    """
    Middleware per intercettare gli errori e non mostrarli nel codice json
    """
    if isinstance(e, HTTPException):
        return make_response(jsonify(error=e.description), e.code)
    app.logger.exception("Errore non gestito")
    return make_response(jsonify(error="Errore interno del server"), 500)

if __name__ == '__main__':
    app.run()
