#!/bin/bash

# ¡Buenas! Este es mi código de la parte 1 del TP 5.
# Lo primero es una directiva especial, le indica al sistema que use el intérprete de Bash para ejecutar correctamente el script.

# Luego, generamos un número aleatorio que reducimos para que esté entre 1 y 100.
RandomNumber=$(((RANDOM % 100) + 1))

# Enviamos mensajes al usuario para hacer más cómoda la interacción...
echo "¡Bienvenido al juego de adivinar números!"
echo "Intenta adivinar el número oculto entre 1 y 100."

# Inicializamos variables...
TotalAttempts=0
GuessStatus=false

# Y empieza el bucle sobre el que se basa el juego. Se repetirá hasta que GuessStatus sea verdadero.
# Mientras, leerá lo que ingresa el usuario.
while ! $GuessStatus; do
    echo -n "Introduce tu número: "
    read CurrentAttempt

    # Verificamos si el input coincide como un número válido en todos sus caracteres antes de seguir...
    if ! [[ $CurrentAttempt =~ ^[0-9]+$ ]]; then
        echo "No es un número válido. Intenta de nuevo."
        continue
    fi

    # Vamos contando los intentos que le lleva adivinarlo...
    TotalAttempts=$((TotalAttempts + 1))

    # Para finalmente, comparar el número del usuario con el número aleatorio.
    # Siendo igual, gana, viendo sus intentos totales.
    # De ser distinto, le damos pistas para que logre adivinarlo, eventualmente...
    if [ $CurrentAttempt -eq $RandomNumber ]; then
        echo "¡Felicidades! Adivinaste el número oculto $RandomNumber en $TotalAttempts intentos."
        GuessStatus=true
    elif [ $CurrentAttempt -lt $RandomNumber ]; then
        echo "El número oculto es mayor que $CurrentAttempt. Intenta de nuevo."
    else
        echo "El número oculto es menor que $CurrentAttempt. Intenta de nuevo."
    fi
done

# Ha sido un gusto, gracias por el tiempo. ¡Nos vemos!
#   ~ KirukatoCode✨