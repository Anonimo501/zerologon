# zerologon

Canal de youtube  https://youtube.com/c/Anonimo501

Grupo en Telegram https://t.me/Pen7esting

## zerologon

El script de zerologon en la opcion1 descarga el checker, con la opcion2 ejecuta el checker y verifica si el servidor es vulnerable a zerologon, en la opciontres descargamos
los repositorios necesarios para que en la opcion4 podamos ejecutar ya el ataque y lograr vulnerar el servidor DC el cual si todo ha ido bien hasta ahora nos imprimira en pantalla
las hash del DC incluyendo el de los Administradores, copiamos y pegamos en un bloc de notas los hash para posteriormente pasar a la opcion5 y ejecutar un ataque de 
Pass The Hash y lograr obtener una CMD dentro del servidor Victima.

El script se ejecuto sobre ParrotOS 4.11

## Version del Script
Version 1

![Captura](https://user-images.githubusercontent.com/67207446/119861302-d7f25e80-bedc-11eb-8d1c-58185ab7f283.PNG)

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
