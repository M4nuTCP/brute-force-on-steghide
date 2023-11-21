#!/bin/bash

imagen="2c7adab65d34876a374a1069c155c4d5e1361753e53c4ebc73b127039368aa441d0ec50980fa8cad66615f1b18c0bee0dff1cc5c6d994f559cfc1f0371501fb3.jpg"
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
