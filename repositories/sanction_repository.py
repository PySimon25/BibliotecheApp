class SanctionRepository:
    def __init__(self, db):
        self.db = db

    def get_sanctions_by_lending_id(self, id_prestito):
        with self.db.cursor(dictionary=True) as cursor:
            query = "SELECT id_sanzione, giorni_ritardo, importo, pagata from Sanzioni WHERE id_prestito = %s"
            cursor.execute(query, (id_prestito,))
            sanctions = cursor.fetchall()
            return sanctions