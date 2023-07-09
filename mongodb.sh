sudo chown -R mongodb:mongodb /var/log/mongodb
sudo chown -R mongodb:mongodb /var/lib/mongodb
sudo chmod -R 755 /var/lib/mongodb
sudo chmod -R 755 /var/log/mongodb

sudo chown mongodb /tmp/mongodb-27017.sock
sudo chgrp mongodb /tmp/mongodb-27017.sock

sudo systemctl restart mongodb
sudo systemctl status mongodb
sudo systemctl stop mongodb

# mongod --port 27017 --dbpath /var/lib/mongodb --replSet rs0 --bind_ip localhost,kp
mongod --port 27017 --dbpath /var/lib/mongodb --replSet rs0 --bind_ip_all
mongod --port 27017 --replSet rs0 --bind_ip_all

sudo mkdir -p /var/lib/mongodb/rs0

mongod --replSet rs0 --port 27017 --bind_ip_all --dbpath /srv/mongodb/rs0 
mongod --replSet rs0 --port 27017 --dbpath /srv/mongodb/rs0 --bind_ip_all  --oplogSize 128