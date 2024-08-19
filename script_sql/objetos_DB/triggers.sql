USE centro_medico;







-- Este trigger se encarga de registrar una nueva matricula ingresada en la tabla RUP que corresponde a un registro unico de matriculas.
-- Este trigger se encarga de registrar una nueva matricula ingresada en la tabla RUP que corresponde a un registro unico de matriculas.
-- Este trigger se encarga de registrar una nueva matricula ingresada en la tabla RUP que corresponde a un registro unico de matriculas.
DROP TRIGGER IF EXISTS centro_medico.insertar_RUP_matricula;
DELIMITER //

CREATE TRIGGER centro_medico.insertar_RUP_matricula
	AFTER INSERT ON centro_medico.matriculas
	FOR EACH ROW 
	BEGIN 
		
		DECLARE check_id_matricula INT;
	
		SELECT srm.id_matricula INTO check_id_matricula
		FROM centro_medico.RUP_registro_matriculas AS srm
		WHERE srm.id_matricula = NEW.id_matricula;
	
	
		IF check_id_matricula IS NULL THEN
			INSERT INTO centro_medico.RUP_registro_matriculas 
				( id_matricula, fecha_registrada )
			VALUES 
				(NEW.id_matricula , DATE(CURRENT_DATE));
			
		END IF;
	
	END //
DELIMITER ;









-- Trigger para manejar el cambio de esatdo en la tabla pacientes y la tabla medicos.
-- Trigger para manejar el cambio de esatdo en la tabla pacientes y la tabla medicos.
DROP TRIGGER IF EXISTS centro_medico.alta_tratamiento_controller;
DELIMITER //

CREATE TRIGGER centro_medico.alta_tratamiento_controller
	AFTER INSERT ON centro_medico.tratamientos
	FOR EACH ROW
	BEGIN 
		
		DECLARE check_id_medico INT;
		DECLARE check_id_paciente INT;
	
	
		-- Checkear si el id_medico existe.
		SELECT m.id_medico INTO check_id_medico
		FROM centro_medico.medicos AS m
		WHERE m.id_medico = NEW.id_medico;
		
		
		-- Checkear si el id_paciente existe.
		SELECT p.id_paciente INTO check_id_paciente
		FROM centro_medico.pacientes AS p
		WHERE p.id_paciente = NEW.id_paciente;
	
		IF check_id_medico IS NULL AND check_id_paciente IS NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Actualizacion de estado cancelada.';
		ELSE 
			UPDATE centro_medico.medicos 
			SET estado = 1 
			WHERE id_medico = check_id_medico;
		
			UPDATE centro_medico.pacientes 
			SET estado = 1
			WHERE id_paciente = check_id_paciente;
		
		END IF;
		
	END //
DELIMITER ;















-- Triggers de Auditoria!
-- Triggers de Auditoria!
-- Triggers de Auditoria!


-- Este trigger inserta datos relevantes cuando se registra un paciente en la tabla "alta_paciente_control"
-- Este trigger inserta datos relevantes cuando se registra un paciente en la tabla "alta_paciente_control"
-- Este trigger inserta datos relevantes cuando se registra un paciente en la tabla "alta_paciente_control"
DROP TRIGGER IF EXISTS centro_medico.alta_paciente_controller;
DELIMITER //

CREATE TRIGGER centro_medico.alta_paciente_controller
	AFTER INSERT ON centro_medico.pacientes 
	FOR EACH ROW 
	BEGIN 
		
		DECLARE full_name VARCHAR(255);
	
		SET full_name = CONCAT(NEW.nombre_paciente, ' ', NEW.apellido);
		
		INSERT INTO centro_medico.alta_paciente_control
			(id_paciente, nombres, fecha_alta, usuario)
		VALUES
			(NEW.id_paciente, full_name, NEW.fecha_alta, USER());
		
	END //
DELIMITER ;
	






-- Este trigger controla la obra social de los pacientes en la tabla auditora, si el nuevo registro en "obra_social_pacientes" se encuentra
--  en la tabla auditora esta actualiza el campo obra_social del mismo id correspondiente.


