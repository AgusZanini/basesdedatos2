create database dwservicios;

use dwservicios;

drop table if exists cant_reclamos_prov;
create table cant_reclamos_prov(
	id_provincia integer primary key,
	nombreprov varchar(54),
    cant_reclamos integer
);

drop table if exists dimprovincias;
create table dimprovincias (
	id_provincia integer primary key,
	nombreprov varchar(54)
);

drop table  if exists dimregion;
create table dimregion (
	id_region integer primary key,
    nombreregion varchar(54)
);

drop table if exists dimservicio;
create table dimservicio (
	id_servicio integer primary key,
    descr varchar(54)
);

select * from dimsoluciones;

drop table if exists dimfechas;
create table dimfechas (
	id_fecha integer primary key,
	anio integer,
	mes integer,
    dia integer
);

select * from dimfechas;

drop table if exists dimsoluciones;
create table dimsoluciones (
	id_solucion integer primary key,
	descripcion varchar(54)
);

drop table if exists factregistros;
create table factregistros (
	id_registro integer,
    id_provincia integer,
    id_fecha integer,
    id_region integer,
    id_servicio integer,
    id_solucion integer,
    cantidad integer,
    primary key (id_registro),
    FOREIGN KEY (id_provincia) REFERENCES dimprovincias(id_provincia),
    FOREIGN KEY (id_region) REFERENCES dimregion(id_region),
    FOREIGN KEY (id_servicio) REFERENCES dimservicio(id_servicio),
    foreign key (id_fecha) references dimfechas(id_fecha)
);

select * from factregistros;
    