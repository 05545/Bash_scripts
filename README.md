# Colección de Scripts en Bash

## Presentación
Este repositorio contiene una variedad de scripts útiles diseñados para automatizar tareas, gestionar operaciones del sistema y mejorar la productividad. Con el tiempo se irá actualizando y agregando aun más funcionalidades. La meta de este pequeño proyecto es reforzar el conocimiento sobre Bash Scripting y obtener la automatización o semi-automatización de tareas.

## Tabla de Contenidos
1. [Presentación](#presentación)
2. [Clonación del repositorio](#clonación-del-repositorio)
3. [Forma de uso](#forma-de-uso)
4. [Instalación de bash](#instalación-bash)
5. [Scripts automatizados](automatizados/)
6. [Scripts semi-automatizados](semi-automatizados/)
   - [Script de instalación vsftpd](semi-automatizados/script_ftp.bash)
   - [Script para liberar memoria de archivos temporales](semi-automatizados/script_borrarTemporales.bash)
7. [Utilidades administrativas](utilidades/)
   - [Script de administración para FTP](utilidades/script_adminFTP.bash)
   - [Script generador de contraseñas](utilidades/script_generadorContra.bash)
   - [Script para hacer copias de seguridad de directorios especificos](utilidades/script_respaldoP.bash)
   - [Script para el listado de servicios y procesos activos](utilidades/script_scannerServicios.bash)

## Clonación del repositorio
En caso de que no se tenga instalado git, se tiene que ejecutar primero:
```sh
sudo apt update
sudo apt install git
git --version
```
Posteriormente, clonar el repositorio con:
```sh
git clone https://github.com/05545/Bash_scripts.git
```
## Forma de uso
Los archivos dentro de este repositorio son con extensión **.bash**, por lo que al descargar un solo archivo, o en su defecto, todo el repositorio, e intentar ejecutar el archivo especifico se utiliza el comando:
```sh
sudo bash nombre_archivo.bash
```
> Se utilizan los permisos de superusuario porque algunos scripts requieren privilegios elevados para su correcto funcionamiento. En caso de que no los necesiten, otorgar permisos de superusuario no debería causar problemas.

Para convertir un archivo **.bash** a **.sh** y hacerlo ejecutable, se puede utilizar el siguiente comando:
```sh
mv archivo.bash archivo.sh
```
Para ejecutar un archivo **.sh** se utiliza el comando:
```sh
./archivo.sh
```
> **Nota:** "archivo" hace referencia al nombre del archivo.

## Instalación bash
Para asegurarse de que se tienen todos los requisitos necesarios, ejecute los siguientes comandos: 
```bash 
sudo apt update
sudo apt install bash
bash --version
```
