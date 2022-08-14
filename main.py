
from sqlalchemy import create_engine, Table, MetaData,select
import pymysql

import interfaces.GenerarReporte as c1
import interfaces.GenerarReporte as c2
import interfaces.ActualizarDatos as c3
import interfaces.EliminarDatos as c4

""" CREDENCIALES DE UNA BASE DE DATOS LOCAL MYSQL """
USER= "root"
PASSWORD = "Davidariel200"
IP = "127.0.0.1"
PORT = "3306"

"CONEXION A LA BASE DE DATOS"
engine = create_engine(f"mysql+pymysql://{USER}:{PASSWORD}@{IP}:{PORT}/FacebookAds")
connection = engine.connect()


print("Bienvenidos al sistema")
print("Qué proceso desea realizar:")
print("1.Crear una campaña")
print("2.Generar un reporte")
print("3.Actualizar Datos")
print("4.Eliminar datos")




connection.close()