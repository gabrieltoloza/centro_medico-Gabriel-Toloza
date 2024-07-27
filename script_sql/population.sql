
USE centro_medico;


SET GLOBAL local_infile = true;




-- importacion de registros de la tabla "duenos"
-- importacion de registros de la tabla "duenos"
LOAD    DATA LOCAL INFILE './data_csv/duenos.csv'
        INTO TABLE duenos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (nombre_dueno, apellido_dueno, dni_dueno, domicilio_dueno, telefono_dueno);



-- importacion de registros de la tabla "centros_medicos"
-- importacion de registros de la tabla "centros_medicos"
LOAD    DATA LOCAL INFILE './data_csv/centros_medicos.csv'
        INTO TABLE centros_medicos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_dueno, nombre, direccion, email, telefono, ciudad, provincia, codigo_postal, sitio_web);




-- importacion de registros de la tabla "puestos"
-- importacion de registros de la tabla "puestos"
LOAD    DATA LOCAL INFILE './data_csv/puestos.csv'
        INTO TABLE puestos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (nombre_puesto, honorario_mensual, descripcion_puesto);



-- importacion de registros de la tabla "empleados"
-- importacion de registros de la tabla "empleados"
LOAD    DATA LOCAL INFILE './data_csv/empleados.csv'
        INTO TABLE empleados
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_centro_medico, nombre_empleado, apellido_empleado, dni_empleado, domicilio_empleado, telefono_empleado, fecha_alta);


SHOW WARNINGS;


-- importacion de registros de la tabla "empleados_puestos"
-- importacion de registros de la tabla "empleados_puestos"
LOAD    DATA LOCAL INFILE './data_csv/empleados_puestos.csv'
        INTO TABLE empleados_puestos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_empleado, id_puesto);

SHOW WARNINGS;




-- importacion de registros de la tabla "obra_social_empleados"
-- importacion de registros de la tabla "obra_social_empleados"
LOAD    DATA LOCAL INFILE './data_csv/obra_social_empleados.csv'
        INTO TABLE obra_social_empleados
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_empleado, nombre_obra_social, carnet_numero, fecha_alta);

SHOW WARNINGS;




-- importacion de registros de la tabla "obra_social_empleados"
-- importacion de registros de la tabla "obra_social_empleados"
LOAD    DATA LOCAL INFILE './data_csv/honorario_facturas.csv'
        INTO TABLE honorario_facturas
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_empleado, mes_facturado);

SHOW WARNINGS;



-- importacion de registros de la tabla "obra_social_empleados"
-- importacion de registros de la tabla "obra_social_empleados"
LOAD    DATA LOCAL INFILE './data_csv/pacientes.csv'
        INTO TABLE pacientes
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_centro_medico, nombre_paciente, apellido, dni, fecha_alta, estado, tiene_obra_social);

SHOW WARNINGS;




-- importacion de registros de la tabla "obra_social_pacientes"
-- importacion de registros de la tabla "obra_social_pacientes"
LOAD    DATA LOCAL INFILE './data_csv/obra_social_pacientes.csv'
        INTO TABLE obra_social_pacientes
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_paciente, nombre_obra_social_paciente, carnet_numero);

SHOW WARNINGS;




-- importacion de registros de la tabla "medicos"
-- importacion de registros de la tabla "medicos"
LOAD    DATA LOCAL INFILE './data_csv/medicos.csv'
        INTO TABLE medicos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_centro_medico, nombre_medico, apellido_medico, cuit, email, estado, fecha_alta);

SHOW WARNINGS;



-- importacion de registros de la tabla "profesiones"
-- importacion de registros de la tabla "profesiones"
LOAD    DATA LOCAL INFILE './data_csv/profesiones.csv'
        INTO TABLE profesiones
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (nombre_profesion);

SHOW WARNINGS;




-- importacion de registros de la tabla "profesion_medicos"
-- importacion de registros de la tabla "profesion_medicos"
LOAD    DATA LOCAL INFILE './data_csv/profesion_medicos.csv'
        INTO TABLE profesion_medicos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_medico, id_profesion);

SHOW WARNINGS;



-- importacion de registros de la tabla "matriculas"
-- importacion de registros de la tabla "matriculas"
LOAD    DATA LOCAL INFILE './data_csv/matriculas.csv'
        INTO TABLE matriculas
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_medico, numero_matricula, fecha_emitida);

SHOW WARNINGS;



-- importacion de registros de la tabla "RUP_registro_matriculas"
-- importacion de registros de la tabla "RUP_registro_matriculas"
LOAD    DATA LOCAL INFILE './data_csv/RUP_registro_matriculas.csv'
        INTO TABLE RUP_registro_matriculas
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_matricula, fecha_registrada);

SHOW WARNINGS;



-- importacion de registros de la tabla "tratamientos"
-- importacion de registros de la tabla "tratamientos"
LOAD    DATA LOCAL INFILE './data_csv/tratamientos.csv'
        INTO TABLE tratamientos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_centro_medico, id_medico, id_paciente, descripcion, fecha_inicio, fecha_fin);

SHOW WARNINGS;



-- importacion de registros de la tabla "factura_medico"
-- importacion de registros de la tabla "factura_medico"
LOAD    DATA LOCAL INFILE './data_csv/factura_medico.csv'
        INTO TABLE factura_medico
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_medico, id_tratamiento, horas_trabajadas, monto, mes_facturado);

SHOW WARNINGS;





-- importacion de registros de la tabla "factura_paciente"
-- importacion de registros de la tabla "factura_paciente"
LOAD    DATA LOCAL INFILE './data_csv/factura_paciente.csv'
        INTO TABLE factura_paciente
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_tratamiento, id_paciente, cuota, mes_facutado);

SHOW WARNINGS;


-- Script para capturar errores
-- Script para capturar errores