from repositories.sanction_repository import SanctionRepository

class LendingRepository:
    def __init__(self, db):
        self.db = db
        self.sanction_repo = SanctionRepository(db)

    def get_lendings_by_user_id(self, id_utente):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT p.data_prestito, p.data_restituzione_effettiva, p.data_restituzione_prevista, \
                p.id_prestito, l.titolo, l.autore, l.anno_pubblicazione, l.isbn, b.id_biblioteca, b.nome_biblioteca, b.città, \
                bb.id_bibliotecario, bb.nome nome_bibliotecario, bb.cognome cognome_bibliotecario, bb.email email_bibliotecario \
                from Prestiti p \
                JOIN Libri l on p.id_libro = l.id_libro \
                JOIN Biblioteche b on p.id_biblioteca = b.id_biblioteca \
                JOIN Bibliotecari bb on p.id_bibliotecario = bb.id_bibliotecario \
                WHERE p.id_utente = %s"
            cursor.execute(query, (id_utente,))
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
                        "id_biblioteca": lending.pop('id_biblioteca'),
                        'nome_biblioteca': lending.pop('nome_biblioteca'),
                        'città': lending.pop('città')
                    }
                    lending['bibliotecario'] = {
                        'id_bibliotecario': lending.pop('id_bibliotecario'),
                        'nome': lending.pop('nome_bibliotecario'),
                        'cognome': lending.pop('cognome_bibliotecario'),
                        'email': lending.pop('email_bibliotecario')
                    }
                    sanctions = self.sanction_repo.get_sanctions_by_lending_id(lending['id_prestito'])
                    if len(sanctions) > 0:
                        lending['sanzioni'] = sanctions
            return lendings