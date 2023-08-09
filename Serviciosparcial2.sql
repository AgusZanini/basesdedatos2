-- Borrado de tablas 
-- drop table registros;
-- drop table contratos;
-- drop table soluciones;
-- drop table encuestas;
-- drop table operadores;
-- drop table planes;
-- drop table servicios;
-- drop table provincias;
-- drop table regiones;

-- Sentencias para generación de grupos de tablas
-- Grupo de tablas 

drop database servicios;
create database servicios;
use servicios;

create table soluciones(
id_solucion integer primary key,
descripcion varchar(50)
);

create table servicios(
id_servicio integer primary key,
descripcion varchar(50)
);

create table encuestas(
id_encuesta integer primary key,
descripcion varchar(50)
);

create table operadores(
id_operador integer primary key,
apellido varchar(50),
nombre varchar(50),
valor_cobro_si integer,
valor_cobro_no integer,
sueldo float
);

create table regiones(
id_region integer primary key,
nomreg varchar(50)
);

create table provincias(
id_provincia integer primary key,
nombre varchar(50),
id_region integer,
CONSTRAINT FK_region FOREIGN KEY (id_region) REFERENCES regiones(id_region)
);

create table planes(
id_plan integer primary key,
descplan varchar(50),
id_servicio integer,
costo float,
CONSTRAINT FK_servicios FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);

create table contratos(
id_contrato integer primary key,
id_plan integer, 
fecha date,
id_provincia integer,
CONSTRAINT FK_plan FOREIGN KEY (id_plan) REFERENCES planes(id_plan),
CONSTRAINT FK_provincia FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);

create table registros(
id_registro integer primary key,
id_contrato integer,
tiempo_atencion integer,
id_solucion integer,
id_encuesta integer,
id_operador integer,
fecha date,
CONSTRAINT FK_contrato FOREIGN KEY (id_contrato) REFERENCES contratos(id_contrato),
CONSTRAINT FK_solucion FOREIGN KEY (id_solucion) REFERENCES soluciones(id_solucion),
CONSTRAINT FK_encuesta FOREIGN KEY (id_encuesta) REFERENCES encuestas(id_encuesta),
CONSTRAINT FK_operador FOREIGN KEY (id_operador) REFERENCES operadores(id_operador)
);


-- Poblando BD
-- Sentencias Insert para cmpletar datos de las tablas de la BD

-- Tabla soluciones
insert into soluciones values (0,'SI');
insert into soluciones values (1,'NO');
insert into soluciones values (2,'Derivacion');

-- Tabla servicios
insert into servicios values (1,'Telefonia');	
insert into servicios values (2,'Internet');
insert into servicios values (3,'Video');

-- Tabla encuestas
insert into encuestas values (1,'Malo');
insert into encuestas values (2,'Regular');
insert into encuestas values (3,'Bueno');
insert into encuestas values (4,'Muy Bueno');
insert into encuestas values (5,'Excelente');

-- Tabla operadores
insert into operadores values(1,'Castro','Juan',4,2,250);
insert into operadores values(2,'Perez','Sofia',4,2,250);
insert into operadores values(3,'Alvarez','Carla',5,3,300);
insert into operadores values(4,'Pastor','Florencia',5,3,400);
insert into operadores values(5,'Zabala','Pedro',5,3,400);

-- Tabla regiones
insert into regiones values (1, 'Norte');
insert into regiones values (2, 'Centro');
insert into regiones values (3, 'Sur');

-- Tabla provincias
insert into provincias values(1,'Jujuy',1);
insert into provincias values(2,'Salta',1);
insert into provincias values(3,'Tucuman',1);
insert into provincias values(4,'Cordoba',2);
insert into provincias values(5,'Mendoza',2);
insert into provincias values(6,'Santa Fe',2);
insert into provincias values(7,'Neuquen',3);
insert into provincias values(8,'La Pampa',3);

-- Tabla planes
insert into planes values (1,'Tel - 1',1,10);
insert into planes values (2,'Tel - 2',1,20);
insert into planes values (3,'Tel - 3',1,30);
insert into planes values (4,'Int - 1',2,15);
insert into planes values (5,'Int - 2',2,30);
insert into planes values (6,'Vid - 1',2,35);

