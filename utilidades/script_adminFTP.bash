#!/bin/bash
# Hecho por @05545 en github.com
# Probado en entorno kali linux (Debian)

# Script para facilitar la gestión general y de FTP en el servidor

# Colores y formatos
rojo='\033[0;31m'
verde='\033[0;32m'
amarillo='\033[0;33m'
azul='\033[0;34m'
sc='\033[0m' # Sin color
sub='\033[4m'
no_sub='\033[24m'

# Actualiza los repositorios del sistema operativo
function actualizar() {
  echo -e "${verde}Actualizando el sistema${NC}"
  sudo apt update
}

# Actualiza las cabeceras de Linux
function actualizar_cabeceras(){
  echo -e "${verde}Actualizando cabeceras${NC}"
  sudo apt upgrade -y
}

# Consulta el estado activo o inactivo del servidor en vsftpd
function revisar_estadoFTP() {
  estado=$(sudo service vsftpd status | grep 'Active:' | awk '{print $2}')
  if [ "$estado" = "active" ]; then
    echo -e "${verde}vsftpd está activo.${NC}"
  else
    echo -e "${rojo}vsftpd está inactivo.${NC}"
  fi
}

# Consulta la dirección IP del servidor
function ver_ips() {
  IP_dir=$(hostname -I | awk '{print $1}')
  echo -e "${azul}La dirección IP es: $IP_dir${sc}"
}

# Agrega un usuario al servidor, puede o no ser destinado al servidor FTP activo
function agregar_usuario() {
  read -p "Ingrese el nombre de usuario: " nombre
  sudo adduser $nombre
  echo -e "${verde}Usuario $nombre agregado.${sc}"
}

# Elimina un usuario, puede o no estar asociado con el servidor FTP activo
function eliminar_usuario() {
  read -p "Ingrese el nombre de usuario a eliminar: " nombre
  sudo deluser $nombre
  sudo rm -rf /home/$nombre
  echo -e "${rojo}Usuario $nombre eliminado.${sc}"
}

# Retorna lista de usuarios habilitados, pueden o no estar asociados al servidor FTP activo
function list_u() {
  echo -e "${sub}Lista de usuarios:${no_sub}"
  for dir in /home/*; do
    if [ -d "$dir" ]; then
      user=$(basename $dir)
      echo -e "${amarillo}$user${sc}"
    fi
  done
}

# Cambia la contraseña de un usuario cualquiera, puede o no estar asociado al servidor FTP activo
function cambiar_c() {
  read -p "Ingrese el nombre de usuario: " nombre
  sudo passwd $nombre
  echo -e "${verde}Contraseña del usuario $nombre cambiada.${sc}"
}

# Muestra las opciones (cada una es una funcion definida)
function menu() {
  echo "Seleccione una opción:"
  echo "1) Actualizar sistema"
  echo "2) Actualizar cabeceras"
  echo "3) Consultar el estado de FTP"
  echo "4) Consultar la dirección IP del servidor"
  echo "5) Agregar usuario"
  echo "6) Eliminar usuario"
  echo "7) Listar usuarios"
  echo "8) Cambiar contraseña de usuario"
  echo "9) Salir"
}

# Ciclo con la funcion de mostrar el menu y ciclar hasta que se requiera
while true; do
  menu
  read -p "Selecciona una opción: " opcion
  case $opcion in
    1) actualizar ;;
    2) actualizar_cabeceras ;;
    3) revisar_estadoFTP ;;
    4) ver_ips ;;
    5) agregar_usuario ;;
    6) eliminar_usuario ;;
    7) list_u ;;
    8) cambiar_c ;;
    9) echo "Saliendo..."; exit 0 ;;
    *) echo -e "${rojo}Opción no válida${sc}" ;;
  esac
done

