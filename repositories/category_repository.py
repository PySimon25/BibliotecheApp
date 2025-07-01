class CategoryRepository:
    def __init__(self, db):
        self.db = db

    def get_all_categories(self):
        cursor = self.db.cursor(dictionary=True)
        cursor.execute("SELECT id_categoria, nome_categoria FROM Categorie ORDER BY nome_categoria")
        categories = cursor.fetchall()
        cursor.close()
        return categories
    
    def get_category_by_id(self, id_categoria):
        cursor = self.db.cursor(dictionary=True)
        query = ("SELECT id_categoria, nome_categoria FROM Categorie WHERE id_categoria = %s")
        cursor.execute(query, (id_categoria,)) # la virgola dopo id_categoria serve a rendere i parametri una tupla
        categories = cursor.fetchone()
        cursor.close()
        return categories