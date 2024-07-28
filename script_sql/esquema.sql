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



CREATE TABLE centros_medicos (
	id_centro_medico INT AUTO_INCREMENT NOT NULL,
	id_dueno INT NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	telefono BIGINT UNIQUE NOT NULL,
	ciudad VARCHAR(255) NOT NULL,
	provincia VARCHAR(255) NOT NULL,
	codigo_postal INT NOT NULL,
	sitio_web VARCHAR(255) UNIQUE NOT NULL,
	PRIMARY KEY (id_centro_medico)
) COMMENT "Tabla que relaciona todas las entidades que pueden trabajar en un centro medico, hay 3 centros medicos";




CREATE TABLE empleados (
	id_empleado INT AUTO_INCREMENT NOT NULL,
	id_centro_medico INT NOT NULL,
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
	id_centro_medico INT NOT NULL,
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
	id_centro_medico INT NOT NULL,
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
	id_centro_medico INT NOT NULL,
	id_medico INT NOT NULL,
	id_paciente INT NOT NULL,
	descripcion TEXT,
	fecha_inicio DATE,
	fecha_fin DATE NULL,
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



-- Constraints para la tabla "centros_medicos"
-- Constraints para la tabla "centros_medicos"
-- Constraints para la tabla "centros_medicos"
ALTER TABLE centro_medico.centros_medicos
	ADD CONSTRAINT fk_duenos_id_dueno FOREIGN KEY (id_dueno) REFERENCES duenos(id_dueno)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;




-- Constraints para la tabla "empleados"
-- Constraints para la tabla "empleados"
-- Constraints para la tabla "empleados"
ALTER TABLE centro_medico.empleados
	ADD CONSTRAINT fk_centros_medicos_empleado FOREIGN KEY (id_centro_medico) REFERENCES centro_medico.centros_medicos(id_centro_medico)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;




-- Constraints para la tabla "pacientes"
-- Constraints para la tabla "pacientes"
-- Constraints para la tabla "pacientes"
ALTER TABLE centro_medico.pacientes
	ADD CONSTRAINT fk_centros_medicos_pacientes FOREIGN KEY (id_centro_medico) REFERENCES centro_medico.centros_medicos(id_centro_medico)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;



-- Constraints para la tabla "medicos"
ALTER TABLE centro_medico.medicos
	ADD CONSTRAINT fk_centros_medicos_medicos FOREIGN KEY (id_centro_medico) REFERENCES centro_medico.centros_medicos(id_centro_medico)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;



-- Constraints para la tabla "empleados_puestos"
-- Constraints para la tabla "empleados_puestos"
-- Constraints para la tabla "empleados_puestos"
ALTER TABLE centro_medico.empleados_puestos
	ADD CONSTRAINT FK_id_empleado FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;

ALTER TABLE centro_medico.empleados_puestos
	ADD CONSTRAINT FK_id_puesto FOREIGN KEY (id_puesto) REFERENCES puestos(id_puesto)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;





-- Constraints para la tabla "obra_social_empleados"
-- Constraints para la tabla "obra_social_empleados"
-- Constraints para la tabla "obra_social_empleados"
ALTER TABLE centro_medico.obra_social_empleados
	ADD CONSTRAINT FK_id_empleado_obra_social FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;




-- Constraints para la tabla "honorario_facturas"
-- Constraints para la tabla "honorario_facturas"
-- Constraints para la tabla "honorario_facturas"
ALTER TABLE centro_medico.honorario_facturas
	ADD CONSTRAINT FK_honorario_facturas_id_empleado FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;




-- Constraints para la tabla "obra_social_pacientes"
-- Constraints para la tabla "obra_social_pacientes"
-- Constraints para la tabla "obra_social_pacientes"
ALTER TABLE centro_medico.obra_social_pacientes
	ADD CONSTRAINT FK_id_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;



-- Constraints para la tabla "profesion_medicos"
-- Constraints para la tabla "profesion_medicos"
-- Constraints para la tabla "profesion_medicos"
ALTER TABLE centro_medico.profesion_medicos
	ADD CONSTRAINT FK_id_profesion FOREIGN KEY (id_profesion) REFERENCES profesiones(id_profesion)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;
	
ALTER TABLE centro_medico.profesion_medicos
	ADD CONSTRAINT FK_id_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;



-- Constraint para la tabla "matriculas"
-- Constraint para la tabla "matriculas"
-- Constraint para la tabla "matriculas"
ALTER TABLE centro_medico.matriculas
	ADD CONSTRAINT FK_MATRICULAS_id_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;



-- Constraint para la tabla "RUP_registro_matriculas"
-- Constraint para la tabla "RUP_registro_matriculas"
-- Constraint para la tabla "RUP_registro_matriculas"
ALTER TABLE centro_medico.RUP_registro_matriculas 
	ADD CONSTRAINT FK_id_matricula FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;




-- Constraints para la tabla "tratamientos"
-- Constraints para la tabla "tratamientos"
-- Constraints para la tabla "tratamientos"
ALTER TABLE centro_medico.tratamientos
	ADD CONSTRAINT FK_tratamientos_id_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;
	
ALTER TABLE centro_medico.tratamientos
	ADD CONSTRAINT FK_tratamientos_id_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;

ALTER TABLE centro_medico.tratamientos
	ADD CONSTRAINT fk_centros_medicos_tratamientos FOREIGN KEY (id_centro_medico) REFERENCES centro_medico.centros_medicos(id_centro_medico)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;
	



-- Constraints para la tabla "factura_paciente"
-- Constraints para la tabla "factura_paciente"
-- Constraints para la tabla "factura_paciente"
ALTER TABLE centro_medico.factura_paciente
	ADD CONSTRAINT FK_facutra_paciente_id_tratamiento FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;
	
ALTER TABLE centro_medico.factura_paciente
	ADD CONSTRAINT FK_factura_paciente_id_paciente FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;
	



-- Constraints de la tabla "factura_medico"
-- Constraints de la tabla "factura_medico"
-- Constraints de la tabla "factura_medico"
ALTER TABLE centro_medico.factura_medico
	ADD CONSTRAINT FK_factura_medico_id_medico FOREIGN KEY (id_medico) REFERENCES medicos(id_medico)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;

ALTER TABLE centro_medico.factura_medico
	ADD CONSTRAINT FK_factura_medico_id_tratamiento FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento)
	ON UPDATE CASCADE
    ON DELETE CASCADE
	;



SHOW WARNINGS;