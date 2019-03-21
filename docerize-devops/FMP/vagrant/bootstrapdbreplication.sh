#!/usr/bin/env bash
#sudo yum install postgresql-server postgresql-contrib -y
#sudo postgresql-setup initdb
#sudo systemctl start postgresql
#sudo systemctl enable postgresql

#sudo -u postgres psql -c "CREATE USER developer WITH PASSWORD 'repoleved'"
#sudo -u postgres psql -c "CREATE DATABASE fmp_db WITH OWNER developer"

#sudo sh -c 'echo -e "host all all 0.0.0.0/0 trust" >> /var/lib/pgsql/data/pg_hba.conf'
#sudo sh -c 'echo -e "listen_addresses='\''*'\''" >> /var/lib/pgsql/data/postgresql.conf'
#sudo service postgresql restart


sudo yum install  https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm -y
sudo yum install postgresql96 postgresql96-server postgresql96-contrib postgresql96-libs -y
sudo /usr/pgsql-9.6/bin/postgresql96-setup initdb
sudo systemctl start postgresql-9.6
sudo systemctl enable postgresql-9.6
sudo systemctl stop postgresql-9.6
sudo sh -c 'echo -e "hot_standby = on" >> /var/lib/pgsql/9.6/data/postgresql.conf'
sudo rm -Rf /var/lib/pgsql/9.6/data
sudo su postgres -c "pg_basebackup -h 192.168.50.4 -D /var/lib/pgsql/9.6/data -R -P -U replication -w --xlog-method=stream"
sudo systemctl start postgresql-9.6.service && systemctl status postgresql-9.6.service 

