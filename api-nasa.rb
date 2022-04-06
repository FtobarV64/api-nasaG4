# En este desafío nos conectaremos a la API de la NASA para descargar fotos de los Rovers y
# filtrar resultados acorde a lo pedido.
# ¿Qué tenemos que saber para enfrentarnos a esta prueba?
# ● Consumo de una API Rest con autenticación sencilla.
# ● Crear métodos que reciban parámetros.
# ● Iterar resultados dentro de un hash y un arreglo.
# ● Filtrar resultados dentro de un hash y un arreglo.
# ● Guardar los resultados dentro de un archivo.
# Requerimientos
# 1. Crear el método request que reciba una url y el api_key y devuelva el hash con los
# resultados.
# Concatenar la API Key en la siguiente url
# https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key
# =DEMO_KEY
# 2. Crear un método llamado buid_web_page que reciba el hash de respuesta con todos
# los datos y construya una página web. Se evaluará la página creada y tiene que tener
# este formato:
# <html>
# <head>
# </head>
# <body>
# <ul>
# <li><img src='.../398380645PRCLF0030000CC AM04010L1.PNG'></li>
# <li><img src='.../398381687EDR_F0030000CCAM05010M_.JPG'></li>
# </ul>
# </body>
# </html>
# Se revisará la estructura del documento generado.
# 3. Pregunta bonus: Crear un método photos_count que reciba el hash de respuesta y
# devuelva un nuevo hash con el nombre de la cámara y la cantidad de fotos.