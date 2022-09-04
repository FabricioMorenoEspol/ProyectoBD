use FacebookAds;
-- Creacion de usuarios

create user 'Fabricio'@'localhost' identified by 'soyAdmin';
	grant all privileges on FacebookAds.* to 'Fabricio'@'localhost' with grant option;
    
create user 'Kevin'@'localhost' identified by '12345';
	grant select,insert,update on FacebookAds.* to 'Kevin'@'localhost';
    grant execute on procedure FacebookAds.CambiarObjetivoCampaña to 'Kevin'@'localhost';
    grant execute on procedure FacebookAds.CambiarNombreCampaña to 'Kevin'@'localhost';
    grant execute on procedure FacebookAds.ObtenerTotalAnunciosPorFormato to 'Kevin'@'localhost';
    

create user 'Jose'@'localhost' identified by 'estoyAP';
	grant select on FacebookAds.Campaña to 'Jose'@'localhost';
    grant select on FacebookAds.Conjunto_De_Anuncios to 'Jose'@'localhost';
    grant select on FacebookAds.Anuncio to 'Jose'@'localhost';
    
    grant select on FacebookAds.ViewTotalPagoCDA to 'Jose'@'localhost';  
	grant select on FacebookAds.ViewFacturaMasAlta to 'Jose'@'localhost';

create user 'Baidal'@'localhost' identified by 'abcd';
	grant select,insert on FacebookAds.Anuncio to 'Baidal'@'localhost';
    grant select,insert on FacebookAds.Factura to 'Baidal'@'localhost';
    grant select,insert on FacebookAds.Contenido to 'Baidal'@'localhost';
    
    grant select on FacebookAds.ViewNumAnunciosXCampaña to 'Baidal'@'localhost';
    
    

create user 'Moreno'@'localhost' identified by 'linuxLover';
	grant select, insert on FacebookAds.Campaña to 'Moreno'@'localhost';
    grant select, insert on FacebookAds.Conjunto_De_Anuncios to 'Moreno'@'localhost';
    grant select, insert on FacebookAds.Anuncio to 'Moreno'@'localhost';
    grant select, insert on FacebookAds.Contenido to 'Moreno'@'localhost';
    grant select, insert on FacebookAds.Descripcion to 'Moreno'@'localhost';

    
    


