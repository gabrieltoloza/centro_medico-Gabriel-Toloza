

	-- 	Este trigger se dispara cuando se ingresa una nueva matricula en la tabla "Matriculas", 
	--  utiliza el id de la insecion para vincularla a un registro unico que se creara en una tabla llamada RUP_registro_matriculas.
	--  Esto serviria para comprobar la veracidad de una matricula. 
DROP TRIGGER IF EXISTS centro_medico.insertar_RUP_matricula;
DELIMITER //

CREATE TRIGGER centro_medico.insertar_RUP_matricula
	AFTER INSERT ON centro_medico.stagging_matriculas
	FOR EACH ROW 
	BEGIN 
		
		DECLARE check_id_matricula INT;
	
		SELECT srm.id_matricula INTO check_id_matricula
		FROM centro_medico.stagging_RUP_registro_matriculas AS srm
		WHERE srm.id_matricula = NEW.id_matricula;
	
		IF check_id_matricula IS NULL THEN
			INSERT INTO centro_medico.stagging_RUP_registro_matriculas 
				( id_matricula, fecha_registrada )
			VALUES 
				(NEW.id_matricula , DATE(CURRENT_DATE));
			
		END IF;
	
	END //
DELIMITER ;









-- Trigger para manejar el cambio de estado en la tabla pacientes y la tabla medicos. Los cambia de activo a inactivo. False a True.
-- Trigger para manejar el cambio de estado en la tabla pacientes y la tabla medicos. Los cambia de activo a inactivo. False a True.

DROP TRIGGER IF EXISTS centro_medico.alta_tratamiento_controller;
DELIMITER //

CREATE TRIGGER centro_medico.alta_tratamiento_controller
	AFTER INSERT ON centro_medico.stagging_tratamientos
	FOR EACH ROW
	BEGIN 
		
		DECLARE check_id_medico INT;
		DECLARE check_id_paciente INT;
	
	
		-- Checkear si el id_medico existe.
		SELECT m.id_medico INTO check_id_medico
		FROM centro_medico.stagging_medicos AS m
		WHERE m.id_medico = NEW.id_medico;
		
		
		-- Checkear si el id_paciente existe.
		SELECT p.id_paciente INTO check_id_paciente
		FROM centro_medico.stagging_pacientes AS p
		WHERE p.id_paciente = NEW.id_paciente;
	
		IF check_id_medico IS NULL AND check_id_paciente IS NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Actualizacion de estado cancelada.';
		ELSE 
			UPDATE centro_medico.stagging_medicos 
			SET estado = 1 
			WHERE id_medico = check_id_medico;
		
			UPDATE centro_medico.stagging_pacientes 
			SET estado = 1
			WHERE id_paciente = check_id_paciente;
		
		END IF;
		
	END //
DELIMITER ;