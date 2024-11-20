import sys

from flask import Flask, jsonify

from . import database


app = Flask(__name__)


# Route that services the index page for the web client
@app.route('/')
def root():
    return app.send_static_file('index.html')


@app.route('/api/healthcheck', methods=['GET'])
def healthcheck():
    # sqlite3 python docs:
    # https://docs.python.org/3/library/sqlite3.html
    connection = database.sqlite_db()
    cursor = connection.cursor()

    cursor.execute('''
        SELECT id, description FROM honor_smoke_check;
    ''')

    rows = [
        {
            "description": row[0],
            "description": row[1],
        }
        for row in cursor.fetchall()
    ]

    return jsonify({'rows': rows})

# @app.route('/api/test', methods=['GET'])
# def test():


# Server should be started with run.sh (or `flask run`)
if __name__ == '__main__':
    sys.exit('ERROR: run the server via `run.sh`')
