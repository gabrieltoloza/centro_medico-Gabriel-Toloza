

-- AREA OPERATIVA
-- AREA OPERATIVA
-- AREA OPERATIVA
-- AREA OPERATIVA
-- AREA OPERATIVA
-- AREA OPERATIVA


-- Vista para mostrar a los empleados y sus puestos de trabajo, se puede filtrar por centro medico.
-- Vista para mostrar a los empleados y sus puestos de trabajo, se puede filtrar por centro medico.
DROP VIEW IF EXISTS view_show_empleados_all_data;
CREATE VIEW view_show_empleados_all_data AS 
	SELECT 
		e.id_centro_medico, 
		CONCAT(e.nombre_empleado, ' ', e.apellido_empleado) AS empleado,
		e.dni_empleado,
		e.domicilio_empleado,
		e.telefono_empleado,
		e.fecha_alta AS alta_CM, 
		ose.nombre_obra_social,
		ose.carnet_numero AS carnet_OS,
		ose.fecha_alta AS alta_OS,
		p.nombre_puesto AS puesto,
		p.honorario_mensual AS salario_mensual,
		p.descripcion_puesto 
	FROM centro_medico.obra_social_empleados AS ose
	JOIN centro_medico.empleados AS e
		USING (id_empleado)
	JOIN centro_medico.empleados_puestos AS ep
		USING (id_empleado)
	JOIN centro_medico.puestos AS p
		USING (id_puesto)
	ORDER BY id_empleado;


    -- Usando vista "view_show_empleados_all_data"
    -- Usando vista "view_show_empleados_all_data"
    SELECT * FROM centro_medico.view_show_empleados_all_data;







-- Vista para mostrar el empleado y su fecha de facturacion
-- Vista para mostrar el empleado y su fecha de facturacion
DROP VIEW IF EXISTS view_show_empleados_facturaciones;
CREATE VIEW view_show_empleados_facturaciones AS
	SELECT 
		CONCAT(e.nombre_empleado, ' ', e.apellido_empleado) AS empleado ,
		e.dni_empleado,
		e.domicilio_empleado,
		hf.mes_facturado,
		p.nombre_puesto AS tarea,
		p.descripcion_puesto,
		p.honorario_mensual AS salario
	FROM centro_medico.honorario_facturas AS hf
	JOIN centro_medico.empleados AS e
		USING (id_empleado)
	JOIN centro_medico.empleados_puestos AS ep
		USING (id_empleado)
	JOIN centro_medico.puestos AS p
		USING (id_puesto)
	ORDER BY e.id_empleado;

    -- Usando vista "view_show_empleados_facturaciones"
    -- Usando vista "view_show_empleados_facturaciones"
    SELECT * FROM centro_medico.view_show_empleados_facturaciones;












-- Esta vista devolvera a los empleados, con todos los detalles de la obra social.
-- Se puede filtrar por nombre o id. Recomendacion: Filtrar usando id_empleado
DROP VIEW IF EXISTS centro_medico.view_show_empleados_obras_sociales;
CREATE VIEW centro_medico.view_show_empleados_obras_sociales AS
	SELECT 
		e.id_centro_medico,
		CONCAT(e.nombre_empleado, ' ', e.apellido_empleado) AS empleado,
		e.dni_empleado AS DNI,
		e.telefono_empleado AS telefono,
		ose.nombre_obra_social AS OS,
		ose.carnet_numero AS carnet_OS,
		ose.fecha_alta AS alta_OS
	FROM centro_medico.empleados AS e
	JOIN centro_medico.obra_social_empleados AS ose
		USING (id_empleado);

    -- Usando vista "view_show_empleados_obras_sociales"
    -- Usando vista "view_show_empleados_obras_sociales"
    SELECT * FROM centro_medico.view_show_empleados_obras_sociales;







-- =================================================================================================================
-- =================================================================================================================
-- =================================================================================================================
-- =================================================================================================================



-- AREA PROPIETARIOS
-- AREA PROPIETARIOS
-- AREA PROPIETARIOS
-- AREA PROPIETARIOS
-- AREA PROPIETARIOS
-- AREA PROPIETARIOS



