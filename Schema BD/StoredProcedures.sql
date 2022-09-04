DELIMITER //
create procedure obtenerTotalAnunciosPorFormato(in tipoFormato int,out total int)
begin 
	select count(Tipo_Formato)into total from ANUNCIO
	group by Tipo_Formato
	having Tipo_Formato = tipoFormato; 

end//
DELIMITER ;

DELIMITER //
create procedure cambiarNombreCampana(in idCam int,in nombreCam varchar(255))
begin 
	update CAMPAÑA
    set Nombre = nombreCam
    where ID_Campaña = idCam;
    
end//
DELIMITER ;

DELIMITER //
create procedure cambiarObjetivoCampana(in idCam int,in idObjetivo int )
begin 
	update DESCRIPCION
    set Tipo_Objetivo = idObjetivo
    where ID_Campaña = idCam;
end//
DELIMITER ;
 
-- call obtenerTotalAnunciosPorFormato(3,@total);
-- select @total;
-- call cambiarNombreCampana(1,"Esto es una prueba");
-- call cambiarObjetivoCampana(1,2);
