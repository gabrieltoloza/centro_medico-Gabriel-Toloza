DROP DATABASE IF EXISTS centro_medico;

CREATE DATABASE centro_medico;

USE centro_medico;


CREATE TABLE duenos (
	id_dueno INT AUTO_INCREMENT NOT NULL,
	nombre_dueno VARCHAR(255) NOT NULL,
	apellido_dueno VARCHAR(255) NOT NULL,
	dni_dueno BIGINT UNIQUE NOT NULL,
	domicilio_dueno VARCHAR(255) NOT NULL,
	telefono_dueno BIGINT UNIQUE NOT NULL,
	PRIMARY KEY (id_dueno)
) COMMENT "Tabla para almacenar a los dueños/socios del Centro Medico";




CREATE TABLE empleados (
	id_empleado INT AUTO_INCREMENT NOT NULL,
	nombre_empleado VARCHAR(255) NOT NULL,
	apellido_empleado VARCHAR(255) NOT NULL,
	dni_empleado BIGINT NOT NULL UNIQUE,
	domicilio_empleado VARCHAR(255) NOT NULL,
	telefono_empleado BIGINT NOT NULL UNIQUE,
	fecha_alta DATE,
	PRIMARY KEY (id_empleado)
) COMMENT "Tabla para almacenar a los empleados del Centro Medico";



CREATE TABLE puestos (
	id_puesto INT AUTO_INCREMENT NOT NULL,
	nombre_puesto VARCHAR(255) NOT NULL,
	honorario_mensual DECIMAL(10,2) NOT NULL,
	descripcion_puesto VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_puesto)
) COMMENT "Tabla para almacenar los diferentes puestos de trabajo del Centro Medico excepto los Medicos";




CREATE TABLE empleados_puestos (
	id_empleado INT NOT NULL,
	id_puesto INT NOT NULL,
	PRIMARY KEY (id_empleado, id_puesto)
) COMMENT "Tabla intermedia entre la entidad Puestos y Empleados";







CREATE TABLE obra_social_empleados (
	id_obra_social_empleados INT AUTO_INCREMENT NOT NULL,
	id_empleado INT NOT NULL,
	nombre_obra_social VARCHAR(255) NOT NULL,
	carnet_numero BIGINT NOT NULL UNIQUE,
	fecha_alta DATE,
	PRIMARY KEY (id_obra_social_empleados)
) COMMENT "Tabla para almacenar la relacion de empleados y obra social del centro medico";






CREATE TABLE honorario_facturas (
	id_honorario_factura INT AUTO_INCREMENT NOT NULL,
	id_empleado INT NOT NULL,
	mes_facturado DATE,
	PRIMARY KEY (id_honorario_factura)
) COMMENT "Tabla para registrar la facturacion de los empleados del Centro Medico";



	


CREATE TABLE pacientes (
	id_paciente INT AUTO_INCREMENT NOT NULL,
	nombre_paciente VARCHAR(255) NOT NULL,
	apellido VARCHAR(255) NOT NULL,
	dni BIGINT NOT NULL UNIQUE,
	fecha_alta DATE,
	estado BOOLEAN DEFAULT FALSE,
	tiene_obra_social BOOLEAN DEFAULT FALSE,
	PRIMARY KEY (id_paciente)
) COMMENT "Tabla que almacena pacientes del Centro Medico";




CREATE TABLE obra_social_pacientes (
	id_obra_social_pacientes INT AUTO_INCREMENT NOT NULL,
	id_paciente INT NOT NULL,
	nombre_obra_social_paciente VARCHAR(255) NOT NULL,
	carnet_numero BIGINT NOT NULL UNIQUE,
	PRIMARY KEY (id_obra_social_pacientes)
) COMMENT "Tabla para almacenar la relacion entre pacientes y sus obras sociales";



	



CREATE TABLE medicos (
	id_medico INT AUTO_INCREMENT NOT NULL,
	nombre_medico VARCHAR(255) NOT NULL,
	apellido_medico VARCHAR(255) NOT NULL,
	cuit BIGINT NOT NULL UNIQUE,
	email VARCHAR(255) NOT NULL UNIQUE,
	estado BOOLEAN DEFAULT FALSE,
	fecha_alta DATE,
	PRIMARY KEY (id_medico)
) COMMENT "Tabla para almacenar los medicos/profesionales del Centro Medico";