-- Esta vista devuelve a los duenos de los centros medicos
-- Esta vista devuelve a los duenos de los centros medicos
-- Esta vista devuelve a los duenos de los centros medicos
DROP VIEW IF EXISTS centro_medico.view_duenos_centros_medicos;
CREATE VIEW centro_medico.view_duenos_centros_medicos AS 
	SELECT 
		CONCAT(d.nombre_dueno, ' ', d.apellido_dueno) AS dueno,
		d.dni_dueno,
		d.telefono_dueno,
		cm.nombre AS centro_medico,
		cm.direccion AS domicilio_CM,
		cm.email AS email_CM,
		cm.telefono AS telefono_CM,
		cm.ciudad,
		cm.provincia,
		cm.codigo_postal,
		cm.sitio_web
	FROM centro_medico.duenos AS d
	JOIN centro_medico.centros_medicos AS cm
		USING (id_dueno);
	

    -- Usando vista "view_show_duenos_centros_medicos"
    -- Usando vista "view_show_duenos_centros_medicos"
    SELECT * FROM centro_medico.view_duenos_centros_medicos;




-- =================================================================================================================
-- =================================================================================================================
-- =================================================================================================================
-- =================================================================================================================


-- AREA PROFESIONAL
-- AREA PROFESIONAL
-- AREA PROFESIONAL
-- AREA PROFESIONAL
-- AREA PROFESIONAL



-- Vista para ver pacientes y sus obras sociales.
-- Vista para ver pacientes y sus obras sociales.
-- Vista para ver pacientes y sus obras sociales.
DROP VIEW IF EXISTS centro_medico.view_show_pacientes_obra_social;
CREATE VIEW centro_medico.view_show_pacientes_obra_social AS
	SELECT 
		CONCAT(p.nombre_paciente, ' ', p.apellido) AS paciente,
		p.dni,
		p.fecha_alta AS alta_CM,
		CASE 
			WHEN p.estado = 0 THEN 'Inactivo'
			ELSE 'Activo'
		END,
		CASE
			WHEN p.tiene_obra_social = 0 THEN 'No'
			ELSE 'Si'
		END,
		osp.nombre_obra_social_paciente,
		osp.carnet_numero
	FROM centro_medico.obra_social_pacientes AS osp
	JOIN centro_medico.pacientes AS p
		USING (id_paciente);
	

    -- Usando vista "view_show_pacientes_obra_social"
    -- Usando vista "view_show_pacientes_obra_social"
SELECT * FROM centro_medico.view_show_pacientes_obra_social;








-- Vista para mostrar los tratamientos con sus pacientes y medicos respectivos.
-- Vista para mostrar los tratamientos con sus pacientes y medicos respectivos.
-- Vista para mostrar los tratamientos con sus pacientes y medicos respectivos.
DROP VIEW IF EXISTS centro_medico.view_show_tratamientos_main;
CREATE VIEW centro_medico.view_show_tratamientos_main AS
	SELECT 
		osp.nombre_obra_social_paciente AS OS,
		osp.carnet_numero AS carnet_OS,
		CONCAT(pac.nombre_paciente, ' ', pac.apellido) AS paciente,
		CONCAT(med.nombre_medico, ' ', med.apellido_medico) AS medico,
		prof.nombre_profesion AS area,
		t.descripcion,
		t.fecha_inicio,
		CASE 
			WHEN t.fecha_fin IS NULL THEN 'Tratamiento activo'
		END AS fecha_fin
	FROM centro_medico.obra_social_pacientes AS osp
	JOIN centro_medico.pacientes AS pac
		USING (id_paciente)
	JOIN centro_medico.tratamientos AS t
		USING (id_paciente)
	JOIN centro_medico.medicos AS med
		USING (id_medico)
	JOIN centro_medico.profesion_medicos AS pm
		USING (id_medico)
	JOIN centro_medico.profesiones AS prof
		USING (id_profesion);
	
	
    -- Usando vista "view_show_tratamientos_main"
    -- Usando vista "view_show_tratamientos_main"
    SELECT * FROM centro_medico.view_show_tratamientos_main;











