class LendingRepository:
    def __init__(self, db):
        self.db = db

    def get_lendings_by_user_id(self, id_prestito):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT p.data_prestito, p.data_restituzione_effettiva, p.data_restituzione_prevista, \
                p.id_prestito, l.titolo, l.autore, l.anno_pubblicazione, l.isbn, b.nome_biblioteca, b.città \
                from Prestiti p \
                JOIN Libri l on p.id_libro = l.id_libro \
                JOIN Biblioteche b on p.id_biblioteca = b.id_biblioteca \
                WHERE p.id_utente = %s"
            cursor.execute(query, (id_prestito,))
            lendings = cursor.fetchall()
            if len(lendings) > 0:
                for lending in lendings:
                    lending['libro'] = {
                        'titolo': lending.pop('titolo'),
                        'autore': lending.pop('autore'),
                        'anno_pubblicazione': lending.pop('anno_pubblicazione'),
                        'isbn': lending.pop('isbn')
                    }
                    lending['biblioteca'] = {
                        'nome_biblioteca': lending.pop('nome_biblioteca'),
                        'città': lending.pop('città')
                    }                    
            return lendings