#!/bin/bash
# Script hecho por @05545 en github.com
# Script que genera una combinación de carácteres segura

# Longitud de la contraseña
echo "Ingresa la longitud de la contraseña (en enteros):"
read longitud

if [ $longitud -lt 8 ]
then
  echo "Longitud no valida. Tiene que ser mayor a 8"
else
  # Generar contraseña segura
  contra=$(openssl rand -base64 48 | cut -c1-$longitud)
  echo "La contraseña generada es: $contra"
fi


echo "Script ejecutado con éxito"
