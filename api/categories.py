from flask import Blueprint, jsonify, g, request
from repositories.category_repository import CategoryRepository

categories_bp = Blueprint('categories', __name__)
# DAO per la gestione delle Categorie
categories_repo = lambda: CategoryRepository(g.db)

@categories_bp.route('/categories', methods=['GET'])
def get_categories():
    categories = categories_repo().get_all_categories()
    return jsonify(categories)


@categories_bp.route('/categories/<int:id>', methods=['GET'])
def categories_by_route_id(id):
    category = categories_repo().get_category_by_id(id)
    if not category:
        return jsonify(error="Category not found"), 404
    return jsonify(category)