DROP TRIGGER IF EXISTS centro_medico.alta_paciente_controller_OS;
DELIMITER //

CREATE TRIGGER centro_medico.alta_paciente_controller_OS
	AFTER INSERT ON centro_medico.obra_social_pacientes 
	FOR EACH ROW 
	BEGIN 
		
		DECLARE check_obra_social VARCHAR(255);

		SET check_obra_social = UPPER(check_obra_social);
	
		SELECT osp.nombre_obra_social_paciente INTO check_obra_social
		FROM centro_medico.obra_social_pacientes AS osp
		WHERE osp.id_paciente = NEW.id_paciente;
	
		
		UPDATE centro_medico.alta_paciente_control 
		SET obra_social = check_obra_social
		WHERE id_paciente = NEW.id_paciente;

		
	END //
DELIMITER ;






-- Este trigger inserta los datos relevantes del registro creado , medico, y lo inserta en la tabla auditora de medicos "alta_medico_control" 
-- Este trigger inserta los datos relevantes del registro creado , medico, y lo inserta en la tabla auditora de medicos "alta_medico_control" 
-- Este trigger inserta los datos relevantes del registro creado , medico, y lo inserta en la tabla auditora de medicos "alta_medico_control" 
DROP TRIGGER IF EXISTS centro_medico.alta_medico_controller;
DELIMITER //

CREATE TRIGGER centro_medico.alta_medico_controller
	AFTER INSERT ON centro_medico.medicos
	FOR EACH ROW 
	BEGIN 
		
		DECLARE full_name VARCHAR(255);
	
		SET full_name = CONCAT(NEW.nombre_medico, ' ', NEW.apellido_medico);
	
		INSERT INTO centro_medico.alta_medico_control
			(id_medico, full_name, cuit, email, fecha_alta)
		VALUES
			(NEW.id_medico, full_name, NEW.cuit, NEW.email, NEW.fecha_alta);
		
	END //
DELIMITER ;
	










-- Este trigger se encarga de vincular la matricula del medico recien creado o matricula insertada, y lo registra 
--  en la tabla auditoria de medicos "alta_medico_control"

DROP TRIGGER IF EXISTS centro_medico.alta_medico_controller_matricula;
DELIMITER //

CREATE TRIGGER centro_medico.alta_medico_controller_matricula
	AFTER INSERT ON centro_medico.matriculas
	FOR EACH ROW 
	BEGIN 
		
		DECLARE check_id_medico INT;
	
		-- Checkeando el id_medico de la matricula.
		SELECT m.id_medico INTO check_id_medico
		FROM centro_medico.medicos AS m
		WHERE m.id_medico = NEW.id_medico;
	
		IF check_id_medico IS NOT NULL THEN
			UPDATE centro_medico.alta_medico_control
			SET num_matricula = NEW.numero_matricula
			WHERE id_medico = check_id_medico;
		END IF;
		
	END //
DELIMITER ;
	
	





-- Este trigger se encarga de vincular la profesion a la tabla auditoria de medicos "alta_medico_control"
DROP TRIGGER IF EXISTS centro_medico.alta_medico_controller_profesion;
DELIMITER //

CREATE TRIGGER centro_medico.alta_medico_controller_profesion
	AFTER INSERT ON centro_medico.profesion_medicos
	FOR EACH ROW 
	BEGIN 	
		
		DECLARE check_profesion VARCHAR(255);
		
		SELECT prof.nombre_profesion INTO check_profesion
		FROM centro_medico.medicos AS m
		JOIN centro_medico.profesion_medicos AS pm
			USING(id_medico)
		JOIN centro_medico.profesiones AS prof
			USING(id_profesion)
		WHERE m.id_medico = NEW.id_medico;
	
		IF check_profesion IS NOT NULL THEN
			UPDATE centro_medico.alta_medico_control
			SET profesion =  check_profesion
			WHERE id_medico = NEW.id_medico;
		END IF;
		
	END //
DELIMITER ;