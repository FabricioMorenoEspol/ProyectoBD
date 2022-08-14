

def EliminarDatos(conn):

    """ Implementacion de la interfaz """
    print("Qué proceso desea realizar:")
    print("1. Eliminar campana")
    print("2. Eliminar conjunto de anuncios")
    print("3. Eliminar anuncio")

    procesoSeleccionado = int(input("Seleccione su respuesta: "))

    while not (procesoSeleccionado>=1 and procesoSeleccionado<=3):
        procesoSeleccionado=int(input("Seleccione su respuesta: "))

    consultaDesactivarErrorKeys= f"SET FOREIGN_KEY_CHECKS=OFF"
    if(procesoSeleccionado == 1):
        nombreCampana = input("Digite el nombre de la camapaña que desee eliminar: ")
        conn.execute(consultaDesactivarErrorKeys)
        CONSULTA1 = f"delete from CAMPAÑA where Nombre = '{nombreCampana}' "
        conn.execute(CONSULTA1)
    elif(procesoSeleccionado == 2):
        nombreConjuntoAnuncio = input("Digite el nombre del conjunto de anuncios que desee eliminar: ")
        conn.execute(consultaDesactivarErrorKeys)
        CONSULTA2 = f"delete from CONJUNTO_DE_ANUNCIOS where Nombre = '{nombreConjuntoAnuncio}'"
        conn.execute(CONSULTA2)
    elif(procesoSeleccionado == 3):
        nombreAnuncio = input("Digite el nombre del anuncio que desee eliminar: ")
        conn.execute(consultaDesactivarErrorKeys)
        CONSULTA3 = f"delete from ANUNCIO where Nombre = '{nombreAnuncio}' "
        conn.execute(CONSULTA3)

    print("Registro eliminado con éxito!")

    return None