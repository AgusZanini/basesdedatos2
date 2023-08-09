create database Produccion;
use Produccion;

drop table if exists lotes;
create table lotes (
	idlote integer not null auto_increment,
    fecha_registro date not null,
    cantidad_piezas_lote integer not null,
    cantidad_piezas_ok integer not null,
    primary key (idlote)
) engine = InnoDB;

drop table if exists log;
create table log (
	idmovimiento integer not null auto_increment,
    fecha date not null,
    idlote integer not null,
    porcentaje float not null,
    primary key (idmovimiento),
    foreign key (idlote) references lotes(idlote)
) engine = InnoDB;

drop procedure if exists insert_lote;
delimiter //
create procedure insert_lote(_fecha date, _cantidad integer, _cantidad_ok integer)
begin
	
	declare exit handler for sqlexception
		begin
			rollback;
            select "error en la transaccion";
		end;
if _cantidad > 0 and _cantidad_ok <= _cantidad then
	start transaction;
		insert into lotes(fecha_registro, cantidad_piezas_lote, cantidad_piezas_ok) values(_fecha, _cantidad, _cantidad_ok);
	commit;
else select "ingrese cantidades validas";
end if;
end
//
delimiter ;

drop trigger if exists registrar_log;
delimiter //
create trigger registrar_log
after insert on lotes
for each row
begin
	if ((new.cantidad_piezas_ok * 100) / new.cantidad_piezas_lote ) < 80 then
		insert into log(fecha, idlote, porcentaje) values(new.fecha_registro, new.idlote, 100 - ((new.cantidad_piezas_ok * 100) / new.cantidad_piezas_lote));
	end if;
end
//
delimiter ;

call insert_lote(now(), 10, 8);
call insert_lote(now(), 15, 8);
call insert_lote(now(), 10, 7);
call insert_lote(now(), 10, 4);
call insert_lote(now(), 100, 83);
call insert_lote(now(), 230, 122);
call insert_lote(now(), 100, 100);

call insert_lote(now(), 100, 70);

call insert_lote(now(), -1, 83);
call insert_lote(now(), 100, 110);

select * from lotes;
select * from log;



