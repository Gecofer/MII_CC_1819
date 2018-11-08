#!/bin/bash

if [[ "${URL}" == "" ]]; then
    URL="http://localhost:5000"
fi

echo "Arranca AUTO_TEST."
curl "${URL}/item"
echo -e "\n\nCreamos ITEMs:"
curl -X PUT "${URL}/item/prueba1/1/100"
curl -X PUT "${URL}/item/prueba2/2/200"
curl -X PUT "${URL}/item/prueba3/3/300"
curl -X PUT "${URL}/item/prueba1/1/100"

#echo -e "\n\nRealizamos consultas."
#echo "Mostramos ITEMs:"
#curl "${URL}/item"
#echo -e "\n\nMostramos ID:"
#curl "${URL}/item/ID_prueba1"
#echo -e "\n\nMostramos NOMBRE:"
#curl "${URL}/item/X/prueba1"

echo -e "\n\nACTUALIZAMOS"
curl -X POST "${URL}/item/prueba2/4/400"
echo -e "\n\nMostramos ITEMs:"
curl "${URL}/item"

echo -e "\n\nBORRAMOS"
curl -X DELETE "${URL}/item/ID_prueba3"
echo -e "\n\nVOLVEMOS A BORRAR EL MISMO"
curl -X DELETE "${URL}/item/ID_prueba3"
echo -e "\n\nINTENTAMOS ACTUALIZAR EL BORRADOA"
curl -X POST "${URL}/item/prueba3/4/400"


echo -e "\n\nFIN."
