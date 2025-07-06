from flask import Blueprint, jsonify, g, request
from repositories.category_repository import CategoryRepository

categories_bp = Blueprint('categories', __name__)
# DAO per la gestione delle Categorie
categories_repo = lambda: CategoryRepository(g.db)

@categories_bp.route('/categories', methods=['GET'])
def get_categories():
    categories = categories_repo().get_all_categories()
    return jsonify(categories)

@categories_bp.route('/categories/details', methods=['GET'])
def get_categories_with_details():
    categories = categories_repo().get_all_categories_with_details()
    return jsonify(categories)

@categories_bp.route('/category/<int:id>', methods=['GET'])
def category_by_id(id):
    category = categories_repo().get_category_by_id(id)
    if not category:
        return jsonify(error="Category not found"), 404
    return jsonify(category)

@categories_bp.route('/category/<int:id>/details', methods=['GET'])
def category_by_id_with_details(id):
    category = categories_repo().category_by_id_with_details(id)
    if not category:
        return jsonify(error="Category not found"), 404
    return jsonify(category)

@categories_bp.route('/category', methods=['POST'])
def create_category():
    data = request.get_json()
    nome_categoria = data.get('nome_categoria')
    if not nome_categoria:
        return jsonify(error="Missing parameter nome_categoria"), 400
    nome_categoria = nome_categoria.strip()
    if categories_repo().get_category_by_name(nome_categoria):
        return jsonify(error=f"{nome_categoria} already exists"), 400
    category_id = categories_repo().create_category(nome_categoria)
    response = {
        'id_categoria': category_id,
        'message': 'OK'
    }
    return jsonify(response)