-- Tabla contratos (Se ingresan 300 registros)
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1001,2,'2018/01/04',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1002,5,'2018/01/09',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1003,2,'2018/01/15',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1004,5,'2018/01/23',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1005,6,'2018/01/31',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1006,5,'2018/02/04',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1007,1,'2018/02/07',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1008,1,'2018/02/15',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1009,3,'2018/02/16',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1010,3,'2018/02/16',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1011,4,'2018/02/19',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1012,4,'2018/03/02',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1013,5,'2018/03/10',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1014,6,'2018/03/13',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1015,1,'2018/03/18',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1016,6,'2018/03/22',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1017,6,'2018/03/23',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1018,6,'2018/04/14',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1019,4,'2018/04/28',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1020,1,'2018/04/28',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1021,5,'2018/05/05',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1022,3,'2018/05/06',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1023,2,'2018/05/07',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1024,3,'2018/05/20',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1025,2,'2018/05/21',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1026,6,'2018/05/22',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1027,2,'2018/05/27',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1028,6,'2018/06/03',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1029,2,'2018/06/07',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1030,4,'2018/06/07',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1031,1,'2018/06/09',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1032,4,'2018/06/12',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1033,6,'2018/06/23',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1034,4,'2018/06/25',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1035,6,'2018/06/28',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1036,1,'2018/07/01',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1037,6,'2018/07/01',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1038,6,'2018/07/07',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1039,1,'2018/07/08',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1040,2,'2018/07/11',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1041,6,'2018/07/11',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1042,6,'2018/07/12',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1043,5,'2018/07/14',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1044,1,'2018/07/15',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1045,5,'2018/07/22',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1046,4,'2018/07/23',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1047,6,'2018/07/31',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1048,6,'2018/08/03',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1049,2,'2018/08/05',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1050,5,'2018/08/05',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1051,3,'2018/08/06',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1052,1,'2018/08/09',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1053,4,'2018/08/10',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1054,5,'2018/08/15',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1055,4,'2018/08/15',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1056,1,'2018/08/24',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1057,2,'2018/08/29',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1058,2,'2018/08/29',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1059,4,'2018/09/03',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1060,3,'2018/09/06',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1061,3,'2018/09/08',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1062,6,'2018/09/08',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1063,5,'2018/09/16',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1064,3,'2018/09/18',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1065,3,'2018/09/19',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1066,5,'2018/09/20',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1067,2,'2018/09/22',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1068,6,'2018/09/23',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1069,2,'2018/09/26',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1070,4,'2018/10/08',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1071,6,'2018/10/13',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1072,3,'2018/10/14',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1073,2,'2018/10/17',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1074,3,'2018/10/29',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1075,3,'2018/10/30',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1076,6,'2018/11/03',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1077,1,'2018/11/05',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1078,3,'2018/11/07',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1079,3,'2018/11/07',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1080,3,'2018/11/08',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1081,1,'2018/11/08',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1082,6,'2018/11/08',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1083,2,'2018/11/11',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1084,2,'2018/11/12',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1085,2,'2018/11/17',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1086,2,'2018/11/22',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1087,6,'2018/12/01',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1088,4,'2018/12/05',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1089,1,'2018/12/12',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1090,3,'2018/12/15',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1091,5,'2018/12/16',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1092,2,'2018/12/17',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1093,3,'2018/12/22',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1094,3,'2019/01/01',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1095,3,'2019/01/03',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1096,3,'2019/01/04',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1097,4,'2019/01/06',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1098,3,'2019/01/14',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1099,3,'2019/02/05',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1100,5,'2019/02/21',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1101,2,'2019/02/25',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1102,6,'2019/03/03',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1103,3,'2019/03/10',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1104,2,'2019/03/22',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1105,5,'2019/03/26',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1106,2,'2019/04/02',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1107,4,'2019/04/02',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1108,5,'2019/04/04',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1109,1,'2019/04/05',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1110,4,'2019/04/18',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1111,5,'2019/04/23',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1112,4,'2019/04/28',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1113,4,'2019/04/29',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1114,6,'2019/04/29',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1115,2,'2019/05/01',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1116,3,'2019/05/03',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1117,6,'2019/05/05',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1118,2,'2019/05/09',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1119,2,'2019/05/13',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1120,2,'2019/05/16',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1121,2,'2019/05/21',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1122,1,'2019/05/23',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1123,2,'2019/05/29',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1124,2,'2019/06/05',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1125,4,'2019/06/05',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1126,1,'2019/06/06',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1127,2,'2019/06/08',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1128,5,'2019/06/10',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1129,5,'2019/06/12',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1130,3,'2019/06/23',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1131,2,'2019/06/26',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1132,5,'2019/07/01',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1133,1,'2019/07/04',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1134,2,'2019/07/06',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1135,3,'2019/07/10',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1136,1,'2019/07/15',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1137,6,'2019/07/25',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1138,5,'2019/07/31',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1139,1,'2019/08/01',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1140,2,'2019/08/05',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1141,4,'2019/08/11',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1142,5,'2019/08/13',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1143,5,'2019/08/15',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1144,5,'2019/08/15',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1145,5,'2019/08/17',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1146,3,'2019/08/21',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1147,3,'2019/08/22',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1148,1,'2019/08/25',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1149,6,'2019/08/28',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1150,5,'2019/08/28',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1151,3,'2019/09/04',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1152,4,'2019/09/07',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1153,3,'2019/09/11',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1154,1,'2019/09/19',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1155,3,'2019/09/23',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1156,6,'2019/09/28',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1157,4,'2019/09/28',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1158,6,'2019/10/02',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1159,4,'2019/10/03',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1160,1,'2019/10/06',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1161,4,'2019/10/07',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1162,2,'2019/10/16',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1163,5,'2019/10/18',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1164,4,'2019/10/20',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1165,4,'2019/10/21',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1166,4,'2019/10/26',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1167,5,'2019/10/31',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1168,4,'2019/11/01',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1169,2,'2019/11/01',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1170,6,'2019/11/08',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1171,5,'2019/11/09',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1172,6,'2019/11/16',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1173,5,'2019/11/27',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1174,5,'2019/11/29',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1175,6,'2019/12/01',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1176,2,'2019/12/03',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1177,6,'2019/12/03',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1178,4,'2019/12/03',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1179,5,'2019/12/08',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1180,5,'2019/12/16',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1181,3,'2019/12/21',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1182,4,'2019/12/24',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1183,6,'2019/12/24',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1184,2,'2020/01/02',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1185,4,'2020/01/04',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1186,3,'2020/01/09',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1187,5,'2020/01/10',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1188,2,'2020/01/11',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1189,5,'2020/01/13',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1190,2,'2020/01/23',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1191,4,'2020/02/06',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1192,4,'2020/02/07',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1193,3,'2020/02/17',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1194,6,'2020/02/18',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1195,3,'2020/02/23',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1196,3,'2020/02/24',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1197,5,'2020/02/26',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1198,2,'2020/03/01',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1199,5,'2020/03/03',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1200,1,'2020/03/04',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1201,1,'2020/03/06',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1202,1,'2020/03/06',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1203,3,'2020/03/06',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1204,4,'2020/03/15',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1205,6,'2020/03/20',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1206,5,'2020/03/20',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1207,6,'2020/03/21',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1208,4,'2020/03/24',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1209,1,'2020/03/24',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1210,3,'2020/03/31',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1211,6,'2020/04/03',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1212,3,'2020/04/11',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1213,6,'2020/04/16',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1214,3,'2020/04/16',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1215,2,'2020/04/17',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1216,5,'2020/04/22',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1217,3,'2020/04/23',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1218,3,'2020/04/24',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1219,4,'2020/04/25',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1220,4,'2020/04/25',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1221,1,'2020/04/27',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1222,3,'2020/04/29',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1223,1,'2020/05/13',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1224,3,'2020/06/08',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1225,2,'2020/06/08',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1226,2,'2020/06/19',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1227,4,'2020/06/19',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1228,3,'2020/06/22',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1229,2,'2020/06/25',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1230,4,'2020/07/04',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1231,4,'2020/07/09',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1232,3,'2020/07/10',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1233,3,'2020/07/11',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1234,5,'2020/07/11',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1235,5,'2020/07/16',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1236,1,'2020/07/22',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1237,1,'2020/07/25',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1238,2,'2020/07/27',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1239,1,'2020/07/27',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1240,3,'2020/07/28',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1241,2,'2020/07/28',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1242,2,'2020/07/30',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1243,4,'2020/08/05',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1244,3,'2020/08/09',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1245,5,'2020/08/14',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1246,6,'2020/08/18',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1247,3,'2020/08/18',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1248,3,'2020/08/20',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1249,2,'2020/08/22',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1250,6,'2020/08/24',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1251,1,'2020/08/26',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1252,4,'2020/09/02',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1253,3,'2020/09/07',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1254,4,'2020/09/07',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1255,3,'2020/09/08',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1256,3,'2020/09/08',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1257,6,'2020/09/09',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1258,2,'2020/09/10',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1259,4,'2020/09/11',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1260,5,'2020/09/12',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1261,3,'2020/09/19',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1262,5,'2020/09/22',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1263,3,'2020/09/28',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1264,1,'2020/10/02',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1265,2,'2020/10/04',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1266,5,'2020/10/05',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1267,2,'2020/10/08',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1268,4,'2020/10/09',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1269,3,'2020/10/12',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1270,3,'2020/10/14',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1271,3,'2020/10/20',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1272,4,'2020/10/20',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1273,2,'2020/10/22',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1274,4,'2020/10/25',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1275,3,'2020/10/27',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1276,2,'2020/10/27',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1277,1,'2020/10/28',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1278,5,'2020/11/01',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1279,6,'2020/11/06',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1280,4,'2020/11/07',6);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1281,6,'2020/11/08',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1282,2,'2020/11/09',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1283,4,'2020/11/14',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1284,3,'2020/11/15',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1285,1,'2020/11/21',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1286,3,'2020/11/21',4);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1287,6,'2020/11/22',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1288,2,'2020/11/25',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1289,4,'2020/11/26',1);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1290,4,'2020/11/28',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1291,6,'2020/12/01',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1292,1,'2020/12/04',2);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1293,5,'2020/12/06',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1294,2,'2020/12/08',3);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1295,5,'2020/12/10',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1296,2,'2020/12/12',7);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1297,5,'2020/12/18',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1298,3,'2020/12/21',8);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1299,3,'2020/12/22',5);
insert into contratos (id_contrato,id_plan,fecha,id_provincia) values(1300,1,'2020/12/25',4);


