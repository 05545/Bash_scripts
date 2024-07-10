# Scripts automatizados
Esta carpeta contiene scripts diseñados para ser ejecutados completamente de forma automatizada. Aunque pueden ser ejecutados manualmente, están pensados para ser ejecutados de forma automática según la configuración.

## Tabla de Contenidos
1. [Lista de scripts](#lista-de-scripts)
2. [Requisitos](#requisitos)
4. [Forma de uso](#forma-de-uso)

## Lista de scripts
### 1. `script_monitorRecursos.bash`
   - **Descripción**: Genera un reporte sobre el uso de CPU, uso de memoria, espacio disponible en disco y errores generados en terminal durante la sesión activa.
   - **Uso manual (solo ejecuta una vez)**: 
     ```bash
     sudo bash script_monitorRecursos.bash
     ```
   - **Archivo disponible:** [Script generador de reportes de recursos utilizados](/script_monitorRecursos.bash)

## Requisitos
- **bash** instalado en el emulador de terminal (versión 4.0 o superior recomendada)
- Permisos de administrador para algunos scripts (por ejemplo, `sudo`)

## Forma de uso
### Ejecución manual
Si se quiere ejecutar el script manualmente, y sin programar su repetición, simplemente use el siguiente comando:
```bash
sudo bash nombreScript.bash
```

### Ejecución automática
Para que el script se ejecute de manera constante a intervalos regulares, puedes configurarlo usando cron. Aquí te mostramos cómo hacerlo:

1. Abra el archivo de crontab para editar:
    ```bash
    crontab -e
    ```
2. Agregue una nueva línea al archivo para configurar el intervalo de tiempo. Por ejemplo:
  - Para ejecutar el script cada 5 minutos:
    ```bash
    */5 * * * * /bin/bash /ruta/a/la/carpeta/scripts/nombreScript.bash
    ```
  - Para ejecutar el script cada 10 minutos:
    ```bash
    */10 * * * * /bin/bash /ruta/a/la/carpeta/scripts/nombreScript.bash
    ```
  - Para ejecutar el script cada hora:
    ```bash
    0 * * * * /bin/bash /ruta/a/la/carpeta/scripts/nombreScript.bash
    ```
  - Para ejecutar el script una vez al día a las 3 AM:
    ```bash
    0 3 * * * /bin/bash /ruta/a/la/carpeta/scripts/nombreScript.bash
    ```
3. Guarde el archivo crontab. Esto activará el cron job con el intervalo de tiempo especificado.

 ### Deshabilitar la ejecución automática
Si se necesita que el script ya no tiene que ejecutarse constantemente, se puede eliminar el cron job:
1. Abrir el archivo de crontab.
   ```bash
   crontab -e
   ```
3. Eliminar o comentar la línea que contiene el cron job para el script.
4. Guardar y cerrar el archivo.
