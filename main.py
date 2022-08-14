
import dotenv
from sqlalchemy import create_engine, Table, MetaData,select
import pymysql
from dotenv import load_dotenv
import os


import interfaces.CrearCampana as c1
import interfaces.GenerarReporte as c2
import interfaces.ActualizarDatos as c3
import interfaces.EliminarDatos as c4

""" CARGANDO VARIABLES DE ENTORNO """
load_dotenv()

""" CREDENCIALES DE UNA BASE DE DATOS LOCAL MYSQL """
USER= "root"
PASSWORD = os.getenv("PASSWORD")
IP = "127.0.0.1"
PORT = "3306"

"CONEXION A LA BASE DE DATOS"
engine = create_engine(f"mysql+pymysql://{USER}:{PASSWORD}@{IP}:{PORT}/FacebookAds")
connection = engine.connect()


opcElegida = 0

while not opcElegida == 5:
    
    print("Bienvenidos al sistema")
    print("Qué proceso desea realizar:")
    print("1.Crear una campaña")
    print("2.Generar un reporte")
    print("3.Actualizar Datos")
    print("4.Eliminar datos")
    print("5.Salir")

    opcElegida = int(input("Seleccione su respuesta: "))

    while not (opcElegida>=1 and opcElegida<=5):
        opcElegida=int(input("Seleccione su respuesta: "))
        if opcElegida == 1:
            c1.CrearCampana(connection)
        elif opcElegida == 2:
            c2.GenerarReporte(connection)
        elif opcElegida == 3:
            c3.ActualizarDatos(connection)
        elif opcElegida == 4:
            c4.EliminarDatos(connection)
        elif opcElegida == 5:
            print("Bye")

connection.close()