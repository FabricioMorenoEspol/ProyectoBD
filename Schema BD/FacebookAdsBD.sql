create database if not exists FacebookAds;
use FacebookAds;

create table if not exists CAMPAÑA(
ID_Campaña int primary key not null auto_increment,
Nombre varchar(30) not null,
Categoria varchar(20) not null
);

create table if not exists OBJETIVOS(
ID_Objetivo int primary key not null auto_increment,
Reconocimiento_De_Marca boolean default false,
Alcance boolean default false,
Trafico boolean default false,
Interaccion boolean default false,
Instalacion_De_App boolean default false,
Reproducciones_De_Video boolean default false,
Generacion_De_Clientes_Potenciales boolean default false,
Mensajes boolean default false,
Conversiones boolean default false,
Ventas_Del_Catalogo boolean default false,
Trafico_De_Negocio boolean default false
);

create table if not exists DESCRIPCION(
ID_Campaña int,
Tipo_Compra varchar(15) not null,
Descripcion varchar(255) default "",
Tipo_Objetivo int not null,
foreign key (ID_Campaña) references CAMPAÑA(ID_Campaña),
foreign key (Tipo_Objetivo) references OBJETIVOS(ID_Objetivo)
);

create table if not exists CONJUNTO_DE_ANUNCIOS(
ID_Conjunto_De_Anuncios int primary key not null auto_increment,
ID_Campaña int, 
Pagina_Referencia varchar(200) not null,
Nombre varchar(30) not null,
Presupuesto double not null,
foreign key (ID_Campaña) references CAMPAÑA(ID_Campaña)

);

create table if not exists CALENDARIO(
ID_Calendario int primary key not null auto_increment,
ID_Conjunto_De_Anuncios int,
Fecha_inicio date not null,
Fecha_fin date,
Hora_inicio time not null,
Hora_fin time,
foreign key (ID_Conjunto_De_Anuncios) references CONJUNTO_DE_ANUNCIOS(ID_Conjunto_De_Anuncios)

);

create table if not exists AUDIENCIA(
	ID_Audiencia int primary key not null auto_increment,
    ID_Conjunto_De_Anuncios int,
    Ubicacion varchar(255),
    Generación varchar(255),
    Trabajo varchar(255),
    Edad int,
    Finanzas varchar(255),
    Género varchar(255),
    Afinidad_étnica varchar(255),
    Padre varchar(255),
    Comportamientos varchar(255),
    Madre varchar(255),
    foreign key (ID_Conjunto_De_Anuncios) references CONJUNTO_DE_ANUNCIOS(ID_Conjunto_De_Anuncios)
);

create table if not exists EVENTOS_DE_VIDA(
ID_Evento int primary key not null auto_increment,
Audiencia int,
Nombre varchar(30) not null,
foreign key (Audiencia) references AUDIENCIA(ID_Audiencia)
);

create table if not exists INTERESES(
Nombre varchar(30) not null,
Descripcion varchar(200) default "",
Audiencia int,
foreign key (Audiencia) references AUDIENCIA(ID_Audiencia)
);


create table if not exists TIPO_FORMATO(
	ID_formato int primary key not null,
    Es_imagen boolean default false,
    Es_video boolean default false,
    Es_coleccion boolean default false,
    Es_presentacion boolean default false
);


create table if not exists ANUNCIO(
	ID_Anuncio int primary key not null auto_increment,
    ID_Conjunto_De_Anuncios int,
    Nombre varchar(25) not null,
    Tipo_Formato int, 
    foreign key (ID_Conjunto_De_Anuncios) references CONJUNTO_DE_ANUNCIOS(ID_Conjunto_De_Anuncios),
    foreign key (Tipo_Formato) references TIPO_FORMATO(ID_formato)
);

create table if not exists FACTURA(
	Numero_Factura int primary key not null auto_increment,
    Fecha_Pago date,
    Descripcion varchar(255) not null,
    Cantidad_Pago int not null,
    Correo_Admin varchar(100) not null,
    ID_Anuncio int,
    foreign key (ID_Anuncio) references ANUNCIO(ID_Anuncio)
);


create table if not exists CONTENIDO(
	ID_Anuncio int primary key not null,
    Titulo varchar(50),
    Texto_Principal varchar(255),
    Texto_Segundario varchar(255),
    URL_SitioWeb varchar(255),
    foreign key (ID_Anuncio) references ANUNCIO(ID_Anuncio)
);

create table if not exists HOGAR(
	ID_hogar int primary key not null auto_increment,
    Nombre_hogar varchar(255) not null,
    Avenida_principal varchar(255) default "",
    Avenida_segundaria varchar(255) default "",
    Audiencia int,
    foreign key (Audiencia) references AUDIENCIA(ID_Audiencia)
);

create table if not exists IDIOMAS(
	ID_idioma int primary key not null auto_increment,
    Idioma varchar(255) not null,
    Audiencia int,
    foreign key (Audiencia) references AUDIENCIA(ID_Audiencia)
);