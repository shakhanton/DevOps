#!/usr/bin/env bash
sudo yum install postgresql-server postgresql-contrib -y
sudo postgresql-setup initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql

sudo -u postgres psql -c "CREATE USER developer WITH PASSWORD 'repoleved'"
sudo -u postgres psql -c "CREATE DATABASE fmp_db WITH OWNER developer"

sudo sh -c 'echo -e "host all all 0.0.0.0/0 trust" >> /var/lib/pgsql/data/pg_hba.conf'
sudo sh -c 'echo -e "listen_addresses='\''*'\''" >> /var/lib/pgsql/data/postgresql.conf'
sudo service postgresql restart
