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
        category = cursor.fetchone()
        cursor.close()
        return category
    
    def get_category_by_name(self, nome_categoria):
        cursor = self.db.cursor(dictionary=True)
        query = ("SELECT id_categoria, nome_categoria FROM Categorie WHERE nome_categoria = %s")
        cursor.execute(query, (nome_categoria,))
        category = cursor.fetchone()
        cursor.close()
        return category
    
    def create_category(self, nome_categoria):
        cursor = self.db.cursor()
        cursor.execute("INSERT INTO Categorie (nome_categoria) VALUES (%s)", (nome_categoria,))
        self.db.commit()
        new_id = cursor.lastrowid
        cursor.close()
        return new_id