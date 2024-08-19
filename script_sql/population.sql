
USE centro_medico;




-- importacion de registros de la tabla "duenos"
-- importacion de registros de la tabla "duenos"
LOAD    DATA LOCAL INFILE './data_csv/duenos.csv'
        INTO TABLE duenos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (nombre_dueno, apellido_dueno, dni_dueno, domicilio_dueno, telefono_dueno);

SELECT 'LA IMPORTACION DE duenos.csv TERMINO AQUI' AS mensaje;


-- importacion de registros de la tabla "centros_medicos"
-- importacion de registros de la tabla "centros_medicos"
LOAD    DATA LOCAL INFILE './data_csv/centros_medicos.csv'
        INTO TABLE centros_medicos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_dueno, nombre, direccion, email, telefono, ciudad, provincia, codigo_postal, sitio_web);

SELECT 'LA IMPORTACION DE centros_medicos.csv TERMINO AQUI' AS mensaje;




-- importacion de registros de la tabla "puestos"
-- importacion de registros de la tabla "puestos"
LOAD    DATA LOCAL INFILE './data_csv/puestos.csv'
        INTO TABLE puestos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (nombre_puesto, honorario_mensual, descripcion_puesto);

SELECT 'LA IMPORTACION DE puestos.csv TERMINO AQUI' AS mensaje;




-- importacion de registros de la tabla "empleados"
-- importacion de registros de la tabla "empleados"
LOAD    DATA LOCAL INFILE './data_csv/empleados.csv'
        INTO TABLE empleados
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_centro_medico, nombre_empleado, apellido_empleado, dni_empleado, domicilio_empleado, telefono_empleado, fecha_alta);

SELECT 'LA IMPORTACION DE empleados.csv TERMINO AQUI' AS mensaje;



SHOW WARNINGS;


-- importacion de registros de la tabla "empleados_puestos"
-- importacion de registros de la tabla "empleados_puestos"
LOAD    DATA LOCAL INFILE './data_csv/empleados_puestos.csv'
        INTO TABLE empleados_puestos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_empleado, id_puesto);

SELECT 'LA IMPORTACION DE empleados_puestos.csv TERMINO AQUI' AS mensaje;


SHOW WARNINGS;




-- importacion de registros de la tabla "obra_social_empleados"
-- importacion de registros de la tabla "obra_social_empleados"
LOAD    DATA LOCAL INFILE './data_csv/obra_social_empleados.csv'
        INTO TABLE obra_social_empleados
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_empleado, nombre_obra_social, carnet_numero, fecha_alta);

SELECT 'LA IMPORTACION DE obra_social_empleados.csv TERMINO AQUI' AS mensaje;


SHOW WARNINGS;




-- importacion de registros de la tabla "honorario_facturas"
-- importacion de registros de la tabla "honorario_facturas"
LOAD    DATA LOCAL INFILE './data_csv/honorario_facturas.csv'
        INTO TABLE honorario_facturas
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_empleado, mes_facturado);
            
SELECT 'LA IMPORTACION DE honorario_facturas.csv TERMINO AQUI' AS mensaje;


SHOW WARNINGS;



-- importacion de registros de la tabla "pacientes"
-- importacion de registros de la tabla "pacientes"
LOAD    DATA LOCAL INFILE './data_csv/pacientes.csv'
        INTO TABLE pacientes
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_centro_medico, nombre_paciente, apellido, dni, fecha_alta, estado, tiene_obra_social);

SELECT 'LA IMPORTACION DE pacientes.csv TERMINO AQUI' AS mensaje;

SHOW WARNINGS;




-- importacion de registros de la tabla "obra_social_pacientes"
-- importacion de registros de la tabla "obra_social_pacientes"
LOAD    DATA LOCAL INFILE './data_csv/obra_social_pacientes.csv'
        INTO TABLE obra_social_pacientes
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_paciente, nombre_obra_social_paciente, carnet_numero);

SELECT 'LA IMPORTACION DE obra_social_pacientes.csv TERMINO AQUI' AS mensaje;


SHOW WARNINGS;




-- importacion de registros de la tabla "medicos"
-- importacion de registros de la tabla "medicos"
LOAD    DATA LOCAL INFILE './data_csv/medicos.csv'
        INTO TABLE medicos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_centro_medico, nombre_medico, apellido_medico, cuit, email, estado, fecha_alta);

SELECT 'LA IMPORTACION DE medicos.csv TERMINO AQUI' AS mensaje;


SHOW WARNINGS;



-- importacion de registros de la tabla "profesiones"
-- importacion de registros de la tabla "profesiones"
LOAD    DATA LOCAL INFILE './data_csv/profesiones.csv'
        INTO TABLE profesiones
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (nombre_profesion);

SELECT 'LA IMPORTACION DE profesiones.csv TERMINO AQUI' AS mensaje;


SHOW WARNINGS;




-- importacion de registros de la tabla "profesion_medicos"
-- importacion de registros de la tabla "profesion_medicos"
LOAD    DATA LOCAL INFILE './data_csv/profesion_medicos.csv'
        INTO TABLE profesion_medicos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_medico, id_profesion);

SELECT 'LA IMPORTACION DE profesion_medicos.csv TERMINO AQUI' AS mensaje;


SHOW WARNINGS;



-- importacion de registros de la tabla "matriculas"
-- importacion de registros de la tabla "matriculas"
LOAD    DATA LOCAL INFILE './data_csv/matriculas.csv'
        INTO TABLE matriculas
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_medico, numero_matricula);


SHOW WARNINGS;

SELECT 'LA IMPORTACION DE matriculas.csv TERMINO AQUI' AS mensaje;





-- importacion de registros de la tabla "RUP_registro_matriculas"
-- importacion de registros de la tabla "RUP_registro_matriculas"
LOAD    DATA LOCAL INFILE './data_csv/RUP_registro_matriculas.csv'
        INTO TABLE RUP_registro_matriculas
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_matricula, fecha_registrada);


SHOW WARNINGS;

SELECT 'LA IMPORTACION DE RUP_registro_matriculas.csv TERMINO AQUI' AS mensaje;




-- importacion de registros de la tabla "tratamientos"
-- importacion de registros de la tabla "tratamientos"
LOAD    DATA LOCAL INFILE './data_csv/tratamientos.csv'
        INTO TABLE tratamientos
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_centro_medico, id_medico, id_paciente, descripcion, fecha_inicio);


SHOW WARNINGS;
SELECT 'LA IMPORTACION DE tratamientos.csv TERMINO AQUI' AS mensaje;




-- importacion de registros de la tabla "factura_medico"
-- importacion de registros de la tabla "factura_medico"
LOAD    DATA LOCAL INFILE './data_csv/factura_medico.csv'
        INTO TABLE factura_medico
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_medico, id_tratamiento, horas_trabajadas, monto, mes_facturado);


SHOW WARNINGS;
SELECT 'LA IMPORTACION DE factura_medico.csv TERMINO AQUI' AS mensaje;







-- importacion de registros de la tabla "factura_paciente"
-- importacion de registros de la tabla "factura_paciente"
LOAD    DATA LOCAL INFILE './data_csv/factura_paciente.csv'
        INTO TABLE factura_paciente
            FIELDS TERMINATED   BY ',' ENCLOSED BY '"'
            LINES TERMINATED    BY '\n'
            IGNORE 1 LINES
            (id_tratamiento, id_paciente, cuota, mes_facturado);

SELECT 'LA IMPORTACION DE factura_paciente.csv TERMINO AQUI' AS mensaje;


SHOW WARNINGS;


-- Script para capturar errores
-- Script para capturar errores