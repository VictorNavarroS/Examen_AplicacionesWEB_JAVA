create database Examen;
use Examen;

create table Usuarios(
id int not null auto_increment,
rut varchar(15),
nombre varchar(40),
apellidos varchar(40),
correo varchar(100) unique,
clave varchar(40),
tipo int,
estado bit,
primary key (id)
);

create table Productos(
id_producto int not null auto_increment,
serie varchar(50),
nombre_producto varchar(80),
descripcion varchar (150),
cod_imagen varchar (20),
valor int,
estado bit,
primary key (id_producto)
);

create table compra(
numero_compra int,
nombreCliente varchar(100),
rutCliente varchar(15),
serieProducto varchar(40),
nombreProducto varchar(80),
cantidad int ,
valorUnitario int,
estado bit
);

insert into compra (numero_compra,nombreCliente,rutCliente,serieProducto,nombreProducto,cantidad,valorUnitario,estado)
 values (1,'yo','17307','asd','wea',5,1200,1);


select * from productos
select * from usuarios
select * from compra



insert into Usuarios (rut,nombre,apellidos,correo,clave,tipo,estado) values ('1-9','victor','navarro','victor@gmail.com','tinto666',1,1);
insert into Usuarios (rut,nombre,apellidos,correo,clave,tipo,estado)values ('2-9','tinto','navarr','victo@gmail.com','tinto66',2,1);
insert into Usuarios (rut,nombre,apellidos,correo,clave,tipo,estado)values ('3-9','nav','arro','vict@gmail.com','tinto6',2,1);
insert into Usuarios (rut,nombre,apellidos,correo,clave,tipo,estado)values ('4-9','v','arros','vic@gmail.com','tinto6',2,1);
insert into Usuarios (rut,nombre,apellidos,correo,clave,tipo,estado)values ('6-9','navarro','victor','v@gmail.com','tinto6',2,0);

insert into Productos (serie,nombre_producto,descripcion,cod_imagen,valor,estado) values ('vdr','prueba','Prueba de imagen','vader.png',15000,1);
insert into Productos (serie,nombre_producto,descripcion,cod_imagen,valor,estado) values ('bb','prueba','Prueba de imagen','boba.png',8000,1);
insert into Productos (serie,nombre_producto,descripcion,cod_imagen,valor,estado) values ('jng','prueba','Prueba de imagen','jango.png',5000,1);

update usuarios set nombre = '',
					apellidos='',
                    correo ='algo',
                    clave='',
                    tipo=2,
                    estado=1 
				where id=2; 


select * from Usuarios 