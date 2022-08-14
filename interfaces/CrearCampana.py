""" from sqlalchemy import create_engine, Table, MetaData,select
import pymysql """

def CrearCampana(conn):
    objetivos = [
    "Marca",
    "Alcance",
    "Trafico sitio web",
    "Mensajes",
    "Generacion Lider",
    "Instalacion de app",
    "Compromiso",
    "Reproduccion deVideo",
    "Catalogo",
    "Trafico de tienda"]

    """ Implementacion de la interfaz """

    """ PROCESO CAMAPAÑA """
    campanaName = input("Digite el nombre de la campaña:")

    for i in range(len(objetivos)):
        print(f"{i+1}) {objetivos[i]}")


    campanaObjetivo = int(input("Digite el objetivo de la campaña (Seleccione solo lo que están disponibles en la lista): "))
    
    while not (campanaObjetivo>=1 and campanaObjetivo<=len(objetivos)):
        campanaObjetivo = int(input("Digite el objetivo de la campaña (Seleccione solo lo que están disponibles en la lista) "))-1
    

    campanaObjetivo = objetivos[campanaObjetivo]

    CONSULTA1 = f"insert into CAMPAÑA(Nombre,Categoria) values('{campanaName}','{campanaObjetivo}')"
    result1 = conn.execute(CONSULTA1)
    idTablaCampana = int(result1.lastrowid)
    


    """ PROCESO CONJUNTOS DE ANUNCIOS """

    print("A continuación se empieza con el proceso de conjuntos de anuncios ")

    conjuntosDeAnunciosACrear = int(input("Digite el total de conjuntos de anuncios a crear:"))

    for i in range(conjuntosDeAnunciosACrear):
        nombreConjuntoAnuncio = ""
        nombrePaginaReferencia = ""
        presupuesto = ""
        fechaInicio = ""
        fechaFin = ""
        horaInicio = ""
        horaFin=""

        print(f"Creación del conjunto de anuncio {i+1}")
        nombreConjuntoAnuncio= input("Nombre del conjunto de anuncio: ")
        nombrePaginaReferencia=input("Nombre de la pagina de referencia (instagram o facebook)")
        presupuesto=float(input("Presupuesto: "))
        fechaInicio=input("Fecha inicio:")
        fechaFin=input("Fecha fin: ")
        horaInicio=input("Hora inicio:")
        horaFin = input("Hora fin:")

        CONSULTA2 = f"insert into CONJUNTO_DE_ANUNCIOS(ID_CAMPAÑA,Pagina_Referencia,Nombre,Presupuesto) values({idTablaCampana},'{nombrePaginaReferencia}','{nombreConjuntoAnuncio}',{presupuesto})"
        result2 = conn.execute(CONSULTA2)
        idTablaConjuntoAnuncio = result2.lastrowid
        

        ubicacion = ""
        generacion = ""
        trabajo = ""
        edad = ""
        finanzas = ""
        genero = ""
        afinidadEtnica = ""
        padre = ""
        madre = ""
        comportamientos = ""

        print("A continuación se realizará el proceso de segmentación de la audiencia: ")
        ubicacion = input("Ubicación: ")
        generacion=input("Generación:")
        trabajo=input("Trabajo:")
        edad=int(input("Edad:"))
        finanzas=input("Finanzas:")
        genero=input("Género:")
        afinidadEtnica=input("Afinidad étnica:")
        padre=input("Padre:")
        madre=input("Madre:")
        comportamientos=input("Comportamientos:")
        
        CONSULTA3 = f"insert into AUDIENCIA(ID_ConjuntoAnuncio_De_Anuncios,Ubicacion,Generación,Trabajo,Edad,Finanzas,Género,Afinidad_étnica,Padre,Comportamientos,Madre) values({idTablaConjuntoAnuncio},'{ubicacion}','{generacion}','{trabajo}',{edad},'{finanzas}','{genero}','{afinidadEtnica}','{padre}','{comportamientos}','{madre}')"
        result3 = conn.execute(CONSULTA3)
        idTablaAudiencia = result3.lastrowid
        print(idTablaAudiencia)

        
        print("A continuación se empieza con el proceso de anuncios")
        anunciosACrear=int(input("Digite el total de anuncios a crear:"))
        
        for i in range(anunciosACrear):
            nombreAnuncio = ""
            tipoDeFormato = ""
            titulo = ""
            textoPrincipal = ""
            textoSecundario = ""
            link = ""

            print(f"Creación del anuncio {i+1}")
            nombreAnuncio=input("Nombre del anuncio:")
            
            print("1. imagen")
            print("2. video")
            print("3. coleccion")
            print("4. presentacion")
            tipoDeFormato=int(input("Tipo de formato:"))

            while not (tipoDeFormato>=1 and tipoDeFormato<=4):
                tipoDeFormato=int(input("Tipo de formato:"))


            titulo=input("Título: ")
            textoPrincipal=input("Texto principal: ")
            textoSecundario=input("Texto secundario(Opcional): ")
            link=input("Link: ")

            CONSULTA4 = f"insert into ANUNCIO (ID_ConjuntoAnuncio_De_Anuncios,Nombre,Tipo_Formato) values({idTablaConjuntoAnuncio},'{nombreAnuncio}', {tipoDeFormato})"
            result4 = conn.execute(CONSULTA4)
            idTablaAnuncio= result4.lastrowid
            print(idTablaAnuncio)


    return None