-- Tabla registros (Ingresan 400 registros) 
insert into registros values (1,1068,2,1,3,1,'2021/01/01');
insert into registros values (2,1097,6,0,1,1,'2021/01/02');
insert into registros values (3,1134,10,0,5,1,'2021/01/02');
insert into registros values (4,1197,4,1,1,4,'2021/01/02');
insert into registros values (5,1019,1,0,1,4,'2021/01/02');
insert into registros values (6,1187,1,0,1,1,'2021/01/02');
insert into registros values (7,1103,6,1,5,3,'2021/01/02');
insert into registros values (8,1244,6,0,1,4,'2021/01/03');
insert into registros values (9,1068,1,1,3,5,'2021/01/04');
insert into registros values (10,1248,6,1,5,1,'2021/01/05');
insert into registros values (11,1159,14,0,1,2,'2021/01/05');
insert into registros values (12,1217,14,0,2,1,'2021/01/06');
insert into registros values (13,1082,11,1,3,2,'2021/01/07');
insert into registros values (14,1216,9,0,2,5,'2021/01/07');
insert into registros values (15,1137,8,1,4,1,'2021/01/07');
insert into registros values (16,1017,11,1,2,4,'2021/01/08');
insert into registros values (17,1126,7,1,1,1,'2021/01/08');
insert into registros values (18,1025,5,1,4,2,'2021/01/08');
insert into registros values (19,1221,15,0,2,4,'2021/01/09');
insert into registros values (20,1053,13,1,3,1,'2021/01/09');
insert into registros values (21,1235,5,0,2,5,'2021/01/09');
insert into registros values (22,1281,15,1,3,5,'2021/01/10');
insert into registros values (23,1237,15,0,2,4,'2021/01/10');
insert into registros values (24,1285,2,0,3,5,'2021/01/10');
insert into registros values (25,1079,13,0,5,1,'2021/01/11');
insert into registros values (26,1073,7,1,5,3,'2021/01/11');
insert into registros values (27,1074,8,0,5,1,'2021/01/12');
insert into registros values (28,1053,15,1,3,5,'2021/01/12');
insert into registros values (29,1264,7,1,5,1,'2021/01/13');
insert into registros values (30,1146,2,1,5,5,'2021/01/14');
insert into registros values (31,1228,8,0,1,1,'2021/01/14');
insert into registros values (32,1211,14,1,3,1,'2021/01/14');
insert into registros values (33,1142,3,1,1,1,'2021/01/14');
insert into registros values (34,1170,11,1,4,5,'2021/01/14');
insert into registros values (35,1139,4,1,4,1,'2021/01/15');
insert into registros values (36,1135,9,1,3,3,'2021/01/15');
insert into registros values (37,1091,10,0,5,2,'2021/01/15');
insert into registros values (38,1078,2,0,4,1,'2021/01/16');
insert into registros values (39,1240,10,0,1,1,'2021/01/16');
insert into registros values (40,1106,1,0,1,2,'2021/01/17');
insert into registros values (41,1196,13,1,5,5,'2021/01/17');
insert into registros values (42,1217,11,0,5,3,'2021/01/17');
insert into registros values (43,1195,8,0,3,5,'2021/01/18');
insert into registros values (44,1123,14,1,1,3,'2021/01/21');
insert into registros values (45,1195,7,1,1,4,'2021/01/21');
insert into registros values (46,1013,3,0,2,2,'2021/01/21');
insert into registros values (47,1176,4,0,4,4,'2021/01/22');
insert into registros values (48,1001,9,1,3,2,'2021/01/22');
insert into registros values (49,1237,8,1,3,5,'2021/01/22');
insert into registros values (50,1114,7,1,1,3,'2021/01/24');
insert into registros values (51,1040,8,1,3,2,'2021/01/25');
insert into registros values (52,1181,11,0,4,5,'2021/01/25');
insert into registros values (53,1109,8,1,3,2,'2021/01/26');
insert into registros values (54,1204,3,0,1,1,'2021/01/26');
insert into registros values (55,1215,4,0,5,4,'2021/01/26');
insert into registros values (56,1022,3,1,4,3,'2021/01/27');
insert into registros values (57,1152,8,0,3,5,'2021/01/29');
insert into registros values (58,1178,8,1,5,1,'2021/01/29');
insert into registros values (59,1185,6,0,5,3,'2021/01/30');
insert into registros values (60,1060,15,1,1,3,'2021/01/31');
insert into registros values (61,1208,11,0,2,2,'2021/01/31');
insert into registros values (62,1261,3,1,4,4,'2021/01/31');
insert into registros values (63,1262,9,0,2,5,'2021/02/01');
insert into registros values (64,1185,4,1,5,3,'2021/02/01');
insert into registros values (65,1071,5,1,3,4,'2021/02/01');
insert into registros values (66,1266,6,1,1,4,'2021/02/03');
insert into registros values (67,1118,1,1,5,3,'2021/02/03');
insert into registros values (68,1211,10,0,1,1,'2021/02/04');
insert into registros values (69,1299,12,1,5,4,'2021/02/05');
insert into registros values (70,1046,12,1,4,3,'2021/02/05');
insert into registros values (71,1247,1,1,1,2,'2021/02/05');
insert into registros values (72,1006,6,0,1,4,'2021/02/06');
insert into registros values (73,1093,1,0,3,4,'2021/02/06');
insert into registros values (74,1212,7,0,5,4,'2021/02/06');
insert into registros values (75,1128,2,0,5,4,'2021/02/06');
insert into registros values (76,1028,4,0,3,4,'2021/02/07');
insert into registros values (77,1256,5,0,3,3,'2021/02/08');
insert into registros values (78,1036,8,0,4,5,'2021/02/08');
insert into registros values (79,1027,2,0,2,4,'2021/02/08');
insert into registros values (80,1107,10,0,1,1,'2021/02/09');
insert into registros values (81,1015,5,0,4,3,'2021/02/09');
insert into registros values (82,1166,14,1,2,4,'2021/02/09');
insert into registros values (83,1280,15,1,3,1,'2021/02/10');
insert into registros values (84,1043,2,1,3,1,'2021/02/10');
insert into registros values (85,1225,9,1,2,1,'2021/02/10');
insert into registros values (86,1291,14,1,3,5,'2021/02/11');
insert into registros values (87,1205,8,1,1,2,'2021/02/12');
insert into registros values (88,1051,2,0,2,3,'2021/02/12');
insert into registros values (89,1042,7,1,2,2,'2021/02/13');
insert into registros values (90,1270,13,1,1,3,'2021/02/13');
insert into registros values (91,1092,4,1,4,3,'2021/02/13');
insert into registros values (92,1034,4,1,1,2,'2021/02/14');
insert into registros values (93,1087,1,1,2,2,'2021/02/15');
insert into registros values (94,1272,6,1,2,1,'2021/02/15');
insert into registros values (95,1225,8,0,2,2,'2021/02/15');
insert into registros values (96,1130,3,0,3,5,'2021/02/16');
insert into registros values (97,1039,1,1,5,2,'2021/02/16');
insert into registros values (98,1174,7,1,2,2,'2021/02/16');
insert into registros values (99,1272,3,0,2,3,'2021/02/17');
insert into registros values (100,1202,9,0,1,4,'2021/02/17');
insert into registros values (101,1191,15,1,3,3,'2021/02/17');
insert into registros values (102,1195,12,0,4,3,'2021/02/17');
insert into registros values (103,1273,1,1,5,1,'2021/02/17');
insert into registros values (104,1176,3,1,4,2,'2021/02/19');
insert into registros values (105,1229,6,0,4,4,'2021/02/21');
insert into registros values (106,1277,14,1,3,4,'2021/02/22');
insert into registros values (107,1272,13,1,4,3,'2021/02/23');
insert into registros values (108,1036,4,0,2,2,'2021/02/23');
insert into registros values (109,1115,13,0,2,5,'2021/02/23');
insert into registros values (110,1226,9,1,4,1,'2021/02/23');
insert into registros values (111,1195,11,1,1,1,'2021/02/23');
insert into registros values (112,1014,5,0,5,2,'2021/02/23');
insert into registros values (113,1108,6,0,4,3,'2021/02/24');
insert into registros values (114,1070,12,1,2,3,'2021/02/24');
insert into registros values (115,1059,4,0,1,3,'2021/02/24');
insert into registros values (116,1255,9,1,4,3,'2021/02/25');
insert into registros values (117,1216,3,1,5,4,'2021/02/25');
insert into registros values (118,1034,3,0,5,2,'2021/02/25');
insert into registros values (119,1150,11,1,2,2,'2021/02/26');
insert into registros values (120,1236,1,1,2,3,'2021/02/27');
insert into registros values (121,1277,4,1,4,5,'2021/02/27');
insert into registros values (122,1298,1,1,2,3,'2021/03/01');
insert into registros values (123,1174,4,0,1,2,'2021/03/01');
insert into registros values (124,1290,6,1,3,1,'2021/03/01');
insert into registros values (125,1031,9,0,4,3,'2021/03/02');
insert into registros values (126,1207,12,0,1,1,'2021/03/02');
insert into registros values (127,1096,5,0,5,1,'2021/03/02');
insert into registros values (128,1047,4,1,4,4,'2021/03/02');
insert into registros values (129,1055,3,0,4,5,'2021/03/03');
insert into registros values (130,1099,3,0,2,5,'2021/03/03');
insert into registros values (131,1254,8,0,2,1,'2021/03/03');
insert into registros values (132,1036,4,0,4,4,'2021/03/03');
insert into registros values (133,1054,14,1,3,1,'2021/03/04');
insert into registros values (134,1029,9,1,2,3,'2021/03/04');
insert into registros values (135,1264,3,0,5,5,'2021/03/04');
insert into registros values (136,1222,6,1,1,4,'2021/03/04');
insert into registros values (137,1222,11,0,2,1,'2021/03/04');
insert into registros values (138,1197,14,1,5,3,'2021/03/04');
insert into registros values (139,1300,5,1,1,2,'2021/03/06');
insert into registros values (140,1152,11,1,2,4,'2021/03/06');
insert into registros values (141,1255,4,0,1,4,'2021/03/07');
insert into registros values (142,1218,1,0,3,4,'2021/03/07');
insert into registros values (143,1277,11,0,5,3,'2021/03/07');
insert into registros values (144,1219,12,0,1,4,'2021/03/07');
insert into registros values (145,1041,2,1,2,4,'2021/03/08');
insert into registros values (146,1021,9,1,3,5,'2021/03/08');
insert into registros values (147,1089,3,0,4,5,'2021/03/08');
insert into registros values (148,1126,2,1,3,1,'2021/03/08');
insert into registros values (149,1073,10,0,4,1,'2021/03/09');
insert into registros values (150,1083,4,1,3,5,'2021/03/10');
insert into registros values (151,1266,4,0,1,3,'2021/03/10');
insert into registros values (152,1040,7,1,2,2,'2021/03/11');
insert into registros values (153,1045,11,1,3,1,'2021/03/11');
insert into registros values (154,1071,5,0,3,2,'2021/03/12');
insert into registros values (155,1233,1,1,1,5,'2021/03/12');
insert into registros values (156,1141,3,0,3,5,'2021/03/12');
insert into registros values (157,1209,15,1,4,5,'2021/03/12');
insert into registros values (158,1258,13,1,5,3,'2021/03/13');
insert into registros values (159,1163,13,1,2,3,'2021/03/13');
insert into registros values (160,1166,12,1,2,1,'2021/03/13');
insert into registros values (161,1212,8,1,4,4,'2021/03/13');
insert into registros values (162,1173,5,1,5,1,'2021/03/13');
insert into registros values (163,1278,15,0,2,2,'2021/03/14');
insert into registros values (164,1287,5,1,3,2,'2021/03/14');
insert into registros values (165,1183,4,0,4,2,'2021/03/15');
insert into registros values (166,1030,15,0,5,3,'2021/03/15');
insert into registros values (167,1179,8,0,1,4,'2021/03/16');
insert into registros values (168,1244,14,0,1,5,'2021/03/16');
insert into registros values (169,1254,13,0,5,2,'2021/03/16');
insert into registros values (170,1089,5,0,4,2,'2021/03/16');
insert into registros values (171,1065,11,0,3,4,'2021/03/17');
insert into registros values (172,1261,13,1,5,4,'2021/03/19');
insert into registros values (173,1128,12,0,4,5,'2021/03/20');
insert into registros values (174,1081,5,1,5,5,'2021/03/20');
insert into registros values (175,1119,4,1,5,4,'2021/03/23');
insert into registros values (176,1274,15,1,3,4,'2021/03/23');
insert into registros values (177,1212,15,1,3,3,'2021/03/23');
insert into registros values (178,1072,14,0,5,3,'2021/03/24');
insert into registros values (179,1083,14,0,4,2,'2021/03/24');
insert into registros values (180,1259,14,1,3,5,'2021/03/25');
insert into registros values (181,1059,13,1,4,5,'2021/03/25');
insert into registros values (182,1276,7,1,1,2,'2021/03/25');
insert into registros values (183,1152,13,1,3,3,'2021/03/25');
insert into registros values (184,1009,12,1,1,5,'2021/03/25');
insert into registros values (185,1072,4,1,5,3,'2021/03/25');
insert into registros values (186,1125,10,0,4,2,'2021/03/26');
insert into registros values (187,1274,13,0,1,3,'2021/03/26');
insert into registros values (188,1133,7,1,3,4,'2021/03/26');
insert into registros values (189,1053,11,1,1,1,'2021/03/27');
insert into registros values (190,1101,12,1,3,5,'2021/03/27');
insert into registros values (191,1252,3,1,5,3,'2021/03/27');
insert into registros values (192,1017,3,1,2,5,'2021/03/27');
insert into registros values (193,1294,4,1,4,3,'2021/03/27');
insert into registros values (194,1186,5,0,3,2,'2021/03/28');
insert into registros values (195,1046,3,1,1,3,'2021/03/28');
insert into registros values (196,1076,2,1,1,1,'2021/03/29');
insert into registros values (197,1184,13,1,4,2,'2021/03/29');
insert into registros values (198,1137,13,0,4,4,'2021/03/29');
insert into registros values (199,1231,4,0,4,5,'2021/03/29');
insert into registros values (200,1046,14,1,4,3,'2021/03/30');
insert into registros values (201,1174,11,0,1,4,'2021/04/01');
insert into registros values (202,1293,4,1,1,1,'2021/04/01');
insert into registros values (203,1028,4,1,5,1,'2021/04/01');
insert into registros values (204,1103,15,1,5,3,'2021/04/01');
insert into registros values (205,1245,1,0,5,2,'2021/04/01');
insert into registros values (206,1055,6,1,2,3,'2021/04/02');
insert into registros values (207,1185,5,0,4,4,'2021/04/02');
insert into registros values (208,1280,13,0,3,4,'2021/04/03');
insert into registros values (209,1117,9,0,5,3,'2021/04/03');
insert into registros values (210,1016,3,1,1,1,'2021/04/05');
insert into registros values (211,1065,1,0,3,3,'2021/04/05');
insert into registros values (212,1169,2,1,1,1,'2021/04/05');
insert into registros values (213,1193,13,1,1,2,'2021/04/05');
insert into registros values (214,1175,13,1,5,5,'2021/04/06');
insert into registros values (215,1262,12,1,2,3,'2021/04/07');
insert into registros values (216,1117,8,1,5,3,'2021/04/07');
insert into registros values (217,1123,1,0,4,2,'2021/04/08');
insert into registros values (218,1038,12,0,4,3,'2021/04/08');
insert into registros values (219,1255,8,1,5,2,'2021/04/08');
insert into registros values (220,1050,14,1,4,5,'2021/04/08');
insert into registros values (221,1289,1,1,4,5,'2021/04/09');
insert into registros values (222,1122,6,1,2,4,'2021/04/09');
insert into registros values (223,1108,7,1,1,4,'2021/04/09');
insert into registros values (224,1067,11,0,5,1,'2021/04/09');
insert into registros values (225,1296,1,0,5,4,'2021/04/10');
insert into registros values (226,1180,6,1,3,2,'2021/04/10');
insert into registros values (227,1058,3,0,2,5,'2021/04/10');
insert into registros values (228,1042,1,0,3,3,'2021/04/10');
insert into registros values (229,1268,7,1,4,4,'2021/04/11');
insert into registros values (230,1209,11,0,1,1,'2021/04/11');
insert into registros values (231,1098,11,0,3,2,'2021/04/11');
insert into registros values (232,1221,12,0,4,4,'2021/04/12');
insert into registros values (233,1122,1,1,1,1,'2021/04/12');
insert into registros values (234,1157,15,0,1,4,'2021/04/12');
insert into registros values (235,1097,9,1,5,1,'2021/04/13');
insert into registros values (236,1155,12,0,5,4,'2021/04/14');
insert into registros values (237,1109,1,0,4,1,'2021/04/15');
insert into registros values (238,1124,8,1,4,2,'2021/04/15');
insert into registros values (239,1044,1,0,3,5,'2021/04/15');
insert into registros values (240,1123,13,1,2,5,'2021/04/15');
insert into registros values (241,1022,15,0,3,5,'2021/04/15');
insert into registros values (242,1111,5,1,4,4,'2021/04/15');
insert into registros values (243,1230,3,0,5,3,'2021/04/15');
insert into registros values (244,1218,15,1,2,5,'2021/04/16');
insert into registros values (245,1097,10,0,5,5,'2021/04/17');
insert into registros values (246,1170,4,0,4,3,'2021/04/17');
insert into registros values (247,1146,4,0,4,2,'2021/04/17');
insert into registros values (248,1122,4,0,1,1,'2021/04/17');
insert into registros values (249,1015,12,0,1,3,'2021/04/17');
insert into registros values (250,1134,15,1,5,5,'2021/04/17');
insert into registros values (251,1268,8,0,3,5,'2021/04/18');
insert into registros values (252,1151,10,0,2,2,'2021/04/18');
insert into registros values (253,1034,9,1,5,4,'2021/04/19');
insert into registros values (254,1137,4,0,1,5,'2021/04/19');
insert into registros values (255,1279,9,0,3,4,'2021/04/20');
insert into registros values (256,1284,1,1,1,3,'2021/04/20');
insert into registros values (257,1076,7,0,1,4,'2021/04/20');
insert into registros values (258,1056,12,1,3,5,'2021/04/21');
insert into registros values (259,1165,5,0,4,5,'2021/04/21');
insert into registros values (260,1160,15,1,1,5,'2021/04/22');
insert into registros values (261,1165,13,0,1,3,'2021/04/22');
insert into registros values (262,1071,4,0,1,1,'2021/04/23');
insert into registros values (263,1162,11,1,2,3,'2021/04/23');
insert into registros values (264,1276,10,1,4,4,'2021/04/23');
insert into registros values (265,1020,10,0,2,3,'2021/04/23');
insert into registros values (266,1097,6,0,4,4,'2021/04/23');
insert into registros values (267,1015,9,1,4,3,'2021/04/24');
insert into registros values (268,1037,15,1,5,3,'2021/04/24');
insert into registros values (269,1071,7,0,5,5,'2021/04/24');
insert into registros values (270,1268,4,0,5,2,'2021/04/25');
insert into registros values (271,1096,5,1,2,1,'2021/04/25');
insert into registros values (272,1073,5,0,2,5,'2021/04/25');
insert into registros values (273,1030,13,1,4,1,'2021/04/25');
insert into registros values (274,1181,1,0,3,5,'2021/04/26');
insert into registros values (275,1087,10,1,3,3,'2021/04/26');
insert into registros values (276,1058,11,1,1,2,'2021/04/27');
insert into registros values (277,1148,12,0,4,1,'2021/04/27');
insert into registros values (278,1286,6,0,3,1,'2021/04/28');
insert into registros values (279,1024,14,0,4,5,'2021/04/28');
insert into registros values (280,1025,2,1,2,5,'2021/04/28');
insert into registros values (281,1054,2,1,5,3,'2021/04/28');
insert into registros values (282,1256,2,1,2,2,'2021/04/28');
insert into registros values (283,1272,15,0,5,5,'2021/04/28');
insert into registros values (284,1240,15,1,5,4,'2021/04/29');
insert into registros values (285,1298,10,1,4,4,'2021/04/29');
insert into registros values (286,1226,5,0,2,3,'2021/04/29');
insert into registros values (287,1257,7,1,3,5,'2021/04/29');
insert into registros values (288,1129,12,0,2,4,'2021/04/30');
insert into registros values (289,1018,13,1,3,5,'2021/04/30');
insert into registros values (290,1111,11,0,3,3,'2021/04/30');
insert into registros values (291,1066,11,1,5,1,'2021/04/30');
insert into registros values (292,1141,5,1,1,2,'2021/04/30');
insert into registros values (293,1056,2,0,2,4,'2021/04/30');
insert into registros values (294,1153,8,1,4,4,'2021/05/01');
insert into registros values (295,1143,2,0,4,4,'2021/05/01');
insert into registros values (296,1164,12,0,5,2,'2021/05/01');
insert into registros values (297,1147,12,1,2,2,'2021/05/01');
insert into registros values (298,1294,12,0,4,5,'2021/05/02');
insert into registros values (299,1133,10,0,2,5,'2021/05/02');
insert into registros values (300,1193,10,0,4,1,'2021/05/02');
insert into registros values (301,1259,3,0,4,2,'2021/05/02');
insert into registros values (302,1106,13,1,5,4,'2021/05/02');
insert into registros values (303,1213,15,0,5,2,'2021/05/03');
insert into registros values (304,1118,10,0,2,2,'2021/05/03');
insert into registros values (305,1121,4,0,3,2,'2021/05/04');
insert into registros values (306,1140,1,0,3,4,'2021/05/04');
insert into registros values (307,1147,11,1,3,2,'2021/05/04');
insert into registros values (308,1011,10,1,3,5,'2021/05/04');
insert into registros values (309,1048,13,1,2,4,'2021/05/04');
insert into registros values (310,1263,1,1,2,2,'2021/05/05');
insert into registros values (311,1299,14,0,1,5,'2021/05/05');
insert into registros values (312,1029,2,1,2,1,'2021/05/05');
insert into registros values (313,1120,15,1,3,1,'2021/05/05');
insert into registros values (314,1203,7,1,2,5,'2021/05/05');
insert into registros values (315,1167,1,1,1,2,'2021/05/05');
insert into registros values (316,1246,1,0,2,1,'2021/05/06');
insert into registros values (317,1098,5,0,3,3,'2021/05/07');
insert into registros values (318,1270,3,1,3,1,'2021/05/08');
insert into registros values (319,1105,13,0,2,3,'2021/05/08');
insert into registros values (320,1117,13,1,3,1,'2021/05/08');
insert into registros values (321,1089,4,0,1,3,'2021/05/08');
insert into registros values (322,1053,9,0,2,1,'2021/05/09');
insert into registros values (323,1007,15,1,4,3,'2021/05/09');
insert into registros values (324,1136,3,0,2,3,'2021/05/10');
insert into registros values (325,1107,10,0,1,5,'2021/05/10');
insert into registros values (326,1283,4,1,1,1,'2021/05/10');
insert into registros values (327,1193,2,0,3,1,'2021/05/11');
insert into registros values (328,1052,7,0,5,1,'2021/05/11');
insert into registros values (329,1042,9,1,5,2,'2021/05/12');
insert into registros values (330,1245,9,0,1,1,'2021/05/13');
insert into registros values (331,1051,5,1,3,2,'2021/05/13');
insert into registros values (332,1232,5,0,5,2,'2021/05/13');
insert into registros values (333,1244,2,0,4,3,'2021/05/13');
insert into registros values (334,1034,7,1,4,1,'2021/05/13');
insert into registros values (335,1238,15,0,3,2,'2021/05/14');
insert into registros values (336,1171,14,1,5,4,'2021/05/14');
insert into registros values (337,1271,5,0,1,1,'2021/05/15');
insert into registros values (338,1041,3,0,5,1,'2021/05/15');
insert into registros values (339,1017,13,1,4,1,'2021/05/16');
insert into registros values (340,1085,9,0,4,2,'2021/05/16');
insert into registros values (341,1145,12,0,4,1,'2021/05/17');
insert into registros values (342,1053,10,0,1,2,'2021/05/17');
insert into registros values (343,1153,2,0,2,1,'2021/05/17');
insert into registros values (344,1041,6,0,2,5,'2021/05/17');
insert into registros values (345,1178,9,0,5,1,'2021/05/17');
insert into registros values (346,1083,5,0,1,5,'2021/05/17');
insert into registros values (347,1009,7,0,3,3,'2021/05/17');
insert into registros values (348,1049,9,0,4,5,'2021/05/18');
insert into registros values (349,1100,15,0,5,3,'2021/05/18');
insert into registros values (350,1160,3,0,1,5,'2021/05/18');
insert into registros values (351,1110,15,1,5,4,'2021/05/18');
insert into registros values (352,1299,9,0,3,3,'2021/05/19');
insert into registros values (353,1080,13,1,5,4,'2021/05/19');
insert into registros values (354,1200,7,0,3,4,'2021/05/19');
insert into registros values (355,1048,1,0,2,4,'2021/05/20');
insert into registros values (356,1296,3,1,5,1,'2021/05/20');
insert into registros values (357,1132,2,1,4,1,'2021/05/20');
insert into registros values (358,1198,10,1,3,1,'2021/05/21');
insert into registros values (359,1080,12,1,2,2,'2021/05/21');
insert into registros values (360,1209,2,0,1,1,'2021/05/21');
insert into registros values (361,1082,6,0,2,4,'2021/05/22');
insert into registros values (362,1299,9,0,2,4,'2021/05/22');
insert into registros values (363,1300,13,1,5,1,'2021/05/23');
insert into registros values (364,1124,4,1,5,1,'2021/05/24');
insert into registros values (365,1137,14,1,1,3,'2021/05/24');
insert into registros values (366,1278,10,1,4,5,'2021/05/25');
insert into registros values (367,1104,6,0,5,4,'2021/05/26');
insert into registros values (368,1178,11,0,1,1,'2021/05/26');
insert into registros values (369,1068,1,1,1,5,'2021/05/26');
insert into registros values (370,1141,12,1,3,4,'2021/05/26');
insert into registros values (371,1202,7,1,4,5,'2021/05/28');
insert into registros values (372,1196,8,0,5,3,'2021/05/28');
insert into registros values (373,1112,4,1,5,4,'2021/05/28');
insert into registros values (374,1003,12,1,2,3,'2021/05/29');
insert into registros values (375,1112,7,1,2,1,'2021/05/29');
insert into registros values (376,1012,2,0,4,5,'2021/05/30');
insert into registros values (377,1233,9,0,1,5,'2021/05/30');
insert into registros values (378,1139,13,1,3,2,'2021/05/30');
insert into registros values (379,1217,15,0,3,1,'2021/05/31');
insert into registros values (380,1261,9,0,3,5,'2021/06/01');
insert into registros values (381,1274,15,1,3,2,'2021/06/01');
insert into registros values (382,1085,1,1,2,1,'2021/06/01');
insert into registros values (383,1280,6,0,1,1,'2021/06/01');
insert into registros values (384,1196,7,1,3,5,'2021/06/02');
insert into registros values (385,1105,4,1,1,2,'2021/06/02');
insert into registros values (386,1009,11,1,3,3,'2021/06/02');
insert into registros values (387,1163,10,1,4,3,'2021/06/03');
insert into registros values (388,1296,4,0,3,1,'2021/06/03');
insert into registros values (389,1046,10,0,2,2,'2021/06/04');
insert into registros values (390,1011,3,1,4,4,'2021/06/05');
insert into registros values (391,1130,12,0,3,5,'2021/06/05');
insert into registros values (392,1068,3,1,4,2,'2021/06/06');
insert into registros values (393,1180,14,0,1,5,'2021/06/06');
insert into registros values (394,1231,13,1,4,1,'2021/06/07');
insert into registros values (395,1198,15,1,2,1,'2021/06/07');
insert into registros values (396,1192,3,1,2,3,'2021/06/07');
insert into registros values (397,1184,14,1,1,2,'2021/06/08');
insert into registros values (398,1058,11,0,3,5,'2021/06/09');
insert into registros values (399,1198,14,1,2,5,'2021/06/09');
insert into registros values (400,1255,6,0,5,2,'2021/06/09');

