USE centro_medico;



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
	DECLARE check_id_tratamiento_paciente INT;
	DECLARE check_obra_social VARCHAR(255);
	DECLARE precio_final DECIMAL(12,2);
	DECLARE error_message VARCHAR(255);


	-- Bloque de excepciones
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- Manejo de excepcion
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
	END;

	START TRANSACTION;	

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

	SELECT t.id_paciente INTO check_id_tratamiento_paciente
	FROM centro_medico.tratamientos AS t
	WHERE t.id_tratamiento = check_id_tratamiento
	ORDER BY t.id_paciente DESC
	LIMIT 1;
	

	SET precio_final = CASE
							WHEN check_obra_social IS NULL THEN cuota_mensual
							ELSE 
								DISCOUNT_OS(cuota_mensual, check_obra_social)
						END;
	
	IF check_id_paciente IS NULL THEN
		SET error_message = 'No pudo encontrarse el registro del paciente';
		SIGNAL SQLSTATE '45000';
	ELSEIF check_id_tratamiento IS NULL THEN
		SET error_message = 'No se pudo encontrar el registro del tratamiento';
		SIGNAL SQLSTATE '45000';
	ELSEIF check_id_paciente != check_id_tratamiento_paciente THEN
		SET error_message = 'El id del paciente no corresponde al tratamiento indicado';
		SIGNAL SQLSTATE '45000';
	ELSE
		INSERT INTO centro_medico.factura_paciente
			(id_tratamiento, id_paciente, cuota, mes_facturado)
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
	
		COMMIT;	
	
		SELECT *
		FROM centro_medico.factura_paciente AS fp
		WHERE fp.id_paciente = check_id_paciente
		ORDER BY fp.id_factura_paciente DESC
		LIMIT 1;
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
	DECLARE error_message VARCHAR(255);

	-- Bloque de excepciones
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- Manejo de excepcion
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
	END;


	START TRANSACTION;

	-- Checkeando si existe el paciente en la tabla tratamientos.
	SELECT st.id_medico INTO check_id_medico
	FROM centro_medico.tratamientos AS st
	WHERE st.id_medico = id_medico
	ORDER BY st.id_tratamiento
	LIMIT 1;

	-- Checkeando si existe el paciente en la tabla tratamientos.
	SELECT st.id_paciente INTO check_id_paciente
	FROM centro_medico.tratamientos AS st
	WHERE st.id_paciente = id_paciente
	ORDER BY st.id_tratamiento
	LIMIT 1;


	-- Checkeando si existe el tratamiento en la tabla
	SELECT st.id_tratamiento INTO check_id_tratamiento
	FROM centro_medico.tratamientos AS st
	WHERE st.id_paciente = check_id_paciente
	AND st.id_medico = check_id_medico
	ORDER BY st.id_tratamiento DESC
	LIMIT 1;

	IF check_id_paciente IS NULL OR check_id_medico IS NULL THEN
		SET error_message = 'NO SE PUDO FINALIZAR EL TRATAMIENTO. PACIENTE O MEDICO NO ENCONTRADO';
		SIGNAL SQLSTATE '45000';
	ELSE
		UPDATE centro_medico.medicos 
		SET estado = 0
		WHERE id_medico = check_id_medico;
	
		UPDATE centro_medico.pacientes 
		SET estado = 0
		WHERE id_paciente = check_id_paciente;

		IF check_id_tratamiento IS NULL THEN
			SET error_message = 'TRATAMIENTO NO ENCONTRADO';
			SIGNAL SQLSTATE '45000';
		ELSE
			UPDATE centro_medico.tratamientos
			SET fecha_fin = CURRENT_DATE
			WHERE id_tratamiento = check_id_tratamiento;
		END IF;

		COMMIT;
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
	
	-- Checkeando que no exista el paciente
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
				(LAST_INSERT_ID(), UPPER(nombre_obra_social), numero_carnet);
			
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
	DECLARE error_message VARCHAR(255);
	DECLARE last_id INT;

	-- Bloque de excepciones
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- Manejo de excepcion
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
	END;

	START TRANSACTION;

	SET check_profesion = LOWER(profesion);

	-- Checkea que no exista el cuit en la base de datos y la inserta en la variable " check_cuit"
	SELECT sm.cuit INTO check_cuit
	FROM centro_medico.medicos AS sm
	WHERE sm.cuit = cuit_input;

	SET error_message = 'llego cuit';

	-- Checkea si la profesion se encuentra en la base de datos y la inserta en la variable "check_profesion"
	SELECT sp.nombre_profesion INTO check_profesion
	FROM centro_medico.profesiones AS sp
	WHERE sp.nombre_profesion = check_profesion;

	SET error_message = 'llego profesion';

	-- Checkea si la profesion se encuentra en la base de datos y la inserta en la variable "check_profesion"
	SELECT sp.id_profesion INTO check_id_profesion
	FROM centro_medico.profesiones AS sp
	WHERE sp.nombre_profesion = profesion;

	SET error_message = 'llego profesion';

	-- Checkea si la matricula se encuentra en la base de datos y la inserta en la variable " check_num_matricula"
	SELECT mat.numero_matricula INTO check_num_matricula 
	FROM centro_medico.matriculas AS mat
	WHERE mat.numero_matricula = num_matricula;

	SET error_message = 'llego matricula';
	

	IF check_cuit IS NOT NULL THEN
			SET error_message = 'El cuit ingresado pertenece a un medico registrado. Compruebe los datos.';
			SIGNAL SQLSTATE '45000';
	ELSEIF check_profesion IS NULL THEN
			SET error_message = 'Profesion no registrada en la base de datos.';
			SIGNAL SQLSTATE '45000';
	ELSEIF check_id_profesion IS NULL THEN
			SET error_message = 'Error al intentar encontrar la profesion.';
			SIGNAL SQLSTATE '45000';
	ELSEIF check_num_matricula IS NOT NULL THEN
			SET error_message = 'La matricula ingresada pertenece a un registro existente.';
			SIGNAL SQLSTATE '45000';
	ELSE
		-- Creando un nuevo registro en la tabla medicos
		INSERT INTO centro_medico.medicos 
			(id_centro_medico, nombre_medico, apellido_medico, cuit, email, estado, fecha_alta)
		VALUES
			(id_cm, nombre, apellido, cuit_input, correo, status, alta_fecha);
		
		SET error_message = 'paso 1ra insercion';
		SET last_id = LAST_INSERT_ID();
		
		
	
	
		-- Creando un nuevo registro asociando al medico creado a la tabla profesiones mediante la tabla intermedia
		INSERT INTO centro_medico.profesion_medicos 
			(id_profesion, id_medico)
		VALUES 
			(check_id_profesion, last_id);
		
		SET error_message = 'paso 2da insercion';
		
		-- Creando un nuevo registro en matriculas usando el id recien insertado, 
		INSERT INTO centro_medico.matriculas 
			(id_medico, numero_matricula)
		VALUES
			(last_id, num_matricula);
		
		SET error_message = 'llego al final';
	END IF;

	COMMIT;

	SELECT 'Medico creado con exito' AS mensaje;
