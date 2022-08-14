from sqlalchemy import create_engine, Table, MetaData,select
import pymysql
def ActualizarDatos(connection):

    opcion =0
    while opcion!=4:
        print("""Qué proceso desea realizar:
    1.Actualizar datos de campaña
    2.Actualizar datos de un conjunto de anuncios
    3.Actualizar datos de un anuncio
    4.Salir
    """)
        opcion = int(input("Ingrese una opcion: "))
        if opcion == 1:
            print("1.Actualizar nombre\n2.Actualizar objetivo")
            opcionC1=int(input("Eliga una opcion:"))

            resultsC1 = connection.execute("select ID_Campaña,Nombre from Campaña;").fetchmany(size=10)

            for id, nombre in resultsC1:
                print(str(id) + "----->" + nombre)
            id = input("Eliga una campaña: ")

            if opcionC1==1:
                nombre = input("Ingrese el nuevo nombre: ")
                connection.execute(actualizarNombre(id, nombre, "Campaña"))
                print("Nombre Cambiado!!")
            elif opcionC1==2:
                print("""1-Reconocimiento_De_Marca
2-Alcance
3-Trafico
4-Interaccion
5-Instalacion_De_App
6-Reproducciones_De_Video
7-Generacion_De_Clientes_Potenciales
8-Mensajes
9-Conversiones
10-Ventas_Del_Catalogo
11-Trafico_De_Negocio""")
                idObj = input("Eliga un objetivo: ")
                connection.execute("update Descripcion set Tipo_Objetivo="+idObj+" where ID_Campaña="+id)
                print("Objetivo Cambiado!!")






        elif opcion==2:
            print("1.Actualizar nombre\n2.Actualizar presupuesto")
            opcionC2 = int(input("Eliga una opcion:"))

            resultsC2 = connection.execute("select  ID_ConjuntoAnuncio, Nombre from Conjunto_De_Anuncios;").fetchmany(size=10)

            for idCA, nombreCA in resultsC2:
                print(str(idCA) + "----->" + nombreCA)
            idCDA = input("Eliga un conjunto de anuncios: ")

            if opcionC2==1:
                nombreCa = input("Ingrese el nuevo nombre: ")
                connection.execute(actualizarNombre(idCDA, nombreCa, "Conjunto_De_Anuncios"))
                print("Nombre Cambiado!!")
            elif opcionC2==2:
                presupuesto=float(input("Ingrese el nuevo presupuesto: "))
                connection.execute("update Conjunto_De_Anuncios set Presupuesto=" + presupuesto + " where ID_Conjunto_De_Anuncios=" + idCDA)
                print("Presupuesto Cambiado!!")




        elif opcion==3:
            print("1.Actualizar nombre\n2.Actualizar contenido\n3.Actualizar tipo de formato ")
            opcionC3=int(input("Eliga una opcion:"))

            resultsC3 = connection.execute("select ID_Anuncio,Nombre from Anuncio;").fetchmany(size=10)

            for idA, nombreA in resultsC3:
                print(str(idA) + "----->" + nombreA)
            idAn = input("Eliga un Anuncio: ")

            if opcionC3==1:
                nombreAn = input("Ingrese el nuevo nombre: ")
                connection.execute(actualizarNombre(idAn, nombreAn, "Anuncio"))
                print("Nombre Cambiado!!")
            elif opcionC3==2:
                titulo=input("Ingrese el nuevo titulo del anuncio: ")
                tPrincipal=input("Ingrese el nuevo texto principal del anuncio: ")
                tSegundario=""
                url=""
                op = input("¿Desea que el anuncio tenga texto segundario?")
                if op.lower()=="si":
                    tSegundario=input("Ingrese el nuevo texto segundario del anuncio: ")

                op2 = input("¿Desea que el anuncio tenga un URL relacionado?")
                if op2.lower()=="si":
                    url=input("Ingrese el nuevo URL de sitio web del anuncio: ")

                connection.execute("update Contenido set Titulo='"+titulo+"', Texto_Principal='"+tPrincipal+"',Texto_Segundario='"+tSegundario+"', URL_SitioWeb='"+url+"' where ID_Anuncio="+idAn)

                print("Contenido Actualizado!!")
            elif opcionC3==3:
                print("""1-Imagen
2-Video
3-Coleccion
4-Presentacion
""")
                idF=int(input("Ingrese el nuevo fromato del anuncio"))
                connection.execute("update Anuncio set Tipo_Formato="+idF+" where ID_Anuncio="+idAn)
                print("Tipo de Formato Cambiado!!")






    return None

def actualizarNombre(id,nombre, NomTabla):
    update= "update "+NomTabla+" set Nombre='"+nombre+"' where ID_"+NomTabla+"="+id
    return update