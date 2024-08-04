CREATE USER 'administrador1'@'%' IDENTIFIED BY 'admin123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

CREATE USER 'administrador2'@'%' IDENTIFIED BY 'admin123'
PASSWORD EXPIRE INTERVAL 30 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

GRANT SELECT ON centro_medico.* TO 'administrador1'@'%', 'administrador2'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE ON centro_medico.honorario_facturas TO 'administrador1'@'%', 'administrador2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON centro_medico.factura_medico TO 'administrador1'@'%', 'administrador2'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON centro_medico.factura_paciente TO 'administrador1'@'%', 'administrador2'@'%';