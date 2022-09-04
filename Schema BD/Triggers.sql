use FacebookAds;
-- creacion de los triggers de nuestra DB

-- triger que para cuando se inserte un nuevo registro en un conjunto de anuncios se cree un calendario por defecto
delimiter //
create trigger After_Insert_CDA after insert on CONJUNTO_DE_ANUNCIOS
	for each row
	begin
		insert into CALENDARIO(ID_Conjunto_De_Anuncios,Fecha_inicio,Fecha_fin,Hora_inicio,Hora_fin)
        values(new.ID_Conjunto_De_Anuncios,curdate(),date_add(curdate(),interval 1 year),curtime(),'23:59');


	end //
delimiter ; 


-- trigger 2

delimiter //
create trigger Before_Update_Audiencia before update on Audiencia
	for each row
	begin 
		set @IDsCDA =not exists (Select ID_Conjunto_De_Anuncios 
					  from Conjunto_De_Anuncios
                      where ID_Conjunto_De_Anuncios=new.ID_Conjunto_De_Anuncios) ;
                      
		if  @IDsCDA then 

			set new.ID_Conjunto_De_Anuncios=old.ID_Conjunto_De_Anuncios;
        end if ;
        
    
    end //
delimiter ;

