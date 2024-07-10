#!/bin/bash
# Script hecho por @05545 en github.com
# Script que genera un reporte de los recursos utilizados en el sistema
# Escrito y probado en sistema Debian

# Configuración del archivo de salida
SALIDA_DIR="$HOME/informes_sistema"
SALIDA_ARC="$SALIDA_DIR/informe_sistema_$(date +%Y%m%d_%H%M%S).txt"

# Crear directorio de salida si no existe
mkdir -p $SALIDA_DIR

# Recopilación de información del sistema
echo "Informe diario generado del sistema" > $SALIDA_ARC
echo "Fecha: $(date)" >> $SALIDA_ARC
echo "" >> $SALIDA_ARC

# Tiempo de actividad del sistema
echo "Tiempo de actividad del sistema:" >> $SALIDA_ARC
uptime -p >> $SALIDA_ARC
echo "" >> $SALIDA_ARC

# Uso de CPU
echo "Uso de CPU:" >> $SALIDA_ARC
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"% utilizado"}' >> $SALIDA_ARC
echo "" >> $SALIDA_ARC

# Uso de memoria
echo "Uso de memoria:" >> $SALIDA_ARC
free -m | awk 'NR==2{printf "Memoria usada: %sMB (%.2f%%)\n", $3,$3*100/$2 }' >> $SALIDA_ARC
echo "" >> $SALIDA_ARC

# Espacio en disco
echo "Espacio en disco:" >> $SALIDA_ARC
df -h | grep -E '^(/dev/root|/dev/sda1|/dev/nvme0n1p1)' >> $SALIDA_ARC
echo "" >> $SALIDA_ARC

# Registro de errores (últimas 10 líneas)
echo "Últimos errores del sistema:" >> $SALIDA_ARC
journalctl -p err -n 10 >> $SALIDA_ARC
echo "" >> $SALIDA_ARC

echo "Informe del estado del sistema guardado en $SALIDA_ARC"
