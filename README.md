# zerologon

Canal de youtube  https://youtube.com/c/Anonimo501

Grupo en Telegram https://t.me/Pen7esting

## zerologon

El script de zerologon nos automatiza por completo el ataque logrando ahorrar tiempo en las auditorias de pentestg, se debe tener encuenta que para el uso del script se debe tener un permiso de la empresa que se esta auditando y dos un backup de DC/AD ya que el ataque puede probocar daños en el DC.

en la opcion1 descarga el checker, con la opcion2 ejecuta el checker y verifica si el servidor es vulnerable a zerologon, en la opcion3 descargamos
los repositorios necesarios para que en la opcion4 podamos ejecutar ya el ataque y lograr vulnerar el servidor DC el cual si todo ha ido bien hasta ahora nos imprimira 
en pantalla los hash del DC/AD incluyendo el de los Administradores.

# Ver tambien zerologon-restore

tener encuenta que ejecutar el script es algo peligroso ya que causa daños en el servidor por que elimina o cambia la contraseña, para corregir este error se ha creado el siguiente script para ejecutar luego del ataque y reparar los daños: https://github.com/Anonimo501/zerologon-restore 

El script se ejecuto sobre ParrotOS 4.11

## Version del Script
Version 1

![zerologon](https://user-images.githubusercontent.com/67207446/153074826-53adb1b7-d196-4390-aedf-e7bdf756133a.png)

## Uso

git clone https://github.com/Anonimo501/zerologon.git

cd zerologon/

chmod +x zerologon.sh

./zerologon.sh


# Referencias

SecuraBV        https://github.com/SecuraBV/CVE-2020-1472
pypa            https://github.com/pypa/virtualenv
SecureAuthCorp  https://github.com/SecureAuthCorp/impacket
dirkjanm        https://github.com/dirkjanm/CVE-2020-1472