use servicios;

/*
idea de cantidad fallida

drop view if exists vfechas;
create view vfechas as
 select (YEAR(registros.fecha) * 10000) + (month(registros.fecha) * 100) + day(registros.fecha) as id_fecha, YEAR(registros.fecha) as anio, month(registros.fecha) as mes, day(registros.fecha) as dia
 from registros
 group by registros.fecha
 order by id_fecha asc;
 
 select * from vfechas order by vfechas.id_fecha asc;
 
 
drop view if exists vregistros;
create view vregistros as 
SELECT contratos.id_provincia, (YEAR(registros.fecha) * 10000) + (month(registros.fecha) * 100) + day(registros.fecha) as id_fecha, provincias.id_region, servicios.id_servicio, soluciones.id_solucion, count(registros.id_registro) as cantidad
FROM contratos INNER JOIN registros on contratos.id_contrato = registros.id_contrato
INNER JOIN provincias on contratos.id_provincia = provincias.id_provincia
inner join planes on contratos.id_plan = planes.id_plan
inner join servicios on servicios.id_servicio = planes.id_plan
inner join vfechas on id_fecha = vfechas.id_fecha
inner join soluciones on registros.id_solucion = soluciones.id_solucion
group by contratos.id_provincia, vfechas.id_fecha, provincias.id_region, servicios.id_servicio, soluciones.id_solucion
order by id_fecha asc;

select vfechas.mes, count(*)
from vregistros
inner join vfechas on vregistros.id_fecha = vfechas.id_fecha
group by vfechas.mes;


select count(*) from vregistros left join vfechas on vregistros.id_fecha = vfechas.id_fecha where vfechas.id_fecha is null;

*/

