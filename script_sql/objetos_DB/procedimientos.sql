USE centro_medico;

EXPLAIN centro_medico.pacientes;



-- AREA PROFESIONAL -- AREA PROFESIONAL -- AREA PROFESIONAL -- AREA PROFESIONAL -- AREA PROFESIONAL -- AREA PROFESIONAL -- AREA PROFESIONAL 
-- AREA PROFESIONAL -- AREA PROFESIONAL-- AREA PROFESIONAL-- AREA PROFESIONAL-- AREA PROFESIONAL-- AREA PROFESIONAL-- AREA PROFESIONAL













-- Procedimiento que se encarga de insertar un nuevo tratamiento. Se involucra las tablas " medico, pacientes, tratamientos"
-- Procedimiento que se encarga de insertar un nuevo tratamiento. Se involucra las tablas " medico, pacientes, tratamientos"

DROP PROCEDURE IF EXISTS centro_medico.alta_tratamiento;
DELIMITER //

CREATE PROCEDURE centro_medico.alta_tratamiento
(
	IN id_centro INT,
	IN medico_id INT,
	IN paciente_id INT,
	IN detalle TEXT,
	IN fecha_de_inicio DATE,
	IN fecha_de_fin DATE
)
BEGIN
	
	INSERT INTO centro_medico.tratamientos 
		(id_centro_medico, id_medico, id_paciente, descripcion, fecha_inicio, fecha_fin)
	VALUES
		(id_centro, medico_id, paciente_id, detalle, fecha_de_inicio, fecha_de_fin);
	
END //
DELIMITER ;



	-- " Usando el procedimiento alta_tratamiento "
	-- " Usando el procedimiento alta_tratamiento "
-- CALL centro_medico.alta_tratamiento(3, 1, 1, 'Esto es una descripcion para el tratamiento. ', '2024-07-29', NULL );








SHOW WARNINGS;







-- Procedimiento que registra la facturacion mensual de medicos
-- Procedimiento que registra la facturacion mensual de medicos
DROP PROCEDURE IF EXISTS centro_medico.generar_factura_medico;
DELIMITER //

CREATE PROCEDURE centro_medico.generar_factura_medico
(
	IN medico_id INT,
	IN tratamiento_id INT,
	IN horas_trabajados INT,
	IN monto_pagado DECIMAL(10,2),
	IN mes_facturaDo DATE
)
BEGIN
	
	DECLARE check_id_medico INT;
	DECLARE check_id_tratamiento INT;

	-- Checkeando si existe el id_medico:
	SELECT m.id_medico INTO check_id_medico
	FROM centro_medico.medicos AS m
	WHERE m.id_medico = medico_id;

	-- Chekeando si existe el id_tratamiento:
	SELECT st.id_tratamiento INTO check_id_tratamiento
	FROM centro_medico.tratamientos AS st
	WHERE st.id_tratamiento = tratamiento_id;


	IF check_id_tratamiento IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontro un tratamiento con ese identificador';
	ELSEIF check_id_medico IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El identificador del medico no existe.';
	ELSE 
		INSERT INTO centro_medico.factura_medico 
			(id_medico, id_tratamiento, horas_trabajadas, monto, mes_facturado)
		VALUES
			(check_id_medico, check_id_tratamiento, horas_trabajados, monto_pagado, mes_facturado);
	END IF;

END //
DELIMITER ;


	-- " Usando el procedimiento ' generar factura medico': "
	-- " Usando el procedimiento ' generar factura medico': "
-- CALL centro_medico.generar_factura_medico( 1, 1, 64, 360000.00, '2024-07-30');







SHOW WARNINGS;







-- Procedimiento que crea un nuevo registro en la tabla "factura_paciente, vinculando el id del medico y id_tratamiento"
-- Procedimiento que crea un nuevo registro en la tabla "factura_paciente, vinculando el id del medico y id_tratamiento"
-- Procedimiento que crea un nuevo registro en la tabla "factura_paciente, vinculando el id del medico y id_tratamiento"
DROP PROCEDURE IF EXISTS centro_medico.generar_factura_paciente;
DELIMITER //

