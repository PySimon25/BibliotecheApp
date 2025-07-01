class UserRepository:
    def __init__(self, db):
        self.db = db

    def get_all_users(self):
        cursor = self.db.cursor(dictionary=True)
        cursor.execute("SELECT id_utente, nome, cognome, email, telefono FROM Utenti ORDER BY cognome, nome")
        users = cursor.fetchall()
        cursor.close()
        return users

    def get_user_by_email(self, email):
        cursor = self.db.cursor(dictionary=True)
        cursor.execute("SELECT id_utente, nome, cognome, email, telefono FROM Utenti WHERE email = %s", (email,))
        user = cursor.fetchone()
        cursor.close()
        return user