/*
-- original
drop view if exists vfechas;
create view vfechas as
	select registros.id_registro as id_fecha, year(registros.fecha) as anio, month(registros.fecha) as mes, day(registros.fecha) as dia
    from registros;
    
select * from vfechas;

drop view if exists vregistros;
create view vregistros as 
SELECT registros.id_registro, contratos.id_provincia, vfechas.id_fecha as id_fecha, provincias.id_region, servicios.id_servicio, soluciones.id_solucion
FROM contratos INNER JOIN registros on contratos.id_contrato = registros.id_contrato
INNER JOIN provincias on contratos.id_provincia = provincias.id_provincia
inner join planes on contratos.id_plan = planes.id_plan
inner join servicios on servicios.id_servicio = planes.id_plan
inner join vfechas on registros.id_registro = vfechas.id_fecha
inner join soluciones on registros.id_solucion = soluciones.id_solucion
group by contratos.id_provincia, vfechas.id_fecha, provincias.id_region, servicios.id_servicio, soluciones.id_solucion
order by id_fecha asc;
*/

drop view if exists vfechas;
create view vfechas as
	select registros.id_registro as id_fecha, year(registros.fecha) as anio, month(registros.fecha) as mes, day(registros.fecha) as dia, count(registros.id_registro) as cantidad
    from registros
    group by  year(registros.fecha), month(registros.fecha), day(registros.fecha);
    