-- Esta vista muestra todos los datos de los medicos
-- Esta vista muestra todos los datos de los medicos
-- Esta vista muestra todos los datos de los medicos
DROP VIEW IF EXISTS centro_medico.view_show_medicos_full_data;
CREATE VIEW centro_medico.view_show_medicos_full_data AS
	SELECT 
		CONCAT(med.nombre_medico, ' ', med.apellido_medico) AS medico,
		med.cuit,
		med.email,
		CASE 
			WHEN med.estado = 0 THEN 'Disponible'
			ELSE 'En tratamiento medico.'
		END AS estado,
		prof.nombre_profesion AS profesion,
		mat.numero_matricula,
		reg.fecha_registrada AS alta_matricula
	FROM centro_medico.profesiones AS prof
	JOIN centro_medico.profesion_medicos AS pm
		USING (id_profesion)
	JOIN centro_medico.medicos AS med
		USING (id_medico)
	JOIN centro_medico.matriculas AS mat
		USING (id_medico)
	JOIN centro_medico.RUP_registro_matriculas AS reg
		USING (id_matricula);
	

    -- Usando vista "view_show_medicos_full_data"
    -- Usando vista "view_show_medicos_full_data"
    SELECT * FROM centro_medico.view_show_medicos_full_data;










-- Vista para ver los datos de la facturacion de los medicos por cada tratamiento en el que trabaja.
-- Vista para ver los datos de la facturacion de los medicos por cada tratamiento en el que trabaja.
-- Vista para ver los datos de la facturacion de los medicos por cada tratamiento en el que trabaja.
DROP VIEW IF EXISTS centro_medico.view_facturacion_medico_tratamiento;
CREATE VIEW centro_medico.view_facturacion_medico_tratamiento AS 
	SELECT 
		CONCAT(m.nombre_medico, ' ', m.apellido_medico) AS medico,
		m.email,
		p.nombre_profesion AS area,
		t.id_tratamiento,
		t.descripcion,
		fm.monto AS pago_por_tratamiento,
		fm.horas_trabajadas AS horas_trabajadas_mensuales,
		fm.mes_facturado AS fecha_facturacion
	FROM centro_medico.profesiones AS p
	JOIN centro_medico.profesion_medicos AS pm
		ON pm.id_profesion = p.id_profesion
	JOIN centro_medico.medicos AS m
		ON m.id_medico = pm.id_medico
	JOIN centro_medico.tratamientos AS t
		ON t.id_medico = m.id_medico
	JOIN centro_medico.factura_medico AS fm
		ON fm.id_tratamiento  = t.id_tratamiento
	ORDER BY fm.id_factura_medico;



    -- Usando vista "view_facturacion_medico_tratamiento"
    -- Usando vista "view_facturacion_medico_tratamiento"
    SELECT * FROM centro_medico.view_facturacion_medico_tratamiento;







-- Vista de facturacion de los servicios de cada paciente con datos de cada uno.
-- Vista de facturacion de los servicios de cada paciente con datos de cada uno.
-- Vista de facturacion de los servicios de cada paciente con datos de cada uno.
DROP VIEW IF EXISTS centro_medico.view_facturacion_tratamiento_paciente;
CREATE VIEW centro_medico.view_facturacion_tratamiento_paciente AS
	SELECT 
		CONCAT(p.nombre_paciente, ' ', p.apellido) AS paciente,
		CASE
			WHEN p.tiene_obra_social = 0 THEN 'No'
			ELSE 'Si'
		END AS tiene_obra_social
		,
		osp.nombre_obra_social_paciente AS obra_social,
		osp.carnet_numero,
		CASE
			WHEN p.estado = 0 THEN 'Inactivo'
			ELSE 'Activo'
		END AS estado,
		t.descripcion,
		fp.cuota,
		fp.mes_facutado,
		t.fecha_fin
	FROM centro_medico.obra_social_pacientes AS osp
	JOIN centro_medico.pacientes AS p
	USING (id_paciente)
	JOIN centro_medico.tratamientos AS t
	USING (id_paciente)
	JOIN centro_medico.factura_paciente AS fp
	USING (id_paciente);



    -- Usando vista "view_facturacion_tratamiento_paciente"
    -- Usando vista "view_facturacion_tratamiento_paciente"
SELECT * FROM centro_medico.view_facturacion_tratamiento_paciente;
	


