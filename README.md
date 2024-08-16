# Proyecto Final SQL - Coderhouse

Alumno: [Gabriel Toloza](https://www.linkedin.com/in/gabrieltoloza-software-developer/)

Comision: 57190

Tutor: Leonel Lo Presto

Profesor: Anderson Michel Torres

___

### Introducción: Descripción de la tematica de la base de datos

> La temática esta inspirada en un Centro de Salud Mental Integral cuyo nombre es "Centro Medico Lorena". El método y regla utilizado es por dos equipos de trabajo (área administrativa, y área de facturaciones), se le asignan diferentes permisos de manipulacion para gestionar a los pacientes que ingresan bajo determinado tratamientos.
___

### Objetivo:

> Diseñar una base de datos relacional que contemple las necesidades del centro médico para una mejor manipulacion de datos a la hora de administrar pacientes, medicos y empleados. La DB sera optima, escalable y de facil mantención, pudiendo asi generar altas, bajas de las diferentes entidades y facturaciones a los mismos. 
___

### Situación Problemática:

> Como prioridad de la empresa hay que crear una base de datos que sea eficiente para cuidar la integridad de los datos y la facilidad de asignar diferentes operaciones a las distintas areas (operativa, administración). La base de datos debera brindar de forma agil la informacion que haya sido generada.
___

### Descripción del problema:

1. Gestionar Area operativa(empleados, obra social, facturacion): 

* Es necesario que se pueda identificar los empleados a los que se les asignan diferntes tareas y asi poder tener un filtrado limpio de las responsabilidades y generar facturaciones prolijas y transparentes.

2. Gestionar Area administrativa(pacientes, medicos, obra sociale, tratamientos, facturas, etc):

* Es importante que sea facil administrar esta área ya que sera vital para el centro medico poder tener un control total y de facil acceso a las consultas e ingreso de nuevas entidades. 
___

### Resolución del problema:

> El problema planteado logra resolverse con la implementacion de una base de datos relacional hecha en MySQL que divide las prioridades en 3 sectores, área operativa, área profesional y área propietaria. Pudiendo asi crear 3 roles con sus respectivos permisos, cada rol tendra permisos selectivos y ninguno podra manipular el area del otro, lo unico que compartiran sera el permiso SELECT para poder ver y realizar peticiones a otra area si es necesario mejorando asi la comunicacion. El rol propietario solo tendra permisos de lectura y tendra una interfaz aparte. 
___



# Centro Medico Lorena

![Centro Medico - Salud Mental Integral - Lorena ](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/centro_medico_lorena.png)

___

### Diagrama Excalidraw

![Centro Medico - Saludo Mental - Excalidraw](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/DER-Centro_Medico-Excalidraw.png)

___

### Diagrama DER DBeaver
![Centro Medico - Saludo Mental](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/centro_medico-DER.png)




## Listado de tablas y descripcion

| Tabla         | Columna           | Tipo de Datos                         |
| ------------- | ----------------- |  -----------------------------------  | 
| DUEÑOS        | ID_DUEÑO          | INT AUTO_INCREMENT NOT NULL           |
|               | NOMBRE_DUEÑO      | VARCHAR(255) NOT NULL                 |
|               | APELLIDO_DUEÑO    | VARCHAR(255) NOT NULL                 |
|               | DNI_DUEÑO         | BIGINT UNIQUE NOT NULL                |
|               | DOMICILIO         | VARCHAR(255) NOT NULL                 |
|               | TELEFONO          | BIGINT UNIQUE NOT NULL                |

> -

| Tabla         | Columna           | Tipo de Datos                         |
| --- | ---- |                 ---                  |
| EMPLEADOS     | ID_EMPLEADO       | INT AUTO_INCREMENT NOT NULL           |
|               | ID_CENTRO_MEDICO  | INT NOT NULL                          |
|               | NOMBRE_EMPLEADO   | VARCHAR(255) NOT NULL                 |
|               | APELLIDO_EMPLEADO | VARCHAR(255) NOT NULL                 |
|               | DNI_EMPLEADO      | BIGINT UNIQUE NOT NULL                |
|               | DOMICILIO         | VARCHAR(255) NOT NULL                 |
|               | TELEFONO          | BIGINT UNIQUE NOT NULL                |
|               | FECHA_ALTA        | DATE                                  |


| Tabla         | Columna            | Tipo de Datos                         |
| ---- | ---- |                     ----              |
| PUESTOS       | ID_PUESTO          | INT AUTO_INCREMENT NOT NULL           |
|               | NOMBRE_PUESTO      | VARCHAR(255) NOT NULL                 |
|               | HONORARIO_MENSUAL  | VARCHAR(255) NOT NULL                 |
|               | DESCRIPCION_PUESTO | BIGINT UNIQUE NOT NULL                |

### Tabla intermedia entre entidad Empleados/Puestos

| Tabla             | Columna            | Tipo de Datos                |
| ---- | ---- |                      ---- |
| EMPLEADOS_PUESTOS | ID_EMPLEADO        | INT NOT NULL                 |
|                   | ID_PUESTO          | INT NOT NULL                 |


> -

| Tabla         | Columna            | Tipo de Datos                         |
| ---- | ---- |                              ---- |
| OBRA          | ID_OS_EMPLEADO     | INT AUTO_INCREMENT NOT NULL           |
| SOCIAL        | ID_EMPELADO        | INT NOT NULL                          |
| EMPLEADOS     | NOMBRE_OB_EMPLEADO | VARCHAR(255) NOT NULL                 |
|               | CARNET_NUMERO      | BIGINT UNIQUE NOT NULL                |
|               | FECHA_ALTA         | DATE                                  |



| Tabla         | Columna           | Tipo de Datos                         |
| ---- | ---- |                        ---- |
| HONORARIO     | ID_HONORARIO      | INT AUTO_INCREMENT NOT NULL           |
| FACTURAS      | ID_EMPLEADO       | INT NOT NULL                          |
|               | MES_FACTURADO     | DATE                                  |



| Tabla         | Columna           | Tipo de Datos                         |
| ---- | ---- |                               ---- |
| PACIENTES     | ID_PACIENTE       | INT AUTO_INCREMENT NOT NULL           |
|               | ID_CENTRO_MEDICO  | INT NOT NULL                          |
|               | NOMBRE_PACIENTE   | VARCHAR(255) NOT NULL                 |
|               | APELLIDO          | VARCHAR(255) NOT NULL                 |
|               | DNI               | BIGINT UNIQUE NOT NULL                |
|               | FECHA_ALTA        | DATE                                  |
|               | ESTADO            | BOOLEAN DEFAULT FALSE                 |
|               | TIENE_OSOCIAL     | BOOLEAN DEFAULT FALSE                 |


| Tabla         | Columna           | Tipo de Datos                         |
| ----- | ----- |                           ---- |
| OBRA          | ID_OS_PACIENTES   | INT AUTO_INCREMENT NOT NULL           |
| SOCIAL        | ID_PACIENTE       | INT NOT NULL                 |
| PACIENTES     | NOMBRE_OSOCIAL    | VARCHAR(255) NOT NULL                 |
|               | CARNET_NUMERO     | BIGINT UNIQUE NOT NULL                |

> -

| Tabla         | Columna           | Tipo de Datos                         |
| ----- | ---- |                           ---- |
| MEDICOS       | ID_MEDICO         | INT AUTO_INCREMENT NOT NULL           |
|               | ID_CENTRO_MEDICO  | INT NOT NULL                          |
|               | NOMBRE_MEDICO     | VARCHAR(255) NOT NULL                 |
|               | APELLIDO_MEDICO   | VARCHAR(255) NOT NULL                 |
|               | CUIT              | BIGINT UNIQUE NOT NULL                |
|               | EMAIL             | VARCHAR(255) NOT NULL                 |
|               | ESTADO            | BOOLEAN DEFAULT FALSE                 |
|               | FECHA_ALTA        | DATE                                  |



| Tabla         | Columna           | Tipo de Datos                         |
| ----- | ----- |                          ---- |
| PROFESIONES   | ID_PROFESION      | INT AUTO_INCREMENT NOT NULL           |
|               | NOMBRE_PROFESION  | VARCHAR(255) NOT NULL                 |

### Tabla intermedia entre la entidad Medicos/Profesiones

| Tabla         | Columna           | Tipo de Datos                         |
| ----- | ----- |                      ---- |
| PROFESIONES   | ID_PROFESION      | INT NOT NULL                          |
| MEDICOS       | ID_MEDICO         | INT NOT NULL                          |

> -

| Tabla         | Columna           | Tipo de Datos                         |
| ----- | ----- |                      ---- |
| MATRICULAS    | ID_MATRICULA      | INT AUTO_INCREMENT NOT NULL           |
|               | ID_MEDICO         | INT NOT NULL                          |
|               | NUMERO_MATRICULA  | BIGINT UNIQUE NOT NULL                |
|               | FECHA_EMITIDA     | DATE                                  |



| Tabla         | Columna           | Tipo de Datos                         |
| ----- | ----- |                         ---- |
| R.U.P         | ID_REGISTRO       | INT AUTO_INCREMENT NOT NULL           |
| REGISTRO      | ID_MATRICULA      | VARCHAR(255) NOT NULL                 |
| MATRICULAS    | FECHA_ALTA        | DATE                                  |




| Tabla         | Columna           | Tipo de Datos                         |
| ----- | ------ |                              ---- |
| TRATAMIENTOS  | ID_TRATAMIENTO    | INT AUTO_INCREMENT NOT NULL           |
|               | ID_CENTRO_MEDICO  | INT NOT NULL                          |
|               | ID_MEDICO         | INT NOT NULL                          |
|               | ID_PACIENTE       | INT NOT NULL                          |
|               | DESCRIPCION       | TEXT                                  |
|               | FECHA_INICIO      | DATE                                  |
|               | FECHA_FIN         | DATE                                  |



| Tabla         | Columna           | Tipo                                  |
| ---- |            ----        |         ----    |
| FACTURA       | ID_FAC_PACIENTE   | INT AUTO_INCREMENT NOT NULL           |
| PACIENTE      | ID_TRATAMIENTO    | INT NOT NULL                          |
|               | ID_PACIENTE       | INT NOT NULL                          |
|               | CUOTA             | DECIMAL(12,2) NOT NULL                |
|               | MES_FACTURADO     | DATE                                  |




| Tabla         | Columna           | Tipo de Datos                         |
| ---- | ------ |                    ----            |
| FACTURA       | ID_FAC_MEDICO     | INT AUTO_INCREMENT NOT NULL           |
| MEDICO        | ID_MEDICO(fk)     | INT NOT NULL                          |
|               | ID_TRATAMIENTO    | INT NOT NULL                          |
|               | HORAS_TRABAJADAS  | INT NOT NULL                          |
|               | MONTO             | DECIMAL(12,2) NOT NULL                |
|               | MES_FACTURADO     | DATE                                  |



> -





## Guia para levantar la base de datos:


### 1 - Primer paso
<table>
    <tr><td>
        Una vez tenga el respositorio debera hacer click en la seccion " < > Code " de 
        Github. Luego hacer click en "Create codespace on main".
    </td></tr>
</table>


![Centro Medico - Saludo Mental](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/1er_paso_Guia.png)


### 2 - Segundo paso
<table>
    <tr><td>
        Dejamos cargar el sitio una vez este listo hacemos click abajo a la izquierda
        Justo en la esquina
    </td></tr>
</table>


![Centro Medico - Saludo Mental](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/Guia-2-paso.png)



### 3 - Tercer paso
<table>
    <tr><td>
        Luego hacemos click la opcion " Open in VS Code Desktop ..." y confirmamos los permisos.
    </td></tr>
</table>

![Centro Medico - Saludo Mental](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/Guia-paso-3.png)


### 4 - Cuarto paso 
<table>
    <tr><td>
        Una vez tengamos configurado el tunel, abrimos una terminal y procedemos a ejecutar el comando <b>"make"</b> en la consola.
        Demora unos segundos.
        Una vez terminado podemos testear la conexion con el comando <b>"make test-db"</b>, esto devolvera las tablas y objetos de la base de datos.
        Tambien podemos usar <b>"make access-db"</b> para ingresar a la terminal de la base de datos. Para cerrar la conexion podemos ejecutar <b>"make down"</b>, comando que borrara la base de datos y cerrara el contenedor.
    </td></tr>
</table>


# Objetos de la base de datos #
>
>
>
## Vistas: 
> 
> * "view_duenos_centros_medicos"
```sql
    SELECT 
        *
    FROM centro_medico.view_duenos_centros_medicos;
```
>
>
>Esta vista devolvera a los duenos de los centros medicos.
>No es relevante pero de alguna manera si alguien lo necesitara estaria disponible para ciertos usuarios. 
> Puede filtrarse por centro medico.
>
> #### Tablas involucradas:
>                      * duenos
>                      * centros_medicos
>
>
>
___

> 
> * "view_show_empleados_all_data"
```sql
    SELECT 
        *
    FROM centro_medico.view_show_empleados_all_data;
```
>
>
> Esta vista devolvera todos los datos relevantes para mostrar los empleados en el area operativa. Puede filtrarse por centro medico.
> 
> #### Tablas involucradas:
>                       * puestos
>                       * empleados_puestos
>                       * empleados
>                       * obra_social_empleados
>                       * centros_medicos
___


> * "view_show_empleados_facturaciones"
```sql
    SELECT 
        *
    FROM centro_medico.view_show_empleados_facturaciones;
```
>
>
>
>Esta vista devolvera todos los
>empleados y sus facturaciones.
> Servira para controlar la facturacion de los mismos. Se consumiria desde un backend para mostrar los datos en la app del centro_medico
>
> #### Tablas involucradas:
>                         * honorario_facturas
>                         * empleados
>                         * empleados_puestos
>                         * puestos
___


> * "view_show_empleados_obras_sociales"
```sql
    SELECT 
    *
    FROM centro_medico.view_show_empleados_obras_sociales;
```
>
>
>
>Esta vista devolvera a los empleados, con todos los detalles de la obra social.
>Se puede filtrar por nombre o por dni.
>Recomendacion:
>     Filtrar usando dni
>
> #### Tablas involucradas:
>                       * empleados
>                       * obra_social_empleados
___


> * "view_show_pacientes_obra_social"
```sql
    SELECT 
        *
    FROM centro_medico.view_show_pacientes_obra_social;
```
>
>
>
> Esta vista devuelve a los pacientes con sus obras sociales.
> Esta vista servira para devolver y un backend pueda mutar la respuesta en un array de pacientes a la app que lo consuma. 

> #### Tablas ivolucradas:
>                       * pacientes
>                       * obra_social_pacientes
___


> * "view_show_tratamientos_main"
```sql
    SELECT 
        *
    FROM centro_medico.view_show_tratamientos_main;
```
>
>
>
>Esta vista muestra los tratamientos con su paciente y medico respectivo.
>Tambien se puede filtrar por centro_medico.
>Esto sera consumido por una app
>de gestion del centro medico.

> #### Tablas involucradas:
>                       * obra_social_pacientes
>                       * pacientes
>                       * tratamientos
>                       * medicos
>                       * profesion_medicos
>                       * profesiones
___


> * "view_show_medicos_full_data"
```sql
    SELECT 
        *
    FROM centro_medico.view_show_medicos_full_data;
```
>
>
>
>Esta vista muestra todos los datos de los medicos. Sirve para un detalle de cada medico. En un futuro puede produndizarse.

> #### Tablas involucradas:
>                       * medicos
>                       * profesion_medicos
>                       * profesiones
>                       * matriculas
>                       * RUP_registro_matriculas
___


> * "view_facturacion_tratamiento_medico"
```sql
    SELECT 
        *
    FROM centro_medico.view_facturacion_medico_tratamiento;
```
>
>
>
>Esta vista muestra detalles de la facturacion del medico de cada tratamiento. Esto sera consumido por la app para mostrar datos que deban usarse como facturacion real
>o llevar un control de ello.

> #### Tablas involucradas:
>                       * profesiones
>                       * profesion_medicos
>                       * medicos
>                       * tratamientos
>                       * factura_medico
___


> * "view_facturacion_tratamiento_paciente"
```sql
    SELECT 
    *
    FROM centro_medico.view_facturacion_tratamiento_paciente;
```
>
>
>
> Esta vista muestra detalles de la facturacion del paciente de cada tratamiento. Esto sera consumido por la app para mostrar datos que deban usarse como facturacion real
>o llevar un control de ello.

> #### Tablas involucradas: 
>                       * obra_social_pacientes
>                       * pacientes
>                       * tratamientos
>                       * factura_medico
___


## Funciones:

> * "sumar_IVA_21()"
```sql
    sumar_IVA_21(FLOAT)
```
>
>
>Funcion que devuelva el honorario de los medicos con IVA, la funcion seria aplicar el IVA a el campo seleccionado. (valor x 1,21 (21% impuesto)) <--Version corta
>                              (valor x "porcentaje a sumar" / 100 ) <--version larga
>
>Esta funcion servirá a la hora de pagar algun salario a monostributistas o al gestionar algun costo/gasto que tenga que ver con insumos.

___

> * "CAPITALIZE()"
```sql
    CAPITALIZE(VARCHAR)
```
>Funcion que devuelva el primer caracter en mayusculas siempre. ( Capitalize). Servira para que no haya problemas de keysensitive si es que necesitamos que el primer caracter este en mayusculas. Pocos casos de usos.

___

> * "ACTIVE_INACTIVE()"
```sql
    ACTIVE_INACTIVE(BOOLEAN)
```
>
>
>Funcion para dar alta o baja a un booleano. Servira para cambiar el campo "estado" de activo/inactivo

___

> * "DISCOUNT_OS()"
```sql
    DISCOUNT_OS(VARCHAR) 
```
>
>
>Funcion para aplicar descuento a una facturacion de servicio segun obra social. Esto se usara en facturacion de pacientes para aplicar descuento segun obra social. Recibe como parametro la obra social. Dentro de su cuerpo estan definidas las obras sociales permitidas. Esto puede optimizarse en un futuro.
___

> * "CHECK_OS()"
```sql
    CHECK_OS(VARCHAR) 
```
>
>
>Funcion para checkear que la obra social ingresada exista al momento de registrar un empleado. Podria otros casos de uso. Devuelve un booleano, si se encuentra dentro de las obras sociales para empleados arroja 'True(1)', sino arroja 'False(0)'. Si la cantidad de obra sociales crece se deberia crear una nueva tabla.
___

## Procedimientos:

> * "alta_paciente"
```sql
    CALL centro_medico.alta_paciente (3, 'Rosalia', 'Verdebuena', 30551597, '2024-07-28', 0, 'VITAL', 745159);
```
>Procedimiento que se encarga de registrar un nuevo paciente deben indicarse 8 (ocho) argumentos que corresponden a los campos:

>           * id_centro_medico
>           * nombre
>           * apellido
>           * documento
>           * fecha_alta('YYYY-MM-DD')
>           * estado(boolean)
>           * nombre_obra_social(si el paciente no tiene se ingresa '')
>           * numero_carnet(si el paciente no tiene se ingresa 0)

>Si los dos ultimos argumentos se ingresan en vacio y 0 solamente se crea el registro del paciente con un boleano en falso que indica que no tiene obra social. Si los dos ultimos argumentos tienen informacion se crea el registro pacientes y tambien se crea un registro vinculando el id del paciente y los datos del nombre y carnet de obra social en la tabla obra_social_paciente.

> ##### ¡ IMPORTANTE !
> Ejemplo paciente <b>sin</b> obra social:
```sql
-- Ingresamos el campo obra social vacio '' y el campo numero carnet en 0:
CALL centro_medico.alta_paciente (1, 'Julia', 'Gomez', 30123777, '2024-07-28', 0, '', 0);
```
> Ejemplo paciente <b>con</b> obra social:
```sql
-- Ingresamos el registro como el ejemplo anterior pero esta vez con obra social y numero carnet
CALL centro_medico.alta_paciente (3, 'Rosalia', 'Verdebuena', 30551597, '2024-07-28', 0, 'VITAL', 745159);
```

___

> * "alta_medico"
```sql
    CALL centro_medico.alta_medico( 3, 'Julieta', 'Ruiz', 25141547444, 'JulietaRuiz@gmail.com', 0, DATE(CURRENT_DATE), 'Psicologia', 44785450);
```

>Procedimiento que se encarga de registrar un nuevo medico, vincularlo a una profesion existente de la base de datos y a su vez registrar su matricula en la tabla matriculas. El procedimiento tiene 9 (nueve) parametros que corresponden a los campos:

>           * id_centro_medico
>           * nombre
>           * apellido
>           * cuit
>           * email
>           * status(boolean)
>           * fecha_ingresado('YYYY-MM-DD')
>           * profesion
>           * numero_matricula

>Este procedimiento actua sobre la tabla medicos, profesion_medicos y matriculas. Si sale todo ok. Esto dispara un trigger que registra esta matricula en la tabla RUP que seria el validador de las matriculas.
___

> * "alta_tratamiento"
```sql
    CALL centro_medico.alta_tratamiento(1, 64, 128, 'Esto es una descripcion para el tratamiento. ', '2024-07-29', NULL );
```
> ##### ¡ IMPORTANTE !
> Si el campo de fecha_fin esta definido debe colocarlo, si no tiene fecha de finalizacion todavia, debe ingresar manualmente "NULL" como en el ejemplo anterior.

> Este procedimiento se encarga de registrar un nuevo tratamiento. Recibe 6 (seis) parametros que corresponden a los campos:

>           * id_centro_medico
>           * id_medico
>           * id_paciente
>           * detalle
>           * fecha_inicio
>           * fehca_fin(si no finalizo se ingresa null manualmente)

>Este proceso involucra a la tabla Tratamientos, Medicos, Pacientes.

>Este proceso al finalizar dispara un trigger que se encargara de actualizar el estado del paciente y medico involucrado a "En tratamiento".

___


> * "terminar_tratamiento"
```sql
   CALL centro_medico.terminar_tratamiento(64,128);
```

>Este procedimiento se encargara de terminar un tratamiento, poniendole fecha al campo "fecha_fin" y actualiza el estado del medico y del paciente de, true/Activo a false/Inactivo. Recibe 2 argumentos:

>           * id_medico
>           * id_paciente

>En este procedimiento se involucra la tabla "tratamientos", "medicos" y "pacientes".

___

> * "generar_factura_medico"
```sql
   CALL centro_medico.generar_factura_medico( 64, 128, 64, 360000.00, '2024-07-30');
```

>Este procedimiento se encarga de generar una nueva factura mensual indicando el id_medico del medico y el id_tratamiento de donde trabaja. Recibe 5 argumento:

>           * id_medico
>           * id_tratamiento
>           * horas_trabajadas
>           * monto_pagado
>           * mes_facturado

>Este proceso no involucra ninguna tabla, solo hace consultas a la tabla "Tratamientos y Medicos" para chekear si los identificadores que se pasan como argumento son reales.
___

> * "generar_factura_paciente"
```sql
   CALL centro_medico.generar_factura_paciente( 128, 128 , 380000.00, '2024-07-30');
```

>Este procedimiento se encarga de generar una nueva factura mensual indicando el id_paciente y el id_tratamiento de donde esta siendo tratado. Recibe 4 argumentos:

>               * id_tratamiento
>               * id_paciente
>               * cuota_mensual
>               * factura_mes

>Este proceso no involucra ninguna tabla, solo hace consultas a la tabla "Tratamientos y Pacientes" para chekear si los identificadores que se pasan como argumento son reales.

>Si el paciente tiene obra social, tendra un descuento segun las que esten registradas en el centro medico. Este descuento se aplica, o no, justo antes de la sentencia insert dentro del procedimiento. Si logra aplicar el descuento. Se crea un registro en una tabla auditora llamada auditoria_trigger. Si no, se registra tal cual se ingresa como parametro al procedimiento.
___

> * "alta_empleado"
```sql
    -- Caso de uso correcto
    CALL centro_medico.alta_empleado(2, 'Hernan', 'Vera', 35456852, 'Av. Etcheverry 4574', 1150177897, '2024-11-25', 'mantenimiento', 'UOCRA', 1474456, '2024-11-15');
```

>Procedimiento que se encarga de registrar un nuevo empleado deben indicarse 11 (once) argumentos que corresponden a los campos:

>               * id_centro_medico
>               * empleado_mombre
>               * empleado_apellido
>               * empleado_dni
>               * empleado_domicilio
>               * empleado_telefono
>               * empleado_fecha_alta
>               * empleado_puesto
>               * obra_social
>               * numero_carmet
>               * alta_obra_social

>Este procedimiento tiene TCL, si algo arroja una excepcion hara un rollback mostrando un msj personalizado por cada error.
___

> * "nueva_factura_empleados"
```sql
    -- Caso de uso
    CALL centro_medico.nueva_factura_empleados(3, '2024-08-13');
```

>Procedimiento que se encarga de registrar una nueva factura, deben indicarse 2 (dos) argumentos que corresponden a los campos:

>               * id_empleado
>               * fecha_registrada

>Este proceso no involucra ninguna tabla, solo hace consultas a la tabla "Empleados" para chekear si el identificador que se pasa como argumento es real.

## TRIGGERS

> * "insertar_RUP_matricula"

>Este trigger se encarga de registrar la nueva matricula de un medico en la tabla " RUP_registro_,matriculas" esta tabla simula un registro que validaria la existencia de las matriculas de los medicos.
>Actua sobre la tabla ---> "matriculas"
___

> * "alta_tratamiento_controller"

>Este trigger controla actualiza el estado del paciente y medico, de false a true, que se registraron en el momento que se ejecuta el alta del tratamiento. 
>Actua sobre la tabla ---> "tratamientos". 
>Este estado indica si esta inactivo o en tratamiento cualquiera de las dos entidades.
___

> * "alta_paciente_controller"

>Este trigger crea un registro para controlar las inserciones en la tabla "pacientes". 
>Se crea un registro en la tabla "alta_paciente_control".
___

> * "alta_paciente_controller_OS"

>Este trigger controla la obra social de los pacientes en la tabla auditora, si el nuevo registro en "obra_social_pacientes" se encuentra
>en la tabla auditora esta actualiza el campo obra_social del mismo id correspondiente.
___

> * "alta_medico_controller"

>Este trigger inserta los datos relevantes del registro creado , medico, y lo inserta en la tabla auditora de medicos "alta_medico_control"
___

> * "alta_medico_controller_matricula"

>Este trigger se encarga de vincular la matricula del medico recien creado o matricula insertada, y lo registra en la tabla auditoria de medicos "alta_medico_control"
___

> * "alta_medico_controller_profesion"

>Este trigger se encarga de vincular la profesion a la tabla auditoria de medicos "alta_medico_control".
>Busca la profesion y actualiza el registro.
