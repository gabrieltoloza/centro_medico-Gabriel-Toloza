# Centro Medico - Salud Mental // Gabriel Toloza

> Este proyecto se trata de un centro medico orientado a salud mental, se debe gestionar los servicios dados hacia pacientes ofreciendo profesionales(medicos) para cubrir necesidades. El diseño de la base de datos gestiona medicos con sus respectivas matriculas y profesion, pacientes con sus obras sociales y facturacion, tanto como para medicos en forma de salarios/honorarios y pacientes en forma de aranceles. 

> Ademas se gestiona las entidades para manejar los empleados, sus puestos y obra social correspondiente.


> -

![Centro Medico - Saludo Mental - Excalidraw](https://github.com/ToxicBlood2023/centro_medico-Gabriel-Toloza/blob/main/DER-Centro_Medico-Excalidraw.png)

> -

## Listado de tablas y descripcion

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| DUEÑOS        | ID_DUEÑO          | INT AUTO_INCREMENT NOT NULL           |
|               | NOMBRE_DUEÑO      | VARCHAR(255) NOT NULL                 |
|               | APELLIDO_DUEÑO    | VARCHAR(255) NOT NULL                 |
|               | DNI_DUEÑO         | BIGINT UNIQUE NOT NULL                |
|               | DOMICILIO         | VARCHAR(255) NOT NULL                 |
|               | TELEFONO          | BIGINT UNIQUE NOT NULL                |

> -

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| EMPLEADOS     | ID_EMPLEADO       | INT AUTO_INCREMENT NOT NULL           |
|               | NOMBRE_EMPLEADO   | VARCHAR(255) NOT NULL                 |
|               | APELLIDO_EMPLEADO | VARCHAR(255) NOT NULL                 |
|               | DNI_EMPLEADO      | BIGINT UNIQUE NOT NULL                |
|               | DOMICILIO         | VARCHAR(255) NOT NULL                 |
|               | TELEFONO          | BIGINT UNIQUE NOT NULL                |
|               | FECHA_ALTA        | DATE                                  |


| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| PUESTOS       | ID_PUESTO          | INT AUTO_INCREMENT NOT NULL           |
|               | NOMBRE_PUESTO      | VARCHAR(255) NOT NULL                 |
|               | HONORARIO_MENSUAL  | VARCHAR(255) NOT NULL                 |
|               | DESCRIPCION_PUESTO | BIGINT UNIQUE NOT NULL                |

### Tabla intermedia entre entidad Empleados/Puestos

| Tabla             | Columna            | Tipo de Datos                |
| ----------------- | ------------------ |                         ---: |
| EMPLEADOS_PUESTOS | ID_EMPLEADO        | INT NOT NULL                 |
|                   | ID_PUESTO          | INT NOT NULL                 |


> -

| Tabla         | Columna            | Tipo de Datos                         |
| ------------- | ------------------ |                                  ---: |
| OBRA          | ID_OS_EMPLEADO     | INT AUTO_INCREMENT NOT NULL           |
| SOCIAL        | ID_EMPELADO        | INT NOT NULL                          |
| EMPLEADOS     | NOMBRE_OB_EMPLEADO | VARCHAR(255) NOT NULL                 |
|               | CARNET_NUMERO      | BIGINT UNIQUE NOT NULL                |
|               | FECHA_ALTA         | DATE                                  |



| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| HONORARIO     | ID_HONORARIO      | INT AUTO_INCREMENT NOT NULL           |
| FACTURAS      | ID_EMPLEADO       | INT NOT NULL                          |
|               | MES_FACTURADO     | DATE                                  |



| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| PACIENTES     | ID_PACIENTE       | INT AUTO_INCREMENT NOT NULL           |
|               | NOMBRE_PACIENTE   | VARCHAR(255) NOT NULL                 |
|               | APELLIDO          | VARCHAR(255) NOT NULL                 |
|               | DNI               | BIGINT UNIQUE NOT NULL                |
|               | FECHA_ALTA        | DATE                                  |
|               | ESTADO            | BOOLEAN DEFAULT FALSE                 |
|               | TIENE_OSOCIAL     | BOOLEAN DEFAULT FALSE                 |


| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| OBRA          | ID_OS_PACIENTES   | INT AUTO_INCREMENT NOT NULL           |
| SOCIAL        | ID_PACIENTE       | INT NOT NULL                 |
| PACIENTES     | NOMBRE_OSOCIAL    | VARCHAR(255) NOT NULL                 |
|               | CARNET_NUMERO     | BIGINT UNIQUE NOT NULL                |

> -

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| MEDICOS       | ID_MEDICO         | INT AUTO_INCREMENT NOT NULL           |
|               | NOMBRE_MEDICO     | VARCHAR(255) NOT NULL                 |
|               | APELLIDO_MEDICO   | VARCHAR(255) NOT NULL                 |
|               | CUIT              | BIGINT UNIQUE NOT NULL                |
|               | EMAIL             | VARCHAR(255) NOT NULL                 |
|               | ESTADO            | BOOLEAN DEFAULT FALSE                 |
|               | FECHA_ALTA        | DATE                                  |



| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| PROFESIONES   | ID_PROFESION      | INT AUTO_INCREMENT NOT NULL           |
|               | NOMBRE_PROFESION  | VARCHAR(255) NOT NULL                 |

### Tabla intermedia entre la entidad Medicos/Profesiones

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| PROFESIONES   | ID_PROFESION      | INT NOT NULL                          |
| MEDICOS       | ID_MEDICO         | INT NOT NULL                          |

> -

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| MATRICULAS    | ID_MATRICULA      | INT AUTO_INCREMENT NOT NULL           |
|               | ID_MEDICO         | INT NOT NULL                          |
|               | NUMERO_MATRICULA  | BIGINT UNIQUE NOT NULL                |
|               | FECHA_EMITIDA     | DATE                                  |



| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| R.U.P         | ID_REGISTRO       | INT AUTO_INCREMENT NOT NULL           |
| REGISTRO      | ID_MATRICULA      | VARCHAR(255) NOT NULL                 |
| MATRICULAS    | FECHA_ALTA        | DATE                                  |




| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| TRATAMIENTOS  | ID_TRATAMIENTO    | INT AUTO_INCREMENT NOT NULL           |
|               | ID_MEDICO         | INT NOT NULL                          |
|               | ID_PACIENTE       | INT NOT NULL                          |
|               | DESCRIPCION       | TEXT                                  |
|               | FECHA_INICIO      | DATE                                  |
|               | FECHA_FIN         | DATE                                  |



| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| FACTURA       | ID_FAC_PACIENTE   | INT AUTO_INCREMENT NOT NULL           |
| PACIENTE      | ID_TRATAMIENTO    | INT NOT NULL                          |
|               | ID_PACIENTE       | INT NOT NULL                          |
|               | CUOTA             | DECIMAL(12,2) NOT NULL                |
|               | MES_FACTURADO     | DATE                                  |




| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |                                  ---: |
| FACTURA       | ID_FAC_MEDICO     | INT AUTO_INCREMENT NOT NULL           |
| MEDICO        | ID_MEDICO(fk)     | INT NOT NULL                          |
|               | ID_TRATAMIENTO    | INT NOT NULL                          |
|               | HORAS_TRABAJADAS  | INT NOT NULL                          |
|               | MONTO             | DECIMAL(12,2) NOT NULL                |
|               | MES_FACTURADO     | DATE                                  |



> -


![Centro Medico - Saludo Mental](https://github.com/ToxicBlood2023/centro_medico-Gabriel-Toloza/blob/main/DER-Centro_Medico-DBeaver.png)