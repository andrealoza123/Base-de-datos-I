CREATE DATABASE hito4_funciones;
USE hito4_funciones;

--MANEJO DE FUNCIONES
--UNA FUNCION DE AGREGACION SIEMPRE SE EJECUTA
--EN LA CLAUSULA SELECT
--ADEMAS SIEMPRE RETORNA UN UNICO VALOR(UNA FILA)
--ES APLICADO A UN GRUPO REGISTROS(A UNA COLUMNA DE LA TABLA)



CREATE TABLE escuela
(
id_esc INTEGER IDENTITY PRIMARY KEY NOT NULL,
nombre VARCHAR (30) NOT NULL,
direccion VARCHAR (100) NOT NULL,
turno VARCHAR (20) NOT NULL
);

INSERT INTO escuela (nombre,direccion,turno) VALUES
('San Simon','Cochambamba','manana'),
('Andres Bellos','El Alto','manana-tarde'),
('Amor de Dios fe y alegria','El Alto','manana-tarde'),
('Don Bosco','La Paz','manana-tarde-noche');



CREATE TABLE estudiantes
(
 id_est INTEGER IDENTITY PRIMARY KEY NOT NULL,
 nombres VARCHAR(25) NOT NULL,
 apellidos VARCHAR (30) NOT NULL,
 edad INTEGER NOT NULL,
 fono INTEGER NOT NULL,
 email VARCHAR (100)not null,
 direccion VARCHAR(200)NOT NULL,
 genero VARCHAR (200) NOT NULL,
 id_esc INTEGER NOT NULL,
 licencia_conducir BIT NOT NULL,
 FOREIGN KEY (id_esc) REFERENCES escuela (id_esc)
);
INSERT INTO estudiantes(nombres,apellidos,edad,fono,email,direccion,genero,licencia_conducir,id_esc) VALUES
('Miguel','Gonzales Veliz',20,2832115,'miguel@gmail.com','Av. 6 de agosto','masculino',0,1),
('Sandra','Mavir Uria',25,2832116,'sandra@gmail.com','Av. 6 de agosto','femenino',0,2),
('Joel','Aduviri Mondar',30,2832117,'joel@gmail.com','Av. 6 de agosto','masculino',0,3),
('Andrea','Arias Ballesteros',21,2832118,'andrea@gmail.com','Av. 6 de agosto','femenino',0,4),
('Santos','Montes Valenzuela',24,2832119,'santos@gmail.com','Av. 6 de agosto','masculino',0,1);
INSERT INTO estudiantes(nombres,apellidos,edad,fono,email,direccion,genero,licencia_conducir,id_esc) VALUES
('Ana','Gonzales Veliz',20,2832125,'miguel@gmail.com','Av. 6 de agosto','femenino',1,2);
INSERT INTO estudiantes(nombres,apellidos,edad,fono,email,direccion,genero,licencia_conducir,id_esc) VALUES
('Pepito','Gonzales Veliz',20,2832135,'miguel@gmail.com','Av. 6 de agosto','masculino',0,3);

SELECT count(est.id_est)
FROM estudiantes AS est
INNER JOIN escuela AS esc ON est.id_esc=esc.id_esc
WHERE esc.nombre='Amor de Dios fe y alegria'; 

--Crear la consulta SQL que obtenga la mayor edad de los estudiantes (cuyo genero sea masculino o femenino).
SELECT MAX (est.edad)
FROM estudiantes AS est;

SELECT count(est.id_est)
FROM estudiantes AS est
INNER JOIN escuela AS esc ON est.id_esc=esc.id_esc
WHERE esc.turno='manana-tarde'; 

--Determinar cuantos estudiantes mayores a 25 años estan es escuelas que tienen solo el turno de la tarde
SELECT count(est.id_est)
FROM estudiantes AS est
INNER JOIN escuela AS esc ON est.id_esc=esc.id_esc
WHERE esc.turno like '%tarde%' and est.edad>25; 

CREATE FUNCTION retorna_nombre_materia()
RETURNS VARCHAR(20) AS
BEGIN
RETURN 'Base de Datos I'
END;

SELECT dbo.retorna_nombre_materia() AS DBA;

--CREATE FUNCTION retorna_nombre_materia_v2()
--RETURNS VARCHAR(25) AS
--BEGIN
--DECLARE @nombre VARCHAR(25);
--SET @nombre='Basw de datos I';
--RETURN @nombre;
--END;
--SELECT dbo.retorna_nombre_materia_v2();
ALTER FUNCTION retorna_nombre_materia_v2()
RETURNS VARCHAR(25) AS
BEGIN
DECLARE @nombre VARCHAR(25);
SET @nombre='Basw de datos III';
RETURN @nombre;
END;
SELECT dbo.retorna_nombre_materia_v2();

CREATE FUNCTION retorna_nombre_materia_v3(@nombreMateria VARCHAR(25))
RETURNS VARCHAR(25) AS
BEGIN
DECLARE @nombre VARCHAR(25);
SET @nombre = @nombreMateria;
RETURN @nombre;
END;
SELECT dbo.retorna_nombre_materia_v3('DBA I');

--CREAR UNA FUNCION QUE NO RECIBE PARAMERRO 
--LA FUNCION DEBE SUMAR DOSD NUMEROS CUALQUIERA
--LA FUNCION RETORNA LA SUMA

CREATE FUNCTION suma_dos_numeros()
RETURNS INTEGER AS
BEGIN
RETURN(5+5);
END;
SELECT dbo.suma_dos_numeros();

ALTER FUNCTION suma_dos_numeros_1()
RETURNS INTEGER AS
BEGIN
DECLARE @resultado INTEGER;
SET @resultado 
END;
SELECT suma_dos_numeros();

--CREAR UNA FUNCION QUE RECIBE QUE RECIBE TRES PARAMETROS 
--LA FUNCION DEBE SUMAR ESOS 3 PARAMATEROS 
--LA FUNCION RETORNA ESA SUMA


CREATE FUNCTION suma_de_tres_numeros(@numero1 INT,)
RETURNS VARCHAR(25) AS
BEGIN
DECLARE @nombre VARCHAR(25);
SET @nombre = @nombreMateria;
RETURN @nombre;
END;
SELECT dbo.retorna_nombre_materia_v3('DBA I');
