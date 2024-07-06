#!/bin/bash
# Script hecho por @05545 en github.com
# Script que funciona como filtro para conocer los servicios y procesos activos en el sistema
# Al mismo tiempo genera un reporte en formato txt
# Hecho y probado en sistema Kali Linux (Debian)

# Archivo de reporte
reporte="reporte_servicios.txt"

# Función que maneja errores
function manejar_error(){
  echo "Error: $1"
  exit 1
}

# Fecha y hora del reporte
{
  echo "Reporte de servicios activos - $(date)"
  echo "----------------------------------------"
} > $reporte || manejar_error "No se pudo escribir en el archivo de reporte"

# Función que devuelve los servicios activos y administrados por systemd
function servicios_activos(){
  {
    echo "Servicios activos (systemd)"
    echo "----------------------------"
    systemctl list-units --type=service --state=running
    echo ""
  } >> $reporte || manejar_error "Error al obtener los servicios activos"
}

# Funcion que devuelve los servicios detenidos y administrados por systemd
function servicios_detenidos(){
 {
  echo "Servicios detenidos (systemd)"
  echo "-----------------------------"
  systemctl list-units --type=service --state=exited
  echo ""
 } >> $reporte || manejar_error "Error al obtener los servicios detenidos"
}

# Función que devuelve los servicios que han fallado en la ejecución o en el proceso
function servicios_fallidos(){
 {
  echo "Servicios fallidos (systemd)"
  echo "----------------------------"
  systemctl --failed --type=service
  echo ""
 } >> $reporte || manejar_error "Error al obtener los servicios fallidos"
}

# Función que devuelve los servicios habilitados en el arranque
function servicios_arranque(){
 {
  echo "Servicios habilitados en el arranque"
  echo "------------------------------------"
  systemctl list-unit-files --type=service --state=enabled
  echo ""
 } >> $reporte || manejar_error "Error al obtener los servicios habilitados en el arranque"
}


# Función que devuelve los procesos en ejecución
function procesos_ejecucion(){
  {
    echo "Procesos en ejecución"
    echo "---------------------"
    ps aux
    echo ""
  } >> $reporte || manejar_error "Error al obtener los procesos en ejecución"
}

# Función que devuelve los 5 procesos que más consumen CPU
function cpu_procesos(){
 {
  echo "Procesos que más utilizan CPU"
  echo "-----------------------------"
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=%cpu | head -n 6
  echo ""
 } >> $reporte || manejar_error "Error al obtener los procesos en consumo mayor de CPU"
}

# Función que devuelve los 5 procesos que más consumen memoria
function memoria_procesos(){
 {
  echo "Procesos que más utilizan espacio en memoria"
  echo "--------------------------------------------"
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=%mem | head -n 6
  echo ""
 } >> $reporte || manejar_error "Error al obtener los procesos en consumo mayor de memoria"
}

# Función que devuelve los servicios de red en escucha
function red_escucha(){
  {
    echo "Servicios de red en estado de escucha"
    echo "-------------------------------------"
    ss -tuln
  } >> $reporte || manejar_error "Error al obtener los servicios de red"
}

# Función para mostrar ayuda
function mostrar_ayuda(){
  echo "Uso: $0 [opciones]"
  echo "Uso de ejemplo: sudo bash script_scannerServicios.bash -h"
  echo "Opciones:"
  echo "[Servicios]"
  echo "  -a    Obtener servicios activos"
  echo "  -d    Obtener servicios detenidos"
  echo "  -f    Obtener servicios fallidos"
  echo "  -e    Obtener servicios habilitados en arranque"
  echo ""
  echo "[Procesos]"
  echo "  -c    Obtener procesos con más uso de CPU"
  echo "  -m    Obtener procesos con más uso de memoria" 
  echo "  -p    Obtener procesos en ejecución"
  echo ""
  echo "[Servicios de red]"
  echo "  -r    Obtener servicios de red en escucha"
  echo ""
  echo "[Extras]"
  echo "  -h    Mostrar esta ayuda"
  exit 0
}

# Procesar opciones de línea de comandos
while getopts "adfecmprh" opt; do
  case ${opt} in
    a )
      servicios_activos
      ;;
    d )
      servicios_detenidos
      ;;
    f )
      servicios_fallidos
      ;;
    e )
      servicios_arranque
      ;;
    c )
      cpu_procesos
      ;;
    m )
      memoria_procesos
      ;;
    p )
      procesos_ejecucion
      ;;
    r )
      red_escucha
      ;;
    h )
      mostrar_ayuda
      ;;
    \? )
      mostrar_ayuda
      ;;
  esac
done

# Verificar si no se pasó ninguna opción
if [ $OPTIND -eq 1 ]; then
  mostrar_ayuda
fi

# Mensaje final
echo "Reporte generado en $reporte"

# Mostrar el reporte al usuario
cat $reporte || manejar_error "No se pudo leer el archivo de reporte"


