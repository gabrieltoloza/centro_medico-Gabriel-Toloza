USE centro_medico;


-- Consulta para mostrar las tablas y su descripcion.
SELECT 
    TABLE_NAME, 
    TABLE_COMMENT
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_SCHEMA = 'centro_medico';


SELECT 
	*
FROM centro_medico.empleados AS cm;


SELECT 
	*
FROM centro_medico.puestos AS e;


SELECT 
	*
FROM centro_medico.obra_social_empleados AS e;


SELECT 
	*
FROM centro_medico.honorario_facturas AS e;


SELECT 
	*
FROM centro_medico.pacientes AS e;



SELECT 
	*
FROM centro_medico.medicos;


SELECT 
	*
FROM centro_medico.profesiones;


SELECT 
	*
FROM centro_medico.profesion_medicos;

SELECT 
	*
FROM centro_medico.matriculas;


SELECT 
	*
FROM centro_medico.RUP_registro_matriculas;


SELECT 
	*
FROM centro_medico.tratamientos;


SELECT 
	*
FROM centro_medico.factura_medico;



SELECT 
	*
FROM centro_medico.factura_paciente;


EXPLAIN centro_medico.tratamientos;






-- Vista para mostrar los empleados de tecnica y operabilidad del centro medico filtrando por el id o nombre si queremos.
-- Vista para mostrar los empleados de tecnica y operabilidad del centro medico filtrando por el id o nombre si queremos.
SELECT 
	cm.nombre AS centro_medico,
	cm.provincia,
	e.id_empleado,
	e.nombre_empleado,
	e.apellido_empleado,
	e.fecha_alta 
FROM centro_medico.empleados AS e
JOIN centro_medico.centros_medicos AS cm
	ON cm.id_centro_medico = e.id_centro_medico
WHERE cm.id_centro_medico = 1;




-- Vista para mostrar a los empleados y sus puestos de trabajo, se puede filtrar por centro medico.
-- Vista para mostrar a los empleados y sus puestos de trabajo, se puede filtrar por centro medico.
SELECT 
	e.id_empleado ,
	e.nombre_empleado,
	p.nombre_puesto,
	p.honorario_mensual AS salario_mensual
FROM centro_medico.empleados AS e
JOIN centro_medico.empleados_puestos AS ep
	ON ep.id_empleado = e.id_empleado
JOIN centro_medico.puestos as p
	ON p.id_puesto = ep.id_puesto
ORDER BY id_empleado;




-- vista que muestra a los empleados de tecnica del centro medico con sus obra sociales.
-- vista que muestra a los empleados de tecnica del centro medico con sus obra sociales.
SELECT 
	e.nombre_empleado,
	e.apellido_empleado,
	osp.nombre_obra_social,
	osp.carnet_numero,
	osp.fecha_alta
FROM centro_medico.empleados AS e
JOIN centro_medico.obra_social_empleados AS osp
	ON osp.id_empleado = e.id_empleado;
	



-- Vista para mostrar el empleado y su fecha de facturacion.
-- Vista para mostrar el empleado y su fecha de facturacion.
SELECT 
	e.nombre_empleado,
	e.apellido_empleado,
	hf.mes_facturado
FROM centro_medico.empleados AS e
JOIN centro_medico.honorario_facturas AS hf
	ON hf.id_empleado = e.id_empleado;




-- Vista para ver pacientes y sus obras sociales.
-- Vista para ver pacientes y sus obras sociales.
SELECT 
	p.nombre_paciente,
	p.apellido,
	osp.nombre_obra_social_paciente,
	osp.carnet_numero,
	p.fecha_alta
FROM centro_medico.obra_social_pacientes AS osp
JOIN centro_medico.pacientes AS p
	ON osp.id_paciente = p.id_paciente
WHERE p.id_centro_medico = 1;




-- Esto devuelve los medicos y sus profesiones.
-- Esto devuelve los medicos y sus profesiones.
SELECT 
	m.nombre_medico,
	m.apellido_medico,
	m.estado,
	p.id_profesion ,
	p.nombre_profesion 
