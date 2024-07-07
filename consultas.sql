USE centro_medico;

SELECT 
*
FROM centro_medico.empleados;

SELECT 
*
FROM centro_medico.pacientes;

SELECT 
*
FROM centro_medico.medicos;

SELECT 
*
FROM centro_medico.tratamientos;

SELECT 
*
FROM centro_medico.puestos;

SELECT 
*
FROM centro_medico.empleados_puestos;

SELECT 
*
FROM centro_medico.duenos;

SELECT 
*
FROM centro_medico.centros_medicos;


SELECT 
*
FROM centro_medico.RUP_registro_matriculas;


-- JOIN para mostrar empleados y sus tareas.
SELECT 
e.nombre_empleado,
e.apellido_empleado,
p.nombre_puesto
FROM centro_medico.empleados AS e
JOIN empleados_puestos AS ep
	ON e.id_empleado = ep.id_empleado
JOIN centro_medico.puestos AS p
	ON p.id_puesto = ep.id_puesto; 





-- JOIN para mostrar empleados y sus obra sociales.
SELECT 
e.nombre_empleado,
e.apellido_empleado,
ose.nombre_obra_social,
ose.carnet_numero 
FROM centro_medico.obra_social_empleados AS ose
JOIN centro_medico.empleados AS e
	ON ose.id_empleado = e.id_empleado;
	




-- Join para mostrar la facturacion de los empleados del Centro Medico.
SELECT 
e.nombre_empleado,
e.apellido_empleado,
p.nombre_puesto,
p.honorario_mensual,
hf.mes_facturado
FROM centro_medico.honorario_facturas as hf
JOIN centro_medico.empleados AS e
	ON hf.id_empleado = e.id_empleado
JOIN centro_medico.empleados_puestos AS ep
	ON e.id_empleado = ep.id_empleado
JOIN centro_medico.puestos AS p
	ON ep.id_puesto = p.id_puesto;





-- JOIN para mostrar pacientes y sus obras sociales
SELECT 
p.nombre_paciente,
p.apellido,
osp.nombre_obra_social_paciente,
osp.carnet_numero
FROM centro_medico.pacientes AS p
JOIN centro_medico.obra_social_pacientes AS osp
	ON p.id_paciente = osp.id_paciente;





-- Join que trae los medicos y sus profesiones.
SELECT 
m.nombre_medico,
m.apellido_medico,
p.nombre_profesion
FROM centro_medico.medicos AS m
JOIN centro_medico.profesion_medicos AS pm
	ON pm.id_medico = m.id_medico 
JOIN centro_medico.profesiones AS p
	ON pm.id_profesion = p.id_profesion;





-- Join para mostrar medicos y sus matriculas con la fecha de emision y registro en el R.U.P (Registro unico de los profesionales de la salud)
SELECT 
med.nombre_medico,
med.apellido_medico,
mat.numero_matricula,
mat.fecha_emitida,
rpm.fecha_registrada AS registro_RUP
FROM centro_medico.matriculas AS mat
JOIN centro_medico.medicos AS med
	ON mat.id_medico = med.id_medico
JOIN centro_medico.RUP_registro_matriculas AS rpm
	ON mat.id_matricula = rpm.id_matricula;





-- JOIN para mostrat todos los tratamientos en proceso.
SELECT 
p.nombre_paciente,
p.apellido,
m.nombre_medico,
m.apellido_medico,
prof.nombre_profesion  AS categoria,
t.descripcion
FROM centro_medico.tratamientos AS t
JOIN centro_medico.pacientes AS p
	ON t.id_paciente = p.id_paciente 
JOIN centro_medico.medicos AS m
	ON t.id_medico = m.id_medico 
JOIN centro_medico.profesion_medicos AS pm
	ON m.id_medico = pm.id_medico
JOIN centro_medico.profesiones AS prof
	ON pm.id_profesion = prof.id_profesion;





-- JOIN para la facturacion de los servicios prestados por los medicos.
SELECT 
m.nombre_medico,
m.apellido_medico,
p.nombre_profesion AS categoria,
t.descripcion,
fm.horas_trabajadas,
fm.monto,
fm.mes_facturado 
FROM centro_medico.factura_medico AS fm
JOIN centro_medico.tratamientos AS t
	ON t.id_tratamiento = fm.id_tratamiento
JOIN centro_medico.medicos AS m
	ON t.id_medico = m.id_medico
JOIN centro_medico.profesion_medicos AS pm
	ON m.id_medico = pm.id_medico
JOIN centro_medico.profesiones AS p
	ON pm.id_profesion = p.id_profesion;





-- JOIN para mostrar la facturacion de los pacientes
SELECT
p.nombre_paciente,
p.apellido,
prof.nombre_profesion AS categoria,
t.descripcion,
fp.cuota,
fp.mes_facutado
FROM centro_medico.factura_paciente AS fp
JOIN centro_medico.tratamientos AS t
	ON fp.id_tratamiento = t.id_tratamiento 
JOIN centro_medico.pacientes AS p
	ON t.id_paciente = p.id_paciente
JOIN centro_medico.medicos AS m
	ON m.id_medico = t.id_medico
JOIN centro_medico.profesion_medicos AS pm
	ON pm.id_medico = m.id_medico
JOIN centro_medico.profesiones AS prof
	ON prof.id_profesion = pm.id_profesion;