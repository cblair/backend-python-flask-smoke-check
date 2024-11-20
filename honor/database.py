import sqlite3

# Python Database API connection
def sqlite_db():
    return sqlite3.connect('honor.db')
