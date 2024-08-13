USE centro_medico;




-- Funcion que sirve para devolver precio de algo + IVA (establecido en 21% en Argentina), 
-- servira para pagar algun salario o algun costo/gasto que tenga que ver con insumos.

DROP FUNCTION IF EXISTS centro_medico.sumar_IVA_21;
DELIMITER //

CREATE FUNCTION centro_medico.sumar_IVA_21 (monto FLOAT(10,2))
	RETURNS FLOAT(10,2)
	DETERMINISTIC
	READS SQL DATA

BEGIN
	
	DECLARE porcentaje_a_sumar FLOAT(10,2);
	DECLARE nuevo_monto FLOAT(10,2);
	
	SET porcentaje_a_sumar = (monto * 21) / 100;
	SET nuevo_monto = monto + porcentaje_a_sumar;
	
	RETURN nuevo_monto;

END //
DELIMITER ;


    -- "Usando la funcion 'sumar_IVA_21()' de la base de datos 'centro_medico' "
    -- "Usando la funcion 'sumar_IVA_21()' de la base de datos 'centro_medico' "
    SELECT centro_medico.sumar_IVA_21(55) AS monto;












-- Esta funcion devuelve el primer caracter a mayuscula, simulando el "capitalize"
--  de algunos lenguajes de programacion. Pocos casos de uso, podria servir para situaciones keySensitive.
DROP FUNCTION IF EXISTS centro_medico.CAPITALIZE;
DELIMITER //

CREATE FUNCTION centro_medico.CAPITALIZE ( string VARCHAR(255))
	RETURNS VARCHAR(255)
	DETERMINISTIC
	NO SQL
BEGIN	
	
	DECLARE primer_letra VARCHAR(255);
	DECLARE resto_letra VARCHAR(255);
	DECLARE capitalizada VARCHAR(255);

	SET primer_letra = UPPER(SUBSTRING(string, 1, 1));
	SET resto_letra = LOWER(SUBSTRING(string, 2));
	SET capitalizada = CONCAT(primer_letra, resto_letra);

	RETURN capitalizada;
	
END //
DELIMITER ;

    -- "Usando la funcion CAPITALIZE"
    -- "Usando la funcion CAPITALIZE"
    SELECT CAPITALIZE('no quiero saber mas sobre el tema') AS resultado;












-- Esta funcion servira para cambiar el estado boleano de un campo,
--  si esta en "false", cambia a "true" y al visceversa.
DROP FUNCTION IF EXISTS centro_medico.ACTIVE_INACTIVE;
DELIMITER //

CREATE FUNCTION centro_medico.ACTIVE_INACTIVE ( valor BOOLEAN )
	RETURNS BOOLEAN
	DETERMINISTIC
	NO SQL
BEGIN	
	
	DECLARE nuevo_valor BOOLEAN;
	SET nuevo_valor = CASE 
							WHEN valor THEN FALSE
							ELSE TRUE
						END;
	RETURN nuevo_valor;
	
END //
DELIMITER ;


    -- "Usando la funcion ACTIVE_INACTIVE"
    -- "Usando la funcion ACTIVE_INACTIVE"
SELECT 
	CASE 
		WHEN ACTIVE_INACTIVE(pac.estado) = 0 THEN 'Inactivo'
		ELSE 'Activo'
	END AS estado,
	pac.nombre_paciente 
FROM centro_medico.pacientes AS pac
WHERE pac.id_paciente = 1;









-- Esta funcion aplica un descuento segun que OBRA SOCIAL se le indique como argumento. Recibe 2 argumentos.
-- Parametros/Argumentos:  recibe como primer argumento el precio a descontar, y segundo parametro la obra social.

DROP FUNCTION IF EXISTS centro_medico.DISCOUNT_OS;
DELIMITER //

CREATE FUNCTION centro_medico.DISCOUNT_OS 
( precio FLOAT(10,2), obra_social VARCHAR(255))
	RETURNS FLOAT(10,2)
	DETERMINISTIC
	NO SQL
BEGIN
	
	DECLARE descuento FLOAT(10,2);
	DECLARE calculo_descuento FLOAT(10,2);
	DECLARE precio_descontado FLOAT(10,2);

	SET descuento = CASE 
						WHEN UPPER(obra_social) = 'SANCOR' THEN 10
						WHEN UPPER(obra_social) = 'VITAL' THEN 20
						WHEN UPPER(obra_social) = 'OSPE' THEN 21.50
						WHEN UPPER(obra_social) = 'OSDE' THEN 27
						WHEN UPPER(obra_social) = 'SWISSMEDICAL' THEN 32
					END;
	
	SET calculo_descuento = precio * descuento / 100;
	SET precio_descontado = precio - calculo_descuento;
	
	RETURN precio_descontado;
	
END //
DELIMITER ;




	-- "Usando centro_medico.DISCOUNT_OS"
	-- "Usando centro_medico.DISCOUNT_OS"
	-- "Usando centro_medico.DISCOUNT_OS"
	SELECT 
		DISCOUNT_OS(tp.cuota, tp.obra_social),
		tp.obra_social
	FROM centro_medico.view_facturacion_tratamiento_paciente AS tp
	LIMIT 5;





-- Esta funcion controlara si la obra social ingresada esta dentro de las permitidas para empleados en el centro medico:
-- Esta funcion controlara si la obra social ingresada esta dentro de las permitidas para empleados en el centro medico:
-- Esta funcion controlara si la obra social ingresada esta dentro de las permitidas para empleados en el centro medico:

DROP FUNCTION IF EXISTS centro_medico.CHECK_OS;
DELIMITER //

CREATE FUNCTION centro_medico.CHECK_OS(obra_social VARCHAR(255))
	RETURNS INT
	NO SQL
BEGIN

	DECLARE check_obra_social INT;

	SET check_obra_social = CASE
								WHEN UPPER(obra_social) IN ('OSDE', 'UOCRA', 'SANCOR') THEN 1
								ELSE 0
						  END;

	RETURN check_obra_social;

END //
DELIMITER ;

	-- -- Caso de uso correcto, resultado " true"
	-- SELECT CHECK_OS('uocra') AS Resultado
	-- -- Caso de uso incorrecto, resultado " false"
	-- SELECT CHECK_OS('swissmedical') AS Resultado