CREATE TABLE profesiones (
	id_profesion INT AUTO_INCREMENT NOT NULL,
	nombre_profesion VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_profesion)
) COMMENT "Tabla para almacenar las profesiones de los Medicos";


CREATE TABLE profesion_medicos (
	id_profesion INT NOT NULL,
	id_medico INT NOT NULL,
	PRIMARY KEY (id_profesion, id_medico)
) COMMENT "Tabla intermedia para relacionar medicos con profesiones.";






CREATE TABLE matriculas (
	id_matricula INT AUTO_INCREMENT NOT NULL,
	id_medico INT NOT NULL,
	numero_matricula BIGINT NOT NULL UNIQUE,
	fecha_emitida DATE,
	PRIMARY KEY (id_matricula)
) COMMENT "Tabla para almacenar las matriculas de los profesionales.";


	



CREATE TABLE RUP_registro_matriculas (
	id_registro INT AUTO_INCREMENT NOT NULL,
	id_matricula INT NOT NULL,
	fecha_registrada DATE,
	PRIMARY KEY (id_registro)
) COMMENT "Tabla para almacenar los registros de las matriculas en el R.U.P (Registro unico de profesionales de la salud";







CREATE TABLE tratamientos (
	id_tratamiento INT AUTO_INCREMENT NOT NULL,
	id_medico INT NOT NULL,
	id_paciente INT NOT NULL,
	descripcion TEXT,
	fecha_inicio DATE,
	fecha_fin DATE,
	PRIMARY KEY (id_tratamiento)
) COMMENT "Tabla para almacenar los tratamientos vinculando paciente/medico y el detalle del tratamiento";

	



CREATE TABLE factura_paciente (
	id_factura_paciente INT AUTO_INCREMENT NOT NULL,
	id_tratamiento INT NOT NULL,
	id_paciente INT NOT NULL,
	cuota DECIMAL(12,2) NOT NULL,
	mes_facutado DATE,
	PRIMARY KEY (id_factura_paciente)
) COMMENT "Tabla para facturar los servicios prestados por los Medicos";


	



CREATE TABLE factura_medico (
	id_factura_medico INT AUTO_INCREMENT NOT NULL,
	id_medico INT NOT NULL,
	id_tratamiento INT NOT NULL,
	horas_trabajadas INT NOT NULL,
	monto DECIMAL(12,2) NOT NULL,
	mes_facturado DATE,
	PRIMARY KEY (id_factura_medico)
) COMMENT "Tabla para facturar los servicios prestados a los Pacientes";

	









-- --------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------





-- Constraints para la tabla "empleados_puestos"
-- Constraints para la tabla "empleados_puestos"
-- Constraints para la tabla "empleados_puestos"
ALTER TABLE centro_medico.empleados_puestos
	ADD CONSTRAINT FK_id_empleado FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado);

ALTER TABLE centro_medico.empleados_puestos
	ADD CONSTRAINT FK_id_puesto FOREIGN KEY (id_puesto) REFERENCES puestos(id_puesto);





-- Constraints para la tabla "obra_social_empleados"
-- Constraints para la tabla "obra_social_empleados"
-- Constraints para la tabla "obra_social_empleados"
ALTER TABLE centro_medico.obra_social_empleados
	ADD CONSTRAINT FK_id_empleado_obra_social FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado);




-- Constraints para la tabla "honorario_facturas"
-- Constraints para la tabla "honorario_facturas"
-- Constraints para la tabla "honorario_facturas"
ALTER TABLE centro_medico.honorario_facturas
	ADD CONSTRAINT FK_honorario_facturas_id_empleado FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado);




-- Constraints para la tabla "obra_social_pacientes"
-- Constraints para la tabla "obra_social_pacientes"
-- Constraints para la tabla "obra_social_pacientes"
ALTER TABLE centro_medico.obra_social_pacientes
	ADD CONSTRAINT FK_id_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente);



