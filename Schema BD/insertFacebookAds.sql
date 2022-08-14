use FacebookAds;
insert into CAMPAÑA(Nombre,Categoria) 
values('Trafico web','Credito'),
('Recomendacion App','Credito'),
('Catalogo','Credito'),
('Interaccion con clintes','TemasSociales'),
('Alcance','Empleo'),
('General','Credito'),
('Interes de los jovenes','TemasSociales'),
('Productos','Credito'),
('Novedades','TemasSociales'),
('Tienda fisica','Credito');

insert into OBJETIVOS(Reconocimiento_De_Marca) values(true);
insert into OBJETIVOS(Alcance) values(true);
insert into OBJETIVOS(Trafico) values(true);
insert into OBJETIVOS(Interaccion) values(true);
insert into OBJETIVOS(Instalacion_De_App) values(true);
insert into OBJETIVOS(Reproducciones_De_Video) values(true);
insert into OBJETIVOS(Generacion_De_Clientes_Potenciales) values(true);
insert into OBJETIVOS(Mensajes) values(true);
insert into OBJETIVOS(Conversiones) values(true);
insert into OBJETIVOS(Ventas_Del_Catalogo) values(true);
insert into OBJETIVOS(Trafico_De_Negocio) values(true);

insert into DESCRIPCION(ID_CAMPAÑA,Tipo_Compra,Descripcion,Tipo_Objetivo)
values(1, 'Subasta','Atraer la atencion a la pagina web',3),
(2, 'Subasta','Reomendar el app oficial',5),
(3,'Subasta','mostrar productos',10),
(4,'Subasta','Publicar curiosidades sobre la miel',4),
(5,'Subasta','Llegar al mayor numero de personas posible',2),
(6,'Subasta','Brindar informacion general',1),
(7,'Subasta','Llamar la atencion de los mas jovenes',4),
(8,'Subasta','Nuevos productos',10),
(9,'Subasta','Novedades de la empresa',2),
(10,'Subasta','Lugar de compra fisica',11);

insert into CONJUNTO_DE_ANUNCIOS(ID_CAMPAÑA,Pagina_Referencia,Nombre,Presupuesto) 
values(1,'Mishkila Miel','Principal',250),
(2, 'MielRex','Ventajas de app',100),
(3, 'Mieles el grande','Miel',400),
(4, 'Mieles el grande V2', 'Curiosidades',100),
(5,'Mishkila Miel','Temporada',200),
(6,'Grandes cambios','Temporada',100),
(7,'Jovenes y miel','Temporada',500),
(8,'Nuevas versiones','Temporada',125),
(9,'Esta Semana','Temporada',100),
(10,'Promociones en casa','Temporada',300);

insert into CALENDARIO(ID_Conjunto_De_Anuncios,Fecha_inicio,Fecha_fin,Hora_inicio,Hora_fin) 
values(1,'2022-07-07', '2022-12-07','08:00','20:00'),
(2, '2022-08-27', '2022-11-02','10:00','22:00'),
(3, '2022-07-17', '2023-01-01','12:00','23:59'),
(4, '2022-10-15','2023-10-15','00:59','23:59'),
(5,'2023-01-01', '2023-04-01','05:00','21:59'),
(6,'2022-01-01', '2023-12-01','00:00','22:59'),
(7,'2022-01-01', '2023-03-01','00:00','23:59'),
(8,'2023-01-01', '2023-12-31','00:00','22:59'),
(8,'2022-01-01', '2022-05-30','00:00','22:59'),
(10,'2022-01-01', '2022-07-30','00:00','22:59');

insert into AUDIENCIA(ID_Conjunto_De_Anuncios,Ubicacion,Generación,Trabajo,Edad,Finanzas,Género,Afinidad_étnica,Padre,Comportamientos,Madre)
values(2,'guayaquil','Milenials','Ninguno',22,'Ninguna','masculino','afro','no','juega volley','si'),
(3,'quito','z','Ninguno',11,'Ninguna','femenino','indigena','si','ama el ajedrez','si'),
(4,'cuenca','y','Profesor','58','Efectivo','femenino','afro','si','solo trabaja','si'),
(1,'esmeraldas','x','Ingeniero',45,'Tarjeta de credito','masculino','blanco','no','familiar','si'),
(6,'manta','x','Ingeniero',30,'Tarjeta de credito','masculino','blanco','no','saludable','si'),
(8,'manabi','y','Ninguna',20,'Ninguna','todos','todos','no','familiar','si'),
(10,'quito','x','Nutricionista',21,'Ninguna','masculino','blanco','no','saludable','si'),
(5,'cuenca','z','Ninguna',25,'Tarjeta de credito','masculino','blanco','si','familiar','si'),
(7,'guayaquil','x','Ninguna',14,'Ninguna','todos','todos','si','entretenimiento','si'),
(9,'guayaquil','x','Nutricionista',20,'Efectivo','todos','blanco','si','familiar','si');

