USE centro_medico;

-- Creacion de roles:
DROP ROLE IF EXISTS	administracion, facturaciones, propietario;
CREATE ROLE administracion, facturaciones, propietario;


-- Permisos para poder ver toda la base de datos para los 3 roles:
GRANT SELECT ON centro_medico.* TO administracion, facturaciones, propietario;


-- Permisos para completar el crud de las tablas indicadas para los roles de "facturacion" :
GRANT INSERT, UPDATE, DELETE ON centro_medico.honorario_facturas TO facturaciones;
GRANT INSERT, UPDATE, DELETE ON centro_medico.factura_medico TO facturaciones;
GRANT INSERT, UPDATE, DELETE ON centro_medico.factura_paciente TO facturaciones;


-- Permisos para completar el crud de las tablas indicadas para los roles de "administracion" :
GRANT INSERT, UPDATE, DELETE ON centro_medico.RUP_registro_matriculas TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.empleados TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.empleados_puestos TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.matriculas TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.medicos TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.obra_social_empleados TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.obra_social_pacientes TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.pacientes TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.profesion_medicos TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.profesiones TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.puestos TO administracion;
GRANT INSERT, UPDATE, DELETE ON centro_medico.tratamientos TO administracion;

-- Creacion de usuarios contador:
DROP USER IF EXISTS 'contador1'@'%';
CREATE USER 'contador1'@'%' IDENTIFIED BY 'contador123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

DROP USER IF EXISTS 'contador2'@'%';
CREATE USER 'contador2'@'%' IDENTIFIED BY 'contador123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

-- Creacion de usuarios administracion:
DROP USER IF EXISTS 'administrador1'@'%';
CREATE USER 'administrador1'@'%' IDENTIFIED BY 'admin123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

DROP USER IF EXISTS 'administrador2'@'%';
CREATE USER 'administrador2'@'%' IDENTIFIED BY 'admin123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

-- Creacion de usuario duenos:
DROP USER IF EXISTS 'duenos'@'%';
CREATE USER 'duenos'@'%' IDENTIFIED BY 'duenos123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;


-- Otorgando roles a los usuarios de administracion: 
GRANT administracion TO 'administrador1'@'%', 'administrador2'@'%';


-- Otorgando roles a los usuarios de facturacion: 
GRANT facturaciones TO 'contador1'@'%', 'contador2'@'%';


-- Otorgando roles a los duenos:
GRANT propietario TO 'duenos'@'%';


-- Estableciento el rol por defecto: 
SET DEFAULT ROLE administracion TO 'administrador1'@'%', 'administrador2'@'%';
SET DEFAULT ROLE facturaciones TO 'contador1'@'%', 'contador2'@'%';
SET DEFAULT ROLE propietario TO 'duenos'@'%';



FLUSH PRIVILEGES ;