-- Constraints para la tabla "profesion_medicos"
-- Constraints para la tabla "profesion_medicos"
-- Constraints para la tabla "profesion_medicos"
ALTER TABLE centro_medico.profesion_medicos
	ADD CONSTRAINT FK_id_profesion FOREIGN KEY (id_profesion) REFERENCES profesiones(id_profesion);
	
ALTER TABLE centro_medico.profesion_medicos
	ADD CONSTRAINT FK_id_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico);



-- Constraint para la tabla "matriculas"
-- Constraint para la tabla "matriculas"
-- Constraint para la tabla "matriculas"
ALTER TABLE centro_medico.matriculas
	ADD CONSTRAINT FK_MATRICULAS_id_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico);



--Constraint para la tabla "RUP_registro_matriculas"
--Constraint para la tabla "RUP_registro_matriculas"
--Constraint para la tabla "RUP_registro_matriculas"
ALTER TABLE centro_medico.RUP_registro_matriculas 
	ADD CONSTRAINT FK_id_matricula FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula);




-- Constraints para la tabla "tratamientos"
-- Constraints para la tabla "tratamientos"
-- Constraints para la tabla "tratamientos"
ALTER TABLE centro_medico.tratamientos
	ADD CONSTRAINT FK_tratamientos_id_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico);
	
ALTER TABLE centro_medico.tratamientos
	ADD CONSTRAINT FK_tratamientos_id_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente);
	



-- Constraints para la tabla "factura_paciente"
-- Constraints para la tabla "factura_paciente"
-- Constraints para la tabla "factura_paciente"
ALTER TABLE centro_medico.factura_paciente
	ADD CONSTRAINT FK_facutra_paciente_id_tratamiento FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento);
	
ALTER TABLE centro_medico.factura_paciente
	ADD CONSTRAINT FK_factura_paciente_id_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente);
	



-- Constraints de la tabla "factura_medico"
-- Constraints de la tabla "factura_medico"
-- Constraints de la tabla "factura_medico"
ALTER TABLE centro_medico.factura_medico
	ADD CONSTRAINT FK_factura_medico_id_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico);

ALTER TABLE centro_medico.factura_medico
	ADD CONSTRAINT FK_factura_medico_id_tratamiento FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento);
	



-- --------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------------



-- Insercion de datos
-- Insercion de datos
-- Insercion de datos




INSERT INTO centro_medico.puestos (
nombre_puesto, 
honorario_mensual,
descripcion_puesto
) VALUES
	('administracion', 525189.89, 'gestionar los servicios del centro medico'),
	('limpieza/maestranza', 517555.87, 'encargados de mantener la limpieza y el orden del establecimiento'),
	('seguridad', 625120.88, 'encargado de mantener la integridad fisica y material del establecimiento y las personas.');
	




INSERT INTO centro_medico.empleados (
nombre_empleado, 
apellido_empleado, 
dni_empleado, 
domicilio_empleado, 
telefono_empleado, 
fecha_alta
) VALUES
	('Rosana', 'Ramirez', 38524874, 'Av. Libertador 888', 1147581956, '2020-05-10'),
	('Julian', 'Prieto', 31458741, 'Cordoba 9784', 1178459258, '2021-06-15'),
	('Florencia', 'Rancatti', 33562415, 'San Martin 111', 1148568525, '2020-02-22'),
	('Maria', 'Gomez', 37841595, '25 de Mayo 7418', 1178549526, '2021-11-02'),
	('Leonardo', 'Diaz', 37845159, 'Flores 2145', 1145781245, '2021-09-16'),
	('Camila', 'Rodriguez', 38525145, 'Etcheverry 14258', 1169632365, '2018-05-07'),
	('Jose', 'Cuenca', 45852159, 'Belen 147', 1145202369, '2019-08-05'),
	('Cristian', 'Perez', 95145258, 'Ameguino 7845', 1145202587, '2017-12-01'),
	('Roberto', 'Pettinato', 22154784, 'Piedras 555', 1147852549, '2018-09-18');




INSERT INTO centro_medico.empleados_puestos (
id_empleado,
id_puesto 
) VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,2),
	(5,2),
	(6,2),
	(7,3),
	(8,3),
	(9,3);




