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

require "uri"
require "net/http"
require "json"

# 1. Crear el método request que reciba una url y el api_key y devuelva el hash con los
# resultados.
def request(url, api_key)
    url = URI(url+api_key)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    response = JSON.parse(response.read_body)
end
# Prueba del método con dos argumentos 
data = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=","ZXliFADZo3aNDlJSHxU6P2vf37CHG5ZdED1HPwmZ")

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
# Creación del método solicitado
def buid_web_page(hash)
    # Extraemos el arreglo del hash correspondiente al key photos
    selected_data = hash["photos"]
    # Filtramos para solo extraer las 20 primeras fotografías
    selected_data = selected_data[0..19]
    # Construimos la parte superior e inferior de un html
    html_up= "<!DOCTYPE html>\n<html lang='es'>\n<head>\n<meta charset='UTF-8'>\n<meta http-equiv='X-UA-Compatible' content='IE=edge'>\n<meta name='viewport' content='width=device-width, initial-scale=1.0'>\n<title>Fotos Api Nasa</title>\n</head>\n<body>\n<ul>\n"
    html_down="</ul>\n</body>\n</html>"
    html_img=""
    # Recorrer el arreglo a fin de leer el hash y extraer las imagenes
    selected_data.each do |hash_int|
        html_img += "\t<li style='list-style: none; text-align: center;'><img width=600px src='#{hash_int["img_src"]}'></li>\n"
    end
    # Construimos el formato html con la parte superior, imagenes e inferior
    html =html_up+html_img+html_down
    # Creamos el archivo index.html con la estructura Html5 
    File.write('index.html',html)
end
# Probamos la ejecución del método
buid_web_page(data)