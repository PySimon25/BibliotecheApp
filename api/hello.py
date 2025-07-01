from flask import Blueprint, jsonify, g

hello_bp = Blueprint('hello', __name__)

@hello_bp.route('/hello', methods=['GET'])
def hello():
    cursor = g.db.cursor()
    cursor.execute("SELECT 'Hello World from MariaDB!'")
    result = cursor.fetchone()
    cursor.close()
    return jsonify(message=result[0])

@hello_bp.route('/goodbye', methods=['GET'])
def goodbye():
    return jsonify(message="Goodbye!!!")