CREATE PROCEDURE centro_medico.generar_factura_paciente
(
	IN tratamiento_id INT,
	IN paciente_id INT,
	IN cuota_mensual DECIMAL(10,2),
	IN factura_mes DATE
)
BEGIN
	
	DECLARE check_id_paciente INT;
	DECLARE check_id_tratamiento INT;
	DECLARE check_obra_social VARCHAR(255);
	DECLARE precio_final DECIMAL(12,2);

	-- Checkeando si existe el id_paciente
	SELECT p.id_paciente INTO check_id_paciente
	FROM centro_medico.pacientes AS p
	WHERE p.id_paciente = paciente_id;
	
	-- Checkeando si existe el id del tratamiento
	SELECT trat.id_tratamiento INTO check_id_tratamiento
	FROM centro_medico.tratamientos AS trat
	WHERE trat.id_tratamiento = tratamiento_id;

	-- Checkeando si tiene obra social
	SELECT osp.nombre_obra_social_paciente INTO check_obra_social
	FROM centro_medico.obra_social_pacientes AS osp
	WHERE osp.id_paciente = check_id_paciente;

	SET precio_final = CASE
							WHEN check_obra_social IS NULL THEN cuota_mensual
							ELSE 
								DISCOUNT_OS(cuota_mensual, check_obra_social)
						END;
	
	IF check_id_paciente IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No pudo encontrarse el registro del paciente';
	ELSEIF check_id_tratamiento IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo encontrar el registro del tratamiento';
	ELSE
		INSERT INTO centro_medico.factura_paciente
			(id_tratamiento, id_paciente, cuota, mes_facutado)
		VALUES
			(check_id_tratamiento, check_id_paciente, precio_final, factura_mes);
		
		IF precio_final = cuota_mensual THEN 
				INSERT INTO centro_medico.auditoria_trigger
					(mensaje)
				VALUES
					(CONCAT('No se aplico un descuenot a la factura del paciente con el id: ', paciente_id, ' Cuota: ', precio_final));
		ELSE
			INSERT INTO centro_medico.auditoria_trigger
				(mensaje)
			VALUES
				(CONCAT('Se aplico el descuento paciente con el id: ', paciente_id, ' Cuota: ', precio_final, ', con la obra social ', check_obra_social));
		END IF;
		SELECT *
		FROM centro_medico.factura_paciente AS fp
		WHERE fp.id_paciente = check_id_paciente;
	END IF;


END //
DELIMITER ;


	-- "Usando procedimiento 'generar_factura_paciente"
	-- "Usando procedimiento 'generar_factura_paciente"
-- CALL centro_medico.generar_factura_paciente( 1, 1 , 380000.00, '2024-07-30');







SHOW WARNINGS;












-- Este procedimiento finaliza el tratamiento y actualiza el estado del medico y paciente asociado.
-- Este procedimiento finaliza el tratamiento y actualiza el estado del medico y paciente asociado.

DROP PROCEDURE IF EXISTS centro_medico.terminar_tratamiento;
DELIMITER //

CREATE PROCEDURE centro_medico.terminar_tratamiento
(
	IN id_medico INT,
	IN id_paciente INT
)
BEGIN
	DECLARE check_id_tratamiento INT;
	DECLARE check_id_paciente INT;
	DECLARE check_id_medico INT;

	-- Checkeando si existe el paciente en la tabla tratamientos.
	SELECT st.id_medico INTO check_id_medico
	FROM centro_medico.tratamientos AS st
	WHERE st.id_medico = id_medico;

	-- Checkeando si existe el paciente en la tabla tratamientos.
	SELECT st.id_paciente INTO check_id_paciente
	FROM centro_medico.tratamientos AS st
	WHERE st.id_paciente = id_paciente;

	IF check_id_paciente IS NULL OR check_id_medico IS NULL THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo finalizar el tratamiento.';
	ELSE
		UPDATE centro_medico.medicos 
		SET estado = 0
		WHERE id_medico = check_id_medico;
	
		UPDATE centro_medico.pacientes 
		SET estado = 0
		WHERE id_paciente = check_id_paciente;
		
		SELECT 'Tratamiento finalizado' AS mensaje;
	END IF;
	
END //
DELIMITER ;


-- CALL centro_medico.terminar_tratamiento(1,1);




SHOW WARNINGS;





-- Este procedimiento se encargara de registrar un nuevo paciente 
--  controlando la integridad de datos del campo UNIQUE
DROP PROCEDURE IF EXISTS centro_medico.alta_paciente;
DELIMITER //

CREATE PROCEDURE centro_medico.alta_paciente 
(
	IN id_c_medico INT, 
	IN nombre VARCHAR(255), 
	IN apellido_paciente VARCHAR(255),
	IN documento BIGINT,
	IN alta DATE,
	IN status BOOLEAN,
	IN nombre_obra_social VARCHAR(255),
	IN numero_carnet BIGINT
)
BEGIN 
	
	DECLARE check_exists BIGINT;
	DECLARE valor_OS VARCHAR(255);

	SET valor_OS = CASE 
						WHEN nombre_obra_social = '' THEN 0
						ELSE 1
				   END;
	
	SELECT 
		sp.dni INTO check_exists
    FROM centro_medico.pacientes AS sp
    WHERE sp.dni = documento; 

	IF check_exists IS NOT NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EL DNI YA SE ENCUENTRA REGISTRADO';
	ELSE 
		INSERT INTO centro_medico.pacientes 
		(id_centro_medico, nombre_paciente, apellido, dni, fecha_alta, estado, tiene_obra_social)
		VALUES 
			(id_c_medico, nombre, apellido_paciente, documento, alta, status, valor_OS);
		
		IF nombre_obra_social != '' AND numero_carnet != 0 THEN 
			INSERT INTO centro_medico.obra_social_pacientes 
				(id_paciente, nombre_obra_social_paciente, carnet_numero)
			VALUES
				(LAST_INSERT_ID(), nombre_obra_social, numero_carnet);
			
		END IF;
		
	END IF;


	SELECT 'Paciente creado con exito' AS mensaje;

