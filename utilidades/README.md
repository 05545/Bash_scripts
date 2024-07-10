# Scripts de utilidades administrativas
Esta carpeta contiene scripts de utilidad general.

## Tabla de Contenidos
1. [Lista de scripts](#lista-de-scripts)
2. [Requisitos](#requisitos)
4. [Forma de uso](#forma-de-uso)

## Lista de scripts
### 1. `script_adminFTP.bash`
   - **Descripción**: Gestiona tareas básicas en un servidor FTP en Kali Linux. Permite actualizar el sistema, verificar el estado del FTP, consultar la IP, agregar o eliminar usuarios, listar usuarios y cambiar contraseñas.
   - **Uso (solo ejecuta una vez)**: 
     ```bash
     sudo bash script_borrarTemporales.bash
     ```
   - **Archivo disponible:** [Script para administración básica de FTP](script_adminFTP.bash)
### 2. `script_ftp.bash`
   - **Descripción**: Instala la herramienta VSFTPD, reinicia el servidor y muestra su estado con la IP del servidor FTP habilitado.
   - **Uso (solo ejecuta una vez)**: 
     ```bash
     sudo bash script_ftp.bash
     ```
   - **Archivo disponible:** [Script para instalar VSFTPD](script_ftp.bash)

## Requisitos
- **bash** instalado en el emulador de terminal (versión 4.0 o superior recomendada)
- Permisos de administrador para algunos scripts (por ejemplo, `sudo`). Se le otorgan porque para algunos scripts puede ser indispensable, en caso de no ser necesario, el ejecutarlo con el uso de 'sudo' no debería de causar problemas.

## Forma de uso
### Ejecución de cada script en .bash
Se puede utilizar el comando en consola:
```bash
sudo bash nombreScript.bash
```
### Ejecución de cada script en .sh
Si el script lo ha cambiado de .bash a .sh y le ha otorgado permisos de ejecución entonces puede utilizar:
```bash
./nombreScript.sh
```