insert into EVENTOS_DE_VIDA(Audiencia,Nombre) 
values(1,'Trabajo'),
(2,'Educacion'),
(3,'Hogar'),
(4,'Bienestar'),
(5,'Deporte'),
(6,'Comics'),
(7,'Salud'),
(8,'Festivales'),
(9,'Folklore'),
(10,'Cocina');

insert into INTERESES(Nombre,Audiencia) 
values('Salud',3),
('Dulces',2),
('Naturaleza',1),
('Miel',4),
('Naturaleza',5),
('Cocina',6),
('Mejoras',7),
('Buen Precio',8),
('Abejas',9),
('Tiedas',10);

insert into TIPO_FORMATO (ID_formato,Es_imagen,Es_video,Es_coleccion,Es_presentacion)
values(1,true,false,false,false),
(2, false,true,false,false),
(3,false,false,true,false),
(4,false,false,false, true);

insert into ANUNCIO (ID_Conjunto_De_Anuncios,Nombre,Tipo_Formato)
values(1,'Lo que puedes encontrar', 1),
(2, 'Ventajas de MielRex', 1),
(3, 'Productos en oferta', 3),
(4, 'Ventajas de la miel',1),
(5,'Conocenos',  2),
(10,'Increible',4),
(9,'Para adultos',3),
(7,'Para jovenes',2),
(6,'Para todos',1),
(8,'El producto qu buscas',2);

insert into FACTURA (Fecha_Pago,Descripcion,Cantidad_Pago,Correo_Admin,ID_Anuncio)
values(Date '2022-09-07', 'Primer pago del anuncio 1',50,'Admin_1_@hotmail.com',1),
(Date '2022-09-17', 'Primer pago del anuncio 3',50,'Admin_1_@hotmail.com',3),
(Date  '2022-12-17', 'Primer pago del anuncio 4',75,'Admin_1_@hotmail.com',4),
(Date  '2022-05-07','Tercer pago del anuncio 1',35,'Admin_2_@yopmail.com',1),
(Date '2023-10-07',  'Segundo pago del anuncio 1',40,'Admin_2_@yopmail.com',1),
(Date '2020-11-1','s',90,'juan@hotmail.com',5),
(Date '2019-11-1','s',80,'juan@hotmail.com',6),
(Date '2018-11-1','s',500,'andres@hotmail.com',7),
(Date '2017-11-1','s',100,'mariop@hotmail.com',8),
(Date '2015-11-1','s',100,'mariop@hotmail.com',9) ; 




insert into CONTENIDO (ID_Anuncio,Titulo,Texto_Principal,Texto_Segundario,URL_SitioWeb)
values(2,'Compra esto y gana la loteria',null,null,null),
(3,'Ven aca que estamos de oferta','Apurate!!',null,null),
(4,'No nos busques nosotros te buscamos',null,null,'Oficinasxyz.com'),
(1,'Se solicita urgentemento empleado','Dejanos saber de ti',null,'empresaW.com'),
(5,'Te presento Mishkila','Perfeccion',null,null),
(6,'Ofertas imprecionantes','Apurate!!',null,null),
(7,'Mira como te beneficia la miel','Es lo que buscas',null,null),
(8,'Nuevos productos impresionantes',null,null,null),
(9,'Nuevas presentaciones','Hermosura',null,null),
(10,'Nueva ubicacion de compra','Conocelo!!',null,null);



insert into HOGAR(Nombre_hogar,Avenida_principal,Avenida_segundaria,Audiencia)
values('Mi casa','','',2),
('De mi pertenecia','','',1),
('Soy el propietario','','',3),
('Solo mia','','',4),
('Casa principal','','',5),
('Donde paso los fin de semana','','',6),
('Casa de playa','','',7),
('Vacacional','','',8),
('Edificio','','',9),
('Casa de mamá','','',10);

insert into IDIOMAS(Idioma,Audiencia)
values('Ingles',2),
('Ruso',4),
('Japones',1),
('Ninguno',3),
('Español',5),
('Ingles',6),
('Quichua',7),
('Español',8),
('Aleman',9),
('Ingles',10);

