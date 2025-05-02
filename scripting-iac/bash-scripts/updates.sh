#!/bin/bash

# Nombre del archivo
file="service.ts"

find . -type f -path "*/"$file -exec sed -i 's/exports\.Create = function ({ toExport }) {/exports\.Create = function (params: { [key: string]: any }) {/' {} \;

content_to_add="        vpcStack: params.vpcStack,
        netStack: params.netStack,
        clustersStack: params.clustersStack,"
escaped_content=$(echo "$content_to_add" | sed ':a;N;$!ba;s/\n/\\n/g')
# Buscar la línea que contiene "const service = servicesRs.create({"
for i in analytics assessments credentials company course jelper learning-hub lxp-lms middleware strapi student user-central ; do

    line_number=$(grep -n "const service = servicesRs.create({" "$i/$file" | cut -d ":" -f 1)
    # Verificar si se encontró la línea
    if [ -n "$line_number" ]; then
    # Insertar el nuevo contenido después de la línea encontrada
    sed -i "${line_number}a\\${escaped_content}" "$i/$file"
    echo "Contenido agregado con éxito."
    else
    echo "No se encontró la línea en el archivo."
    fi
done
