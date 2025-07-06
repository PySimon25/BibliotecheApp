from flask import Blueprint, jsonify, g, request
from repositories.category_repository import CategoryRepository

categories_bp = Blueprint('categories', __name__)
# DAO per la gestione delle Categorie
categories_repo = lambda: CategoryRepository(g.db)

@categories_bp.route('/categories', methods=['GET'])
def get_categories():
    '''
    Elenco delle Categorie e numero di libri associati
    '''
    categories = categories_repo().get_all_categories()
    return jsonify(categories)

@categories_bp.route('/category/<int:id>', methods=['GET'])
def category_by_id(id):
    '''
    Restituisce una Categoria con il numero di libri associati
    '''
    category = categories_repo().get_category_by_id(id)
    if not category:
        return jsonify(error="Category not found"), 404
    return jsonify(category)

@categories_bp.route('/category/<int:id>/details', methods=['GET'])
def category_by_id_with_details(id):
    '''
    Restituisce una Categoria con i relativi libri associati
    '''
    category = categories_repo().category_by_id_with_details(id)
    if not category:
        return jsonify(error="Category not found"), 404
    return jsonify(category)

@categories_bp.route('/category', methods=['POST'])
def create_category():
    '''
    Crea una nuova Categoria
    '''
    data = request.get_json()
    nome_categoria = data.get('nome_categoria')
    if not nome_categoria:
        return jsonify(error="Missing parameter nome_categoria"), 400
    nome_categoria = nome_categoria.strip()
    if categories_repo().get_category_by_name(nome_categoria):
        return jsonify(error=f"{nome_categoria} already exists"), 400
    nuovo_id_categoria = categories_repo().create_category(nome_categoria)
    response = {
        'id_categoria': nuovo_id_categoria,
        'message': 'OK'
    }
    return jsonify(response)

@categories_bp.route('/category', methods=['PUT'])
def update_category():
    '''
    Aggiorna una Categoria esistente
    '''
    data = request.get_json()
    id_categoria = data.get('id_categoria')
    # Validazione id_categoria
    try:
        id_categoria = int(id_categoria)
    except (TypeError, ValueError):
        return jsonify(error="Invalid id supplied"), 400
    nome_categoria = data.get('nome_categoria')
    # Validazione nome_categoria
    if nome_categoria is None:
        return jsonify(error='Missing parameter nome_categoria'), 400
    nome_categoria = nome_categoria.strip()
    if len(nome_categoria) < 3:
        return jsonify(error='Invalid parameter nome_categoria'), 400
    # Verifica la presenza del record
    if categories_repo().get_category_by_id(id_categoria) is None:
        return jsonify(error=f'Invalid id {id_categoria} supplied'), 404
    # Modifica record
    rowcount = categories_repo().update_category(nome_categoria, id_categoria)
    response = {
        'record_modificati': rowcount
    }
    return jsonify(response)

@categories_bp.route('/category/<int:id>', methods=['DELETE'])
def delete_category_by_id(id):
    '''
    Cancella una Categoria esistente senza libri associati
    '''
    try:
        id_categoria = int(id)
    except (TypeError, ValueError):
        return jsonify(error="Invalid id supplied"), 404
    # Verifica la presenza del record
    category = categories_repo().get_category_by_id(id_categoria)
    if category is None:
        return jsonify(error=f'Invalid id {id_categoria} supplied'), 404
    # Verifica che non abbia libri associati
    if category['numero_libri'] > 0:
        return jsonify(error='Cannot delete non-empty Category'), 400
    # Cancella il record
    rowcount = categories_repo().delete_category_by_id(id)
    response = {
        'record_cancellati': rowcount
    }
    return jsonify(response)
