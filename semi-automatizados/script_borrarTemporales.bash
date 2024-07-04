#!/bin/bash
# Script hecho por @05545 en github.com
# Script para eliminar archivos temporales del sistema y liberación parcial de memoria

echo "A continuación se eliminarán los archivos temporales"

# Limpia archivos temporales del sistema
sudo rm -rf /temp/*

# Elimina la caché del sistema
sudo apt-get clean

# Elimina los paquetes que no son necesarios
sudo apt-get autoremove
sudo apt-get autoclean

# Vacía la papelera de reciclaje
rm -rf ~/.local/share/Trash/*

# Busca y elimina archivos temporales
sudo find / -type f -name '*.tmp' -delete
sudo find / -type f -name '*.swp' -delete

# Mensjae final
echo "Script finalizado correctamente"
