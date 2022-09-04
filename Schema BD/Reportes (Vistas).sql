-- Reporte del total a pagar por cada Conjunto de Anuncios
use FacebookAds;
create view ViewTotalPagoCDA as
	select CA.nombre, sum(Cantidad_Pago) 
	from ANUNCIO A join CONJUNTO_DE_ANUNCIOS CA on A.ID_Conjunto_De_Anuncios = CA.ID_Conjunto_De_Anuncios 
	join FACTURA F on A.ID_Anuncio=F.ID_Anuncio 
	group by CA.Nombre;

-- Reporte del anuncio cuya factura fue la mas alta
create view ViewFacturaMasAlta as
	select A.Nombre, max(F.Cantidad_Pago) 
	from ANUNCIO A join FACTURA F on A.ID_Anuncio=F.ID_Anuncio
	 group by A.Nombre;
 
 -- Reporte de cantidad de anuncios publicados por cada campaña
 create view ViewNumAnunciosXCampaña as
	select cam.Nombre,count(ID_Anuncio) 
	from CAMPAÑA as cam, CONJUNTO_DE_ANUNCIOS as con, ANUNCIO anun 
	where cam.ID_Campaña=con.ID_Campaña and con.ID_Conjunto_De_Anuncios = anun.ID_Conjunto_De_Anuncios 
	group by cam.Nombre;

-- Reporte de los anuncios que tienen imagen o video
create view ViewAnuncioImagenOrVideo as
	select anun.Nombre 
	from ANUNCIO anun, TIPO_FORMATO tipf 
	where anun.Tipo_Formato=tipf.ID_formato and (tipf.Es_imagen = true or tipf.Es_video);

