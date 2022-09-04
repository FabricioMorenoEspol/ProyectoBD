DELIMITER //
create procedure ObtenerTotalAnunciosPorFormato(in tipoFormato int,out total int)
begin 
	select count(Tipo_Formato)into total from ANUNCIO
	group by Tipo_Formato
	having Tipo_Formato = tipoFormato; 

end//
DELIMITER ;

DELIMITER //
create procedure CambiarNombreCampaña(in idCam int,in nombreCam varchar(255))
begin 
	update CAMPAÑA
    set Nombre = nombreCam
    where ID_Campaña = idCam;
    
end//
DELIMITER ;

DELIMITER //
create procedure CambiarObjetivoCampaña(in idCam int,in idObjetivo int )
begin 
	update DESCRIPCION
    set Tipo_Objetivo = idObjetivo
    where ID_Campaña = idCam;
end//
DELIMITER ;
 
-- call ObtenerTotalAnunciosPorFormato(3,@total);
-- select @total;
-- call CambiarNombreCampaña(1,"Esto es una prueba");
-- call CambiarObjetivoCampaña(1,2);
