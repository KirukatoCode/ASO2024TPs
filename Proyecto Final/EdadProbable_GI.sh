#!/bin/bash

# ¡Buenas! Este es mi código de la parte 2 del TP 5.
# Lo primero es una directiva especial, le indica al sistema que use el intérprete de Bash para ejecutar correctamente el script.

# Luego, pedimos al usuario que ingrese un nombre y lo leemos.
echo -n "Introduce un nombre: "
read nombre

# Realizamos la solicitud a la API y guardamos su respuesta ante el nombre ingresado.
Response=$(curl -s "https://api.agify.io/?name=$nombre")

# Para hacer funcionar este script, nececite jq, por lo que por si las dudas, verifico que el usuario tambien lo tenga instalado.
if ! command -v jq &> /dev/null
then
    echo "El programa jq no está instalado. Instálalo para continuar."
    exit 1
fi

# Ahora, extraemos la edad probable de la respuesta JSON usando jq y le quitamos las comillas.
ProbableAge=$(echo $Response | jq -r '.age')

# Finalmente, verificamos si se recibió una edad válida para mostrarle al usuario.
if [ "$ProbableAge" != "null" ]; then
    echo "La edad probable para el nombre $nombre es $ProbableAge años."
else
    echo "No pudimos determinar la edad probable para el nombre $nombre."
fi

# Ha sido un gusto, gracias por el tiempo. ¡Nos vemos!
#   ~ KirukatoCode✨