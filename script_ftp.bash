#!/bin/bash
# Script hecho por @05545 en github.com
# Script para semi-automatizar la instalacion de la herramienta vsftpd para levantar servidor FTP

sudo apt update
sudo apt install vsftpd -y

# Edicion de las configuraciones
# Solo descomentar las lineas necesarias
sudo nano /etc/vsftpd.conf # Aunque se pueden editar varias configuraciones, la unica necesaria para hbailitar es write_enable=YES 

sudo service vsftpd restart

estado_servicio=$(sudo service vsftpd status | grep 'Active:' | awk '{print $2}')
if [ "$estado_servicio" = "active" ]; then
  echo "vsftpd está activo."
else
  echo "vsftpd está inactivo."
fi

IP_dir=$(hostname -I | awk '{print $1}')
echo "La dirección IP es: $IP_dir"

