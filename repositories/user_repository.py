from repositories.lending_repository import LendingRepository

class UserRepository:
    def __init__(self, db):
        self.db = db
        self.lendings_repo = LendingRepository(db)

    def get_all_users(self):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_utente, nome, cognome, email, telefono FROM Utenti ORDER BY cognome, nome"
            cursor.execute(query)
            users = cursor.fetchall()
            return users

    def get_user_by_id(self, id_utente):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_utente, nome, cognome, email, telefono FROM Utenti WHERE id_utente = %s"
            cursor.execute(query, (id_utente,))
            user = cursor.fetchone()
            return user
        
    def get_user_by_id_with_details(self, id_utente):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_utente, nome, cognome, email, telefono FROM Utenti WHERE id_utente = %s"
            cursor.execute(query, (id_utente,))
            user = cursor.fetchone()
            if user is not None:
                user['prestiti'] = self.lendings_repo.get_lendings_by_user_id(id_utente)
                print(user)
            return user

    def get_user_by_email(self, email):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_utente, nome, cognome, email, telefono FROM Utenti WHERE email = %s"
            cursor.execute(query, (email,))
            user = cursor.fetchone()
            return user
        