END //
DELIMITER ;



-- "Usando el procedimiento 'alta_medico' : "
-- "Usando el procedimiento 'alta_medico' : "
-- CALL centro_medico.alta_medico( 2, 'Gonzalo', 'Huamabinga', 25141547845, 'gonzalohuamabinga@gmail.com', 0, DATE(CURRENT_DATE), 'logopeda', 45450450);
-- CALL centro_medico.alta_medico( 3, 'Julieta', 'Ruiz', 25141547444, 'JulietaRuiz@gmail.com', 0, DATE(CURRENT_DATE), 'Psicologia', 44785450);







-- AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA
-- AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA
-- AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA
-- AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA - AREA OPERATIVA












-- Procedimiento para dar de alta a un empleado
-- Procedimiento para dar de alta a un empleado
-- CHECKEAR SI FUNCIONA - CHECKEAR SI FUNCIONA - CHECKEAR SI FUNCIONA
-- CHECKEAR SI FUNCIONA - CHECKEAR SI FUNCIONA - CHECKEAR SI FUNCIONA
-- CHECKEAR SI FUNCIONA - CHECKEAR SI FUNCIONA - CHECKEAR SI FUNCIONA

DROP PROCEDURE IF EXISTS centro_medico.alta_empleado;
DELIMITER //

