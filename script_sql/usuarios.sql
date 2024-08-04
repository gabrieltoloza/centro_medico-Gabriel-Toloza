DROP USER IF EXISTS 'contador1'@'%';
CREATE USER 'contador1'@'%' IDENTIFIED BY 'contador123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

DROP USER IF EXISTS 'contador2'@'%';
CREATE USER 'contador2'@'%' IDENTIFIED BY 'contador123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;


DROP USER IF EXISTS 'administrador1'@'%';
CREATE USER 'administrador1'@'%' IDENTIFIED BY 'admin123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

DROP USER IF EXISTS 'administrador2'@'%';
CREATE USER 'administrador2'@'%' IDENTIFIED BY 'admin123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

DROP USER IF EXISTS 'duenos'@'%';
CREATE USER 'duenos'@'%' IDENTIFIED BY 'duenos123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;


-- Permisos para SELECT los datos general.
GRANT SELECT ON centro_medico.* TO 'contador1'@'%', 'contador2'@'%', 'administrador1'@'%', 'administrador2'@'%', 'duenos'@'%';

-- Permisos para completar el crud de las tablas indicadas para los usuarios de "facturacion" :
GRANT INSERT, UPDATE, DELETE ON centro_medico.honorario_facturas TO 'contador1'@'%', 'contador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.factura_medico TO 'contador1'@'%', 'contador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.factura_paciente TO 'contador1'@'%', 'contador2'@'%';

-- Permisos para completar el crud de las tablas indicadas para los usuarios de "administracion" :
GRANT INSERT, UPDATE, DELETE ON centro_medico.RUP_registro_matriculas TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.empleados TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.empleados_puestos TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.matriculas TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.medicos TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.obra_social_empleados TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.obra_social_pacientes TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.pacientes TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.profesion_medicos TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.profesiones TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.puestos TO 'administrador1'@'%', 'administrador2'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.tratamientos TO 'administrador1'@'%', 'administrador2'@'%';

-- Permisos para el usuario "duenos" podra solo manipular estas 2 tablas:
GRANT INSERT, UPDATE, DELETE ON centro_medico.duenos TO 'duenos'@'%';
GRANT INSERT, UPDATE, DELETE ON centro_medico.centros_medicos TO 'duenos'@'%';


SELECT User, Host, Insert_priv, Update_priv, Select_priv, Delete_priv, Grant_priv, Super_priv, Create_user_priv, account_locked FROM mysql.user;