INSERT INTO centro_medico.obra_social_empleados(
id_empleado,
nombre_obra_social,
carnet_numero,
fecha_alta
) VALUES
	(1, 'OSDE', 4527485, '2018-11-05'),
	(2, 'OSDE', 4527484, '2018-12-25'),
	(3, 'OSDE', 4527483, '2018-10-11'),
	(4, 'SANCOR', 74258, '2019-05-06'),
	(5, 'SANCOR', 74257, '2019-10-25'),
	(6, 'SANCOR', 74256, '2019-11-20'),
	(7, 'UOCRA', 16425, '2020-08-17'),
	(8, 'UOCRA', 16424, '2020-07-20'),
	(9, 'UOCRA', 16423, '2020-01-17');




INSERT INTO centro_medico.honorario_facturas (
id_empleado,
mes_facturado
) VALUES 
	(1, '2024-06-28'),
	(2, '2024-06-28'),
	(3, '2024-06-28'),
	(4, '2024-06-28'),
	(5, '2024-06-28'),
	(6, '2024-06-28'),
	(7, '2024-06-28'),
	(8, '2024-06-28'),
	(9, '2024-06-28');




INSERT INTO centro_medico.duenos (
nombre_dueno,
apellido_dueno,
dni_dueno,
domicilio_dueno,
telefono_dueno
) VALUES
	('Ricardo', 'Fariña', 26458457, 'Gral. Rosas 1525', 1145258877),
	('Bernarda', 'Chela', 27410255, 'Corrientes 956', 1165255587),
	('Adrian', 'Frenucci', 29545777, 'Cordoba 1144', 1123659545);




INSERT INTO centro_medico.pacientes (
nombre_paciente,
apellido,
dni,
fecha_alta,
estado
) VALUES
	('Lucas', 'Martinez', 37412586, '2022-05-19', DEFAULT),
	('Magali', 'Gutierrez', 39456789, '2023-09-12', DEFAULT),
	('Lucia', 'Sosa', 34582569, '2023-11-27', DEFAULT),
	('Carlos', 'Lopez', 34568598, '2022-07-22', DEFAULT),
	('Marcos', 'Hernandez', 35852456, '2023-11-02', DEFAULT),
	('Juliana', 'Cruz', 35852569, '2023-02-12', DEFAULT),
	('Rocio', 'Sanchez', 38451595, '2022-08-22', DEFAULT),
	('Alejandro', 'Diaz', 37456852, '2021-10-15', DEFAULT);




INSERT INTO centro_medico.obra_social_pacientes (
id_paciente,
nombre_obra_social_paciente,
carnet_numero
) VALUES
	(1, 'OSDE', 456254),
	(2, 'SANCOR', 95258),
	(3, 'SWISS MEDICAL', 159456),
	(4, 'VITAL', 741582),
	(5, 'OSPE', 148595),
	(6, 'SWISS MEDICAL', 159425),
	(7, 'OSDE', 456354),
	(8, 'VITAL', 741963);





INSERT INTO centro_medico.medicos (
nombre_medico,
apellido_medico,
cuit,
email,
estado,
fecha_alta
) VALUES
	('Luciana', 'Murillo', 20284567845, 'luciana_murillo@gmail.com', DEFAULT, '2022-10-5'),
	('Gloria', 'Acosta', 20254854575, 'gloria_acosta@gmail.com', DEFAULT, '2021-08-07'),
	('Alexander', 'Ceballos', 20310254565, 'alexander_ceballos@gmail.com', DEFAULT, '2021-10-01'),
	('Carlos', 'Maldonado', 20285154565, 'carlos_maldonado@gmail.com', DEFAULT, '2022-01-12'),
	('Jessica', 'Prado', 20264591585, 'jessica_prado@gmail.com', DEFAULT, '2021-08-12');





INSERT INTO centro_medico.profesiones (
nombre_profesion 
) VALUES
	('psicologia'),
	('psicopedagogia'),
	('fonoaudiologia'),
	('logopeda'),
	('acompanante terapeutico'),
	('psiquiatra');





INSERT INTO centro_medico.profesion_medicos (
id_medico,
id_profesion
) VALUES 
	(1,1),
	(2,2),
	(3,6),
	(4,4),
	(5,5);