END //
DELIMITER ;



	-- Utilizando el procedimiento almacenado "alta_paciente"
	-- Utilizando el procedimiento almacenado "alta_paciente"
--  CALL centro_medico.alta_paciente (3, 'Eric', 'Buenafortuna', 30123458, '2024-07-28', 0, 'OSDE', 7525651);
-- CALL centro_medico.alta_paciente (1, 'Julia', 'Gomez', 30123777, '2024-07-28', 0, '', 0);

-- CALL centro_medico.alta_paciente (3, 'Rosalia', 'Verdebuena', 30551597, '2024-07-28', 0, 'VITAL', 745159);








SHOW WARNINGS;








-- Procedimiento que se encarga de registrar un medico y relacionarlo con una profesion del centro_medico. Tambien crea una nueva matricula si es que no existe
-- Procedimiento que se encarga de registrar un medico y relacionarlo con una profesion del centro_medico. Tambien crea una nueva matricula si es que no existe
-- Procedimiento que se encarga de registrar un medico y relacionarlo con una profesion del centro_medico. Tambien crea una nueva matricula si es que no existe

DROP PROCEDURE IF EXISTS centro_medico.alta_medico;
DELIMITER //

CREATE PROCEDURE centro_medico.alta_medico
(
	IN id_cm INT,
	IN nombre VARCHAR(255),
	IN apellido VARCHAR(255),
	IN cuit_input BIGINT,
	IN correo VARCHAR(255),
	IN status BOOLEAN,
	IN alta_fecha DATE,
	IN profesion VARCHAR(255),
	IN num_matricula BIGINT

)
BEGIN

	DECLARE check_cuit BIGINT;
	DECLARE check_profesion VARCHAR(255);
	DECLARE check_id_profesion INT;
	DECLARE check_num_matricula BIGINT;

	SET check_profesion = LOWER(profesion);

	-- Checkea que no exista el cuit en la base de datos y la inserta en la variable " check_cuit"
	SELECT sm.cuit INTO check_cuit
	FROM centro_medico.medicos AS sm
	WHERE sm.cuit = cuit_input;

	-- Checkea si la profesion se encuentra en la base de datos y la inserta en la variable "check_profesion"
	SELECT sp.nombre_profesion INTO check_profesion
	FROM centro_medico.profesiones AS sp
	WHERE sp.nombre_profesion = check_profesion;

	-- Checkea si la profesion se encuentra en la base de datos y la inserta en la variable "check_profesion"
	SELECT sp.id_profesion INTO check_id_profesion
	FROM centro_medico.profesiones AS sp
	WHERE sp.nombre_profesion = profesion;

	-- Checkea si la matricula se encuentra en la base de datos y la inserta en la variable " check_num_matricula"
	SELECT mat.numero_matricula INTO check_num_matricula 
	FROM centro_medico.matriculas AS mat
	WHERE mat.numero_matricula = num_matricula;
	

	IF check_cuit IS NOT NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cuit ingresado pertenece a un medico registrado. Compruebe los datos.';
	ELSEIF check_profesion IS NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Profesion no registrada en la base de datos.';
	ELSEIF check_id_profesion IS NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al intentar encontrar la profesion.';
	ELSEIF check_num_matricula IS NOT NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La matricula ingresada pertenece a un registro existente.';
	ELSE
		-- Creando un nuevo registro en la tabla medicos
		INSERT INTO centro_medico.medicos 
			(id_centro_medico, nombre_medico, apellido_medico, cuit, email, estado, fecha_alta)
		VALUES
			(id_cm, nombre, apellido, cuit_input, correo, status, alta_fecha);
		
		-- Creando un nuevo registro asociando al medico creado a la tabla profesiones mediante la tabla intermedia
		INSERT INTO centro_medico.profesion_medicos 
			(id_profesion, id_medico)
		VALUES 
			(check_id_profesion, LAST_INSERT_ID());
		
		-- Creando un nuevo registro en matriculas usando el id recien insertado, 
		INSERT INTO centro_medico.matriculas 
			(id_medico, numero_matricula)
		VALUES
			(LAST_INSERT_ID(), num_matricula);
		
		
	END IF;


	SELECT 'Medico creado con exito' AS mensaje;
END //
DELIMITER ;



-- "Usando el procedimiento 'alta_medico' : "
-- "Usando el procedimiento 'alta_medico' : "
-- CALL centro_medico.alta_medico( 2, 'Gonzalo', 'Huamabinga', 25141547845, 'gonzalohuamabinga@gmail.com', 0, DATE(CURRENT_DATE), 'logopeda', 45450450);
-- CALL centro_medico.alta_medico( 3, 'Julieta', 'Ruiz', 25141547444, 'JulietaRuiz@gmail.com', 0, DATE(CURRENT_DATE), 'Psicologia', 44785450);




SHOW WARNINGS;