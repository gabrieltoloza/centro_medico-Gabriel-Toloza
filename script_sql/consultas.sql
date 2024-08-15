USE centro_medico;




-- Tablas y descripciones:
-- Tablas y descripciones:
-- Tablas y descripciones:
SELECT 
    TABLE_NAME, 
    TABLE_COMMENT
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_SCHEMA = 'centro_medico';


-- Verificacion de importacion
SELECT 
    *
FROM centro_medico.verificacion_importacion_csv;


-- VERIFICACION DE VISTAS
SELECT 
    TABLE_NAME AS `Vista`,
    TABLE_TYPE AS `Tipo`
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_SCHEMA = 'centro_medico' 
    AND TABLE_TYPE = 'VIEW'
ORDER BY 
    TABLE_NAME;

-- VERIFICACION DE FUNCIONES
SELECT 
    ROUTINE_NAME AS `Funcion`,
    DATA_TYPE AS `Tipo de Retorno`
FROM 
    INFORMATION_SCHEMA.ROUTINES
WHERE 
    ROUTINE_SCHEMA = 'centro_medico' 
    AND ROUTINE_TYPE = 'FUNCTION'
ORDER BY 
    ROUTINE_NAME;

-- VERIFICACION DE PROCEDURES

SELECT 
    ROUTINE_NAME AS `Procedimiento`,
    ROUTINE_TYPE AS `Tipo`
FROM 
    INFORMATION_SCHEMA.ROUTINES
WHERE 
    ROUTINE_SCHEMA = 'centro_medico' 
    AND ROUTINE_TYPE = 'PROCEDURE'
ORDER BY 
    ROUTINE_NAME;

-- VERIFICACION DE TRIGGERS

SELECT 
    TRIGGER_NAME AS `Nombre del Trigger`,
    EVENT_MANIPULATION AS `Evento`,
    EVENT_OBJECT_TABLE AS `Tabla`,
    ACTION_TIMING AS `Momento`
FROM 
    INFORMATION_SCHEMA.TRIGGERS
WHERE 
    TRIGGER_SCHEMA = 'centro_medico'
ORDER BY 
    EVENT_OBJECT_TABLE, 
    ACTION_TIMING, 
    EVENT_MANIPULATION;


-- VERIFICANDO USUARIOS Y ROLES:
SELECT
    FROM_USER AS roles, 
    '   --->' AS otorgado_a, 
    TO_USER AS usuarios 
FROM mysql.role_edges;