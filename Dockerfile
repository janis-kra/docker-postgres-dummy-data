FROM postgres

RUN mkdir -p /docker-entrypoint-initdb.d

COPY insert-sample-data.sh /docker-entrypoint-initdb.d
