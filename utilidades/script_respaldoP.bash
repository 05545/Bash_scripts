#!/bin/bash
# Script hecho por @05545 en github.com
# Script para guardar una copia de seguirdad de una carpeta o de un archivo en especifico

# Lectura y validación de directorio a respaldar
echo "Ingresa la ruta del directorio/archivo que quieres respaldar: "
read ruta_respaldo

if [ ! -e "$ruta_respaldo" ]
then
  echo "El directorio o archivo no se ha encontrado en la ruta especificada."
  exit 1
fi

# Lectura y validación del directorio de destino
echo "Ingresa la ruta del directorio donde se guardará el respaldo: "
read destino_respaldo

if [ ! -e "$destino_respaldo" ]
then
  echo "El directorio de destino no se ha encontrado."
  exit 1
fi

# Nombre del archivo generado para respaldo
FECHA=$(date +%Y%m%d_%H%M%S)
ARCHIVO_RESPALDO="respaldo_$FECHA.tar.gz"

# Crear el archivo de respaldo
tar -czf "$destino_respaldo/$ARCHIVO_RESPALDO" -C "$(dirname "$ruta_respaldo")" "$(basename "$ruta_respaldo")"

# Verificar si el respaldo se ha creado correctamente
if [ $? -eq 0 ]
then
  echo "Respaldo completado con éxito en $destino_respaldo/$ARCHIVO_RESPALDO"
else
  echo "Ha ocurrido un error. El respaldo no se ha creado"
  exit 1
fi

