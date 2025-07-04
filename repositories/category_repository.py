class CategoryRepository:
    def __init__(self, db):
        self.db = db

    def get_all_categories(self):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_categoria, nome_categoria FROM Categorie ORDER BY nome_categoria"
            cursor.execute(query)
            categories = cursor.fetchall()
            return categories
    
    def get_category_by_id(self, id_categoria):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_categoria, nome_categoria FROM Categorie WHERE id_categoria = %s"
            cursor.execute(query, (id_categoria,)) # la virgola dopo id_categoria serve a rendere i parametri una tupla
            category = cursor.fetchone()
            return category
    
    def get_category_by_name(self, nome_categoria):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_categoria, nome_categoria FROM Categorie WHERE nome_categoria = %s"
            cursor.execute(query, (nome_categoria,))
            category = cursor.fetchone()
            return category
    
    def create_category(self, nome_categoria):
        with self.db.cursor() as cursor:
            query = "INSERT INTO Categorie (nome_categoria) VALUES (%s)"
            cursor.execute(query, (nome_categoria,))
            self.db.commit()
            new_id = cursor.lastrowid
            return new_id