FROM centro_medico.medicos AS m
JOIN centro_medico.profesion_medicos AS pm
	ON pm.id_medico = m.id_medico
JOIN centro_medico.profesiones AS p
	ON p.id_profesion = pm.id_profesion
WHERE m.id_centro_medico = 3;




-- Vista para ver a los medicos y sus matriculas.
-- Vista para ver a los medicos y sus matriculas.
SELECT 
	m.nombre_medico,
	m.apellido_medico,
	mat.numero_matricula,
	mat.fecha_emitida,
	rup.fecha_registrada AS alta_RUP
FROM centro_medico.medicos AS m
JOIN centro_medico.matriculas AS mat
	ON mat.id_medico = m.id_medico
JOIN centro_medico.RUP_registro_matriculas AS rup
	ON rup.id_matricula = mat.id_matricula;
	




-- Vista que trae los tratamientos con el medico, paciente y descripcion del tratamieto con fechas.
-- Vista que trae los tratamientos con el medico, paciente y descripcion del tratamieto con fechas.
SELECT 
	CONCAT(m.nombre_medico,' ', m.apellido_medico) AS medico,
	CONCAT(p.nombre_paciente,' ', p.apellido) AS paciente,
	prof.nombre_profesion AS area,
	t.descripcion,
	t.fecha_inicio,
	t.fecha_fin
FROM centro_medico.pacientes AS p
JOIN centro_medico.tratamientos AS t
	ON p.id_paciente = t.id_paciente
JOIN centro_medico.medicos AS m
	ON t.id_medico = m.id_medico
JOIN centro_medico.profesion_medicos AS pm
	ON pm.id_medico = m.id_medico
JOIN centro_medico.profesiones AS prof
	ON prof.id_profesion = pm.id_profesion;	




-- Vista para ver los datos de la facturacion de los medicos por cada tratamiento en el que trabaja.
-- Vista para ver los datos de la facturacion de los medicos por cada tratamiento en el que trabaja.
SELECT 
	CONCAT(m.nombre_medico, ' ', m.apellido_medico) AS medico,
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





-- Vista de facturacion de los servicios de cada paciente con datos de cada uno.
-- Vista de facturacion de los servicios de cada paciente con datos de cada uno.
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







-- ! CONTINUAR CREANDO LAS VISTAS, LUEGO LAS FUNCIONES, LUEGO LOS PROCEDIMIENTOS, LUEGO LOS TRIGGERS, REVISAR DE NUEVO TODO.... POR ULTIMO INTENTAR COORDINAR EL MAKEFYLE
-- ! CONTINUAR CREANDO LAS VISTAS, LUEGO LAS FUNCIONES, LUEGO LOS PROCEDIMIENTOS, LUEGO LOS TRIGGERS, REVISAR DE NUEVO TODO.... POR ULTIMO INTENTAR COORDINAR EL MAKEFYLE
-- ! CONTINUAR CREANDO LAS VISTAS, LUEGO LAS FUNCIONES, LUEGO LOS PROCEDIMIENTOS, LUEGO LOS TRIGGERS, REVISAR DE NUEVO TODO.... POR ULTIMO INTENTAR COORDINAR EL MAKEFYLE
-- ! CONTINUAR CREANDO LAS VISTAS, LUEGO LAS FUNCIONES, LUEGO LOS PROCEDIMIENTOS, LUEGO LOS TRIGGERS, REVISAR DE NUEVO TODO.... POR ULTIMO INTENTAR COORDINAR EL MAKEFYLE
-- ! CONTINUAR CREANDO LAS VISTAS, LUEGO LAS FUNCIONES, LUEGO LOS PROCEDIMIENTOS, LUEGO LOS TRIGGERS, REVISAR DE NUEVO TODO.... POR ULTIMO INTENTAR COORDINAR EL MAKEFYLE

