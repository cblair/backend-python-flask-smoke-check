-- For SQLite, you don't have to explicitly create a database.
-- It happens as part of opening the DB.

-- To run this script, do the following:
--
-- $ sqlite3 honor.db
-- > .read db/createdb-sqlite.sql

-- Some other helpful sqlite CLI commands
--
-- $ sqlite3 honor.db
-- > .tables
-- > .schema honor_smoke_check
-- > SELECT * FROM honor_smoke_check;
-- > .quit

DROP TABLE IF EXISTS honor_smoke_check;
CREATE TABLE honor_smoke_check (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	description TEXT
);

INSERT INTO honor_smoke_check (
	description
) VALUES
   ('this is a smoke check'),
   ('this is another smoke check');
