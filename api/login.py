from flask import Blueprint, jsonify, g, request
from utilities.auth_utils import generate_token
from repositories.user_repository import UserRepository

login_bp = Blueprint('login', __name__)
users_repo = lambda: UserRepository(g.db)

@login_bp.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    if not email or not password:
        return jsonify(error="Email and password required"), 400
    
    user = users_repo().get_user_by_email_for_authentication(email)

    if not user:
        return jsonify(error="Invalid credentials"), 401
    
    if not users_repo().check_password(password, user['password']):
        return jsonify(error="Invalid credentials"), 401
    
    token = generate_token(user['id_utente'])

    return jsonify(token=token)
