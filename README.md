# Biblioteche App

- Creare il database sul server MariaDB / MySQL e caricare lo script sqldalla cartella assets
- Copiare o rinominare il file .env.dist in .env e inserire i dati per la connessione al db
- Creazione virtual environment con il comando nella cartella principale del progetto

```console
python -m venv .venv
```

- Attivazione virtual environment con il comando

```console
(Linux) source .venv/bin/activate
(Windows) .\.venv\Scripts\Activate.ps1
```

- Installazione librerie richieste dal progetto con il comando nella cartella principale del progetto

```console
pip install -r requirements.txt
```

- Esecuzione del progetto con il comando

```console
flask run
```

- Per fermare l'applicazione CTRL+C nella console

## Endpoint

Per chiamare la webapi aprire il browser

- [Elenco categorie](http://localhost:5000/api/categories)
- [Elenco categorie con dettaglio](http://localhost:5000/api/categories/details)
- [Categoria singola](http://localhost:5000/api/category/1)
- [Categoria singola con dettaglio](http://localhost:5000/api/category/1/details)
- [Elenco utenti](http://localhost:5000/api/users)
- [Ricerca utente per email](http://localhost:5000/api/users/search?email=francesca14@hotmail.com)

Richiede client in grado di effettuare chiamate REST es. Postman

- [Creazione categoria (POST)](http://localhost:5000/api/category)

## Riferimenti

- [Flask](https://flask.palletsprojects.com/en/stable/)
- [Flask Blueprints](https://flask.palletsprojects.com/en/stable/blueprints/)
