#!/bin/bash

imagen="{añade aqui la imagen}"
# tienes que tener la libreria rockyou.txt
archivo_contrasenas="rockyou.txt"

if [ ! -f "$archivo_contrasenas" ]; then
    echo "Error: El archivo de contrasenas '$archivo_contrasenas' no existe."
    exit 1
fi

while IFS= read -r contrasena; do
    steghide extract -sf "$imagen" -p "$contrasena"
    if [ $? -eq 0 ]; then
        echo "Contrasena encontrada: $contrasena"
        exit 0
    else
        echo "Intento fallido con contraseña: $contrasena"
    fi
done < "$archivo_contrasenas"

echo "No se encontró la contrasena."
exit 1