CREATE PROCEDURE centro_medico.alta_empleado
(
	IN centro_medico_id INT,
	IN empleado_nombre VARCHAR(255),
	IN empleado_apellido VARCHAR(255),
	IN empleado_dni BIGINT,
	IN empleado_domicilio VARCHAR(255),
	IN empleado_telefono BIGINT,
	IN empleado_fecha_alta DATE,
	IN empleado_puesto VARCHAR(255),
	IN obra_social VARCHAR(255),
	IN numero_carnet BIGINT,
	IN alta_obra_social DATE
)
BEGIN

	DECLARE error_message VARCHAR(255);
	DECLARE check_empleado_dni INT;
	DECLARE check_puesto VARCHAR(255);
	DECLARE check_id_puesto INT;
	DECLARE new_id_empleado INT;
	DECLARE check_obra_social INT;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		-- Manejo de excepcion
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
	END;

	START TRANSACTION;

	-- Checkeando el que dni del empleado no existe en la base de datos
	SELECT e.dni_empleado INTO check_empleado_dni
	FROM centro_medico.empleados AS e
	WHERE e.dni_empleado = empleado_dni;

	-- Checkeando que el puesto exista en la base de datos y capturando el id del puesto
	SELECT p.nombre_puesto, p.id_puesto INTO check_puesto, check_id_puesto
	FROM centro_medico.puestos AS p
	WHERE p.nombre_puesto = empleado_puesto;

	-- Checkeando si la obra social existe
	SET check_obra_social = CHECK_OS(obra_social);


	-- Validaciones para que en el caso que haya excepciones, caigan en el bloque de errores.
	IF check_empleado_dni IS NOT NULL THEN
		SET error_message = 'EL DNI INGRESADO CORRESPONSE A UN EMPLEADO EXISTENTE';
		SIGNAL SQLSTATE '45000';
	ELSEIF check_puesto IS NULL THEN
		SET error_message = 'NO SE ENCUENTRA EL PUESTO INDICADO';
		SIGNAL SQLSTATE '45000';
	ELSE

		-- Insertando registro en la tabla pacientes
		INSERT INTO centro_medico.empleados
			(id_centro_medico, nombre_empleado, apellido_empleado, dni_empleado, domicilio_empleado, telefono_empleado, fecha_alta)
		VALUES
			(centro_medico_id, empleado_nombre, empleado_apellido, empleado_dni, empleado_domicilio, empleado_telefono, empleado_fecha_alta);

		-- Guardando el id creado en la variable
		SET new_id_empleado = LAST_INSERT_ID();

		-- Insertando en la tabla intermedia
		INSERT INTO centro_medico.empleados_puestos
			(id_empleado, id_puesto)
		VALUES
			(new_id_empleado, check_id_puesto);

		-- Checkeando el resultaldo de la validacion de la obra social
		IF check_obra_social = 0 THEN
			SET error_message = 'OBRA SOCIAL NO PERMITIDA';
			SIGNAL SQLSTATE '45000';
		ELSE
			INSERT INTO centro_medico.obra_social_empleados
				(id_empleado, nombre_obra_social, carnet_numero, fecha_alta)
			VALUES
				(new_id_empleado, UPPER(obra_social), numero_carnet, empleado_fecha_alta);
		END IF;

		COMMIT;


		SELECT 'Empleado creado con exito' AS Mensaje;
	END IF;

END//
DELIMITER ;

-- -- Caso para que falle por obra social incorrecta
-- CALL centro_medico.alta_empleado(2, 'Hernan', 'Vera', 35456852, 'Av. Etcheverry 4574', 1150172832, '2024-11-25', 'mantenimiento', 'SWIISMEDICAL', 1474456, '2024-11-15');

-- -- Caso para que falle por puesto de trabajo incorrecto
-- CALL centro_medico.alta_empleado(2, 'Hernan', 'Vera', 35456852, 'Av. Etcheverry 4574', 1150172832, '2024-11-25', 'electricista', 'OSDE', 1474456, '2024-11-15');

-- -- Caso para que falle por dni existente
-- CALL centro_medico.alta_empleado(2, 'Hernan', 'Vera', 49513234, 'Av. Etcheverry 4574', 1150172832, '2024-11-25', 'mantenimiento', 'UOCRA', 1474456, '2024-11-15');

-- -- Caso de uso correcto
-- CALL centro_medico.alta_empleado(2, 'Hernan', 'Vera', 35456852, 'Av. Etcheverry 4574', 1150172832, '2024-11-25', 'mantenimiento', 'UOCRA', 1474456, '2024-11-15');








-- Procedimiento para crear facturaciones del area operativa ...
-- Procedimiento para crear facturaciones del area operativa ...
-- Procedimiento para crear facturaciones del area operativa ...

DROP PROCEDURE IF EXISTS centro_medico.nueva_factura_empleados;
DELIMITER //

CREATE PROCEDURE centro_medico.nueva_factura_empleados
(
	IN empleado_id INT,
	IN fecha_facturacion DATE
)
BEGIN

	DECLARE check_id_empleado INT;

	-- Checkeando el id del empleado
	SELECT e.id_empleado INTO check_id_empleado
	FROM centro_medico.empleados AS e
	WHERE e.id_empleado = empleado_id;

	IF check_id_empleado IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO SE ENCONTRO EL REGISTRO DEL EMPLEADO';
	ELSE
		INSERT INTO centro_medico.honorario_facturas
			(id_empleado, mes_facturado)
		VALUES
			(check_id_empleado, fecha_facturacion);
	END IF;

END //
DELIMITER ;

	--"Usando el procedimiento 'nueva_factura_empleados' : "
	--"Usando el procedimiento 'nueva_factura_empleados' : "
	
	--CALL centro_medico.nueva_factura_empleados(3, '2024-08-13');

SHOW WARNINGS;