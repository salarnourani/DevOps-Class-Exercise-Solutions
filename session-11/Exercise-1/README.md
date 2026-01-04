## Build and Run MariaDB Docker Container
```bash
# Build custom MariaDB image from Dockerfile
docker build -t my-mariadb .

# Create Docker network with custom subnet
docker network create --subnet 192.168.86.0/24 mynet

# Run MariaDB container with static IP and port mapping
docker run -itd \
  --name my-mariadb \
  -p 3000:3306 \
  --network mynet \
  --ip 192.168.86.10 \
  my-mariadb

# Access the running container
docker exec -it my-mariadb bash
root@06c2af8dadb6:/# my-mariadb -u root -p -h 192.168.86.10 -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 4
Server version: 12.1.2-MariaDB-ubu2404 mariadb.org binary distribution

Copyright (c) 200, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.002 sec)

MariaDB [(none)]>
