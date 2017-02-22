#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER docker;
    CREATE DATABASE docker;
    GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d docker <<-EOSQL
    create table contacts (
        uid serial,
        email VARCHAR(80) not null,
        first_name VARCHAR(80) NOT NULL,
        last_name VARCHAR(80) NOT NULL
    );
    INSERT INTO contacts(email, first_name, last_name) VALUES('jim@example.com', 'Jim', 'Smith');
    INSERT INTO contacts(email, first_name, last_name) VALUES('', 'John', 'Smith');
    INSERT INTO contacts(email, first_name, last_name) VALUES('carol@example.com', 'Carol', 'Smith');
    INSERT INTO contacts(email, first_name, last_name) VALUES('sam@example.com', 'Sam', '');
EOSQL
