#!/bin/bash

echo "Iniciando script!"

echo "Criando Grupos!"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando diretórios!"

mkdir /home/publico
chmod 777 /home/publico

mkdir /home/adm
chown :GRP_ADM /home/adm
chmod 770 /home/adm

mkdir /home/ven
chown :GRP_VEN /home/ven
chmod 770 /home/ven

mkdir /home/sec
chown :GRP_SEC /home/sec
chmod 770 /home/sec

echo "Criando usuários"

useradd carlos -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -6 senha123) -g GRP_SEC

echo "Apagando usuário sudo!"

userdel admin -r -f