select * from vfechas;

drop view if exists vregistros;
create view vregistros as 
SELECT registros.id_registro, contratos.id_provincia, vfechas.id_fecha as id_fecha, provincias.id_region, servicios.id_servicio, soluciones.id_solucion, vfechas.cantidad
FROM contratos INNER JOIN registros on contratos.id_contrato = registros.id_contrato
INNER JOIN provincias on contratos.id_provincia = provincias.id_provincia
inner join planes on contratos.id_plan = planes.id_plan
inner join servicios on servicios.id_servicio = planes.id_plan
inner join vfechas on registros.id_registro = vfechas.id_fecha
inner join soluciones on registros.id_solucion = soluciones.id_solucion
group by contratos.id_provincia, vfechas.id_fecha, provincias.id_region, servicios.id_servicio, soluciones.id_solucion
order by id_fecha asc;



select * from vregistros;

select *
from registros
inner join contratos on registros.id_contrato = contratos.id_contrato
inner join provincias on provincias.id_provincia = contratos.id_provincia
group by provincias.id_provincia

 /*
 drop table if exists dfecha;
 create table dfecha (
	id_fecha integer not null auto_increment,
    anio integer not null,
    mes integer not null,
    dia integer not null,
    primary key (id_fecha)
) engine = InnoDB;

delimiter //
create procedure insert_fechas()
begin

declare cantidad integer;
declare contador integer;
declare _fecha date;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		rollback;
		SELECT 'Error en transaction' AS message;
END;

select distinct count(registros.fecha)
into cantidad
from registros;

set contador = 1;

start transaction;
	repeat
		select registros.id_registro, registros.fecha
		-- into _fecha
        from registros
        -- where registros.id_registro = contador
        group by registros.fecha;
        
        
		insert into dfecha(anio, mes, dia) values(year(_fecha), month(_fecha), day(_fecha));
        set contador = contador + 1;
    until contador = cantidad
    end repeat;
commit;
    
end
//
delimiter ;
 */