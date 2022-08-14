

def GenerarReporte(connection):
    opcion = 0
    while opcion != 5:
        print("""Cual reporte dessea obtener:
        1.Reporte del total a pagar por cada Conjunto de Anuncios
        2.Reporte del anuncio cuya factura fue la mas alta
        3.Reporte de cantidad de anuncios publicados por cada campaña
        4.Reporte de los anuncios que tienen imagen o video
        5.Salir
        """)
        opcion = int(input("Ingrese una opcion: "))
        if opcion == 1:
            print("Reporte del total a pagar por cada Conjunto de Anuncios \nNombre | Total")

            consulta1 = "select CA.nombre, sum(Cantidad_Pago) from ANUNCIO A join CONJUNTO_DE_ANUNCIOS CA on A.ID_Conjunto_De_Anuncios = CA.ID_Conjunto_De_Anuncios join FACTURA F on A.ID_Anuncio=F.ID_Anuncio group by CA.Nombre;"
            results1 = connection.execute(consulta1).fetchmany(size=10)

            for nombre, Total in results1:
                print(nombre + "----->" + "$" + str(Total))
        elif opcion == 2:
            print("\nReporte del anuncio cuya factura fue la mas alta \nNombre | Total")

            consulta2 = "select A.Nombre, max(F.Cantidad_Pago) from ANUNCIO A join FACTURA F on A.ID_Anuncio=F.ID_Anuncio group by A.Nombre"
            results2 = connection.execute(consulta2).fetchmany(size=10)

            for nombre, Total in results2:
                print(nombre + "----->" + "$" + str(Total))
        elif opcion == 3:
            print(
                "\nReporte de cantidad de anuncios publicados por cada campaña \nCampana | Total anuncios publicados ")

            consulta3 = "select cam.Nombre,count(ID_Anuncio) from CAMPAÑA as cam, CONJUNTO_DE_ANUNCIOS as con, ANUNCIO anun where cam.ID_Campaña=con.ID_Campaña and con.ID_Conjunto_De_Anuncios = anun.ID_Conjunto_De_Anuncios group by cam.Nombre"
            results3 = connection.execute(consulta3).fetchmany(size=10)

            for nombreCam, totalAnun in results3:
                print(nombreCam, totalAnun)
        elif opcion == 4:
            print("\nReporte de los anuncios que tienen imagen o video \nAnuncio | es imagen o video")

            consulta4 = "select anun.Nombre from ANUNCIO anun, TIPO_FORMATO tipf where anun.Tipo_Formato=tipf.ID_formato and (tipf.Es_imagen = true or tipf.Es_video)"
            results4 = connection.execute(consulta4).fetchmany(size=10)

            for nombreAnun, in results4:
                print(nombreAnun)


    return None