INSERT INTO centro_medico.matriculas (
id_medico,
numero_matricula,
fecha_emitida
) VALUES
	(1, 45748596, '2015-06-12'),
	(2, 45758459, '2016-09-01'),
	(3, 45759477, '2012-10-21'),
	(4, 45748510, '2014-04-28'),
	(5, 45748588, '2019-11-07');
	




	

INSERT INTO centro_medico.RUP_registro_matriculas (
id_matricula,
fecha_registrada
) VALUES
	(1, '2015-06-12'),
	(2, '2016-09-01'),
	(3, '2012-10-21'),
	(4, '2014-04-28'),
	(5, '2019-11-07');







INSERT INTO centro_medico.tratamientos (
id_medico,
id_paciente,
descripcion,
fecha_inicio,
fecha_fin
) VALUES
	(1, 7, 'Paciente con ataques de panico a causa de perdida familiar.', '2022-08-28', NULL),
	(2, 4, 'Paciente con problemas de aprendizaje, presenta distracciones y dificultad de atencion.', '2022-07-30', NULL),
	(3, 1, 'Paciente con depresion diagnosticada, tratamiento en proceso mediante medicacion.', '2022-06-02', NULL),
	(3, 2, 'Paciente con Epilepsia diagnosticada, tratamiento en proceso mediante medicacion.', '2023-09-26', NULL),
	(5, 3, 'Paciente con dificultad psicomotriz, acompañamiento escolar permanente', '2024-01-05', NULL),
	(2, 5, 'Paciente con dificultades de aprendizaje, presenta dificultad de memorizacion a corto plazo. ¡Diagnosticar!', '2023-11-19', NULL),
	(4, 8, 'Paciente presenta sospechas de retraso en el lenguaje, ¡Diagnosticar!.', '2021-10-30', NULL),
	(1, 6, 'Paciente presenta intenciones de autoflagelo con posibilidades de suicidio. ¡Es prioridad tratamiento en conjunto con el area de psiquiatria', '2023-02-25', NULL);
	




INSERT INTO centro_medico.centro_medico_lorena (
cantidad_duenos,
cantidad_empleados,
cantidad_pacientes,
cantidad_tratamientos,
cantidad_medicos,
direccion,
telefono,
email
) VALUES
	((SELECT COUNT(centro_medico.duenos.id_dueno) FROM centro_medico.duenos), 
	(SELECT COUNT(centro_medico.empleados.id_empleado) FROM centro_medico.empleados), 
	(SELECT COUNT(centro_medico.pacientes.id_paciente) FROM centro_medico.pacientes), 
	(SELECT COUNT(centro_medico.tratamientos.id_tratamiento) FROM centro_medico.tratamientos), 
	(SELECT COUNT(centro_medico.medicos.id_medico) FROM centro_medico.medicos), 
	'Av. Cordoba 1545',
	02204588525,
	'centro_medico_lorena@gmail.com'
	);





INSERT INTO centro_medico.factura_medico (
id_medico,
id_tratamiento,
horas_trabajadas,
monto,
mes_facturado
) VALUES 
	(1, 1, 6, 60000.10, '2024-06-28'),
	(1, 8, 6, 60000.10, '2024-06-28'),
	(2, 2, 6, 90000.15, '2024-06-28'),
	(2, 6, 6, 90000.15, '2024-06-28'),
	(3, 3, 1, 20000.19, '2024-06-28'),
	(3, 4, 1, 20000.19, '2024-06-28'),
	(4, 7, 4, 55050.99, '2024-06-28'),
	(5, 5, 80, 250580.88, '2021-06-28');






INSERT INTO centro_medico.factura_paciente (
id_tratamiento,
id_paciente,
cuota,
mes_facutado
) VALUES
	(3, 1, 20000.18, '2024-06-28'),
	(4, 2, 20000.19, '2024-06-28'),
	(5, 3, 250580.88, '2024-06-28'),
	(2, 4, 90000.15, '2024-06-28'),
	(6, 5, 90000.15, '2024-06-28'),
	(8, 6, 60000.19, '2024-06-28'),
	(1, 7, 60000.19, '2024-06-28'),
	(5, 8, 55050.99, '2024-06-28');