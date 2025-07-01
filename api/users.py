from flask import Blueprint, jsonify, g, request
from repositories.user_repository import UserRepository

users_bp = Blueprint('users', __name__)
# DAO per la gestione degli utenti
users_repo = lambda: UserRepository(g.db)

@users_bp.route('/users', methods=['GET'])
def get_users():
    users = users_repo().get_all_users()
    return jsonify(users)

@users_bp.route('/users/search', methods=['GET'])
def get_user_by_email():
    email = request.args.get('email')
    if not email:
        return jsonify(error="Email parameter is required"), 400
    user = users_repo().get_user_by_email(email)
    if not user:
        return jsonify(error="User not found"), 404
    return jsonify(user)