class CategoryRepository:
    def __init__(self, db):
        self.db = db

    def get_all_categories(self):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_categoria, nome_categoria FROM Categorie ORDER BY nome_categoria"
            cursor.execute(query)
            categories = cursor.fetchall()
            return categories
        
    def get_all_categories_with_details(self):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT c.id_categoria, c.nome_categoria, COUNT(*) AS numero_libri \
                FROM Categorie c \
                LEFT JOIN Libri l on c.id_categoria = l.id_categoria \
                GROUP BY c.id_categoria \
                ORDER BY c.nome_categoria"
            cursor.execute(query)
            categories = cursor.fetchall()
            return categories
    
    def get_category_by_id(self, id_categoria):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_categoria, nome_categoria FROM Categorie WHERE id_categoria = %s"
            cursor.execute(query, (id_categoria,)) # la virgola dopo id_categoria serve a rendere i parametri una tupla
            category = cursor.fetchone()
            return category
        
    def category_by_id_with_details(self, id_categoria):
        with self.db.cursor(dictionary=True) as cursor:
            category = self.get_category_by_id(id_categoria)
            if category is not None:
                query = "SELECT l.id_libro, l.titolo, l.autore, l.anno_pubblicazione, l.isbn, c.id_categoria, c.nome_categoria, \
                    g.id_genere, g.nome_genere, b.id_biblioteca, b.nome_biblioteca, b.indirizzo, b.città \
                    FROM Libri l \
                    JOIN Categorie c ON c.id_categoria = l.id_categoria \
                    LEFT JOIN Generi g ON l.id_genere = g.id_genere \
                    LEFT JOIN Biblioteche b ON l.id_biblioteca = b.id_biblioteca \
                    WHERE c.id_categoria = %s \
                    ORDER BY l.titolo;"
                cursor.execute(query, (id_categoria,))
                category_details = cursor.fetchall()
                if len(category_details) > 0:
                    category['libri'] = category_details
                    for detail in category_details:
                        detail['categoria'] = {
                            'id_categoria': detail.pop('id_categoria'),
                            'nome_categoria': detail.pop('nome_categoria')
                        }
                        detail['genere'] = {
                            'id_genere': detail.pop('id_genere'),
                            'nome_genere': detail.pop('nome_genere')
                        }
                        detail['biblioteca'] = {
                            'id_biblioteca': detail.pop('id_biblioteca'),
                            'nome_biblioteca': detail.pop('nome_biblioteca'),
                            'indirizzo': detail.pop('indirizzo'),
                            'città': detail.pop('città')
                        }
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