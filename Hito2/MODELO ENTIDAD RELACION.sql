CREATE DATABASE Hito2Tarea;
USE Hito2Tarea;

CREATE TABLE cliente(
id_cliente varchar (12) PRIMARY KEY NOT NULL,
nombres varchar(100) NOT NULL,
apellidos varchar (100) NOT NULL,
edad integer NOT NULL,
domicilio varchar(100) NOT NULL,
);
CREATE TABLE pedido
(
id_pedido integer PRIMARY KEY IDENTITY NOT NULL,
articulo varchar (12) NOT NULL,
costo integer NOT NULL,
fecha varchar (100),
);

CREATE TABLE detalle_pedido
(
id_detalle_pedido INT PRIMARY KEY  NOT NULL,
id_cliente varchar (12)NULL,
id_pedido integer NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
);
 INSERT INTO cliente(id_cliente,nombres,apellidos,edad,domicilio)
 VALUES ('134HG','MARCOS','QUISPE YUJRA',17,'AV/1 ZN1');
 INSERT INTO cliente(id_cliente,nombres,apellidos,edad,domicilio)
 VALUES ('134H34G','MIGUEL','FERNANDEZ APAZA',24,'AV/2 ZN2');
 
  
 INSERT INTO pedido(id_pedido,articulo,costo,fecha)
 VALUES(1435543,'POLLO2',35,'11/06/22');

 INSERT INTO detalle_pedido(id_detalle_pedido,id_cliente,id_pedido)
 VALUES (244535,'134HG','143555');
 SELECT* FROM detalle_pedido;
 TRUNCATE TABLE detalle_pedido;
 DROP TABLE detalle_pedido;
 DROP TABLE cliente;