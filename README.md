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
## VISTAS: 
> 
> *   **_"view_duenos_centros_medicos"_**
```sql
    SELECT 
        *
    FROM centro_medico.view_duenos_centros_medicos;
```
>
>
>Esta vista devolvera a los duenos de los centros medicos.
>No es relevante pero de alguna manera si alguien lo necesitara estaria disponible para ciertos usuarios. 
> Puede filtrarse por sus campos.
* Ejemplo:
```sql
    SELECT 
        *
    FROM centro_medico.view_duenos_centros_medicos
    WHERE dni_dueno = 26458457;
```
* Esta compuesta por los siguientes campos:

            | CAMPOS          |
            | --------------- |
            | dueno           |
            | dni_dueno       |
            | telefono_dueno  |
            | centro_medico   |
            | domicilio_CM    |
            | email_CM        |
            | telefono_CM     |
            | ciudad          |
            | provincia       |
            | codigo_postal   |
            | sitio_web       |



> #### Tablas involucradas:
>                      * duenos
>                      * centros_medicos
>
>
>
_________________________________________________________________________
___

> 
> *   **_"view_show_empleados_all_data"_**

```sql
    SELECT 
        *
    FROM centro_medico.view_show_empleados_all_data;
```
>
>
> Esta vista devolvera todos los datos relevantes para mostrar los empleados en el area operativa. Puede filtrarse por sus campos.
* Ejemplo:
```sql
    SELECT 
        *
    FROM centro_medico.view_show_empleados_all_data
    WHERE alta_CM 
    BETWEEN '2023-05-01' AND '2023-06-01';
```
* Esta compuesta por los siguientes campos:

            |   CAMPOS           |
            | ------------------ |
            | id_centro_medico   |
            | empleado           |
            | dni_empleado       |
            | domicilio_empleado |
            | telefono_empleado  |
            | alta_CM            |
            | nombre_obra_social |
            | carnet_OS          |
            | alta_OS            |
            | puesto             |
            | salario_mensual    |
            | descripcion_puesto |

> 
> #### Tablas involucradas:
>                       * puestos
>                       * empleados_puestos
>                       * empleados
>                       * obra_social_empleados
>                       * centros_medicos
___
___


> *  **_"view_show_empleados_facturaciones"_**
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
> Servira para controlar la facturacion de los mismos. Se consumiria desde un backend para mostrar los datos en la app del centro_medico. Puede filtrarse por sus campos.
>
* Ejemplo:
```sql
    SELECT 
        *
    FROM centro_medico.view_show_empleados_facturaciones
    WHERE dni_empleado = 21593885;
```
* Esta compuesta por los siguientes campos:

            |   CAMPOS           |
            | ------------------ |
            | empleado           |
            | dni_empleado       |
            | domicilio_empleado |
            | mes_facturado      |
            | tarea              |
            | descripcion_puesto |
            | salario            |

> #### Tablas involucradas:
>                         * honorario_facturas
>                         * empleados
>                         * empleados_puestos
>                         * puestos
___
___


> *  **_"view_show_empleados_obras_sociales"_**
```sql
    SELECT 
    *
    FROM centro_medico.view_show_empleados_obras_sociales;
```
>
>
>
>Esta vista devolvera a los empleados, con todos los detalles de la obra social.
>Se puede filtrar por nombre o por dni. Puede filtrarse por sus campos.
* Ejemplo:
```sql
    SELECT 
    *
    FROM centro_medico.view_show_empleados_obras_sociales
    WHERE DNI = 45853395;
```
* Esta compuesta por los siguientes campos:

            |   CAMPOS           |
            | ------------------ |
            | id_centro_medico   |
            | empleado           |
            | DNI                |
            | telefono           |
            | OS                 |
            | carnet_OS          |
            | alta_OS            |
>
> #### Tablas involucradas:
>                       * empleados
>                       * obra_social_empleados
___
___


> *  **_"view_show_pacientes_obra_social"_**
```sql
    SELECT 
        *
    FROM centro_medico.view_show_pacientes_obra_social;
```
>
>
>
> Esta vista devuelve a los pacientes con sus obras sociales.
> Esta vista servira para devolver y un backend pueda mutar la respuesta en un array de pacientes a la app que lo consuma. Puede filtrarse por sus campos.
* Ejemplo:
```sql
    SELECT 
        *
    FROM centro_medico.view_show_pacientes_obra_social
    WHERE alta_CM 
    BETWEEN '2023-01-01' AND '2023-03-01';;
```
* Esta compuesta por los siguientes campos:

            |   CAMPOS                    |
            | --------------------------  |
            | paciente                    |
            | dni                         |
            | alta_CM                     |
            | actividad                   |
            | tiene_obra_social           |
            | nombre_obra_social_paciente |
            | carnet_numero               |

> #### Tablas ivolucradas:
>                       * pacientes
>                       * obra_social_pacientes
___
___


> *  **_"view_show_tratamientos_main"_**
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
>de gestion del centro medico. Puede filtrarse por sus campos.
* Ejemplo:
```sql
    SELECT 
        *
    FROM centro_medico.view_show_tratamientos_main
    WHERE area = 'psicologia';
```
* Esta compuesta por los siguientes campos:

            |   CAMPOS           |
            | ------------------ |
            | obra_social        |
            | carnet_OS          |
            | paciente           |
            | medico             |
            | area               |
            | descripcion        |
            | fecha_inicio       |
            | fecha_fin          |

> #### Tablas involucradas:
>                       * obra_social_pacientes
>                       * pacientes
>                       * tratamientos
>                       * medicos
>                       * profesion_medicos
>                       * profesiones
___
___


> *  **_"view_show_medicos_full_data"_**
```sql
    SELECT 
        *
    FROM centro_medico.view_show_medicos_full_data;
```
>
>
>
>Esta vista muestra todos los datos de los medicos. Sirve para un detalle de cada medico. En un futuro puede produndizarse. Puede filtrarse por sus campos.
* Ejemplo:
```sql
    SELECT 
        *
    FROM centro_medico.view_show_medicos_full_data
    WHERE numero_matricula = 45735192;
```
* Esta compuesta por los siguientes campos:

            |   CAMPOS           |
            | ------------------ |
            | medico             |
            | cuit               |
            | email              |
            | estado             |
            | profesion          |
            | numero_matricula   |
            | alta_matricula     |

> #### Tablas involucradas:
>                       * medicos
>                       * profesion_medicos
>                       * profesiones
>                       * matriculas
>                       * RUP_registro_matriculas
___
___


> *  **_"view_facturacion_tratamiento_medico"_**
```sql
    SELECT 
        *
    FROM centro_medico.view_facturacion_medico_tratamiento;
```
>
>
>
>Esta vista muestra detalles de la facturacion del medico de cada tratamiento. Esto sera consumido por la app para mostrar datos que deban usarse como facturacion real
>o llevar un control de ello. Puede filtrarse por sus campos.

* Ejemplo:
```sql
    SELECT 
        *
    FROM centro_medico.view_facturacion_medico_tratamiento
    WHERE fecha_facturacion 
    BETWEEN '2024-03-01' AND '2024-05-01';
```
* Esta compuesta por los siguientes campos:

            |   CAMPOS                   |
            | --------------------       |
            | medico                     |
            | email                      |
            | area                       |
            | id_tratamiento             |
            | descripcion                |
            | pago_por_tratamiento       |
            | horas_trabajadas_mensuales |
            | fecha_facturacion          |

> #### Tablas involucradas:
>                       * profesiones
>                       * profesion_medicos
>                       * medicos
>                       * tratamientos
>                       * factura_medico
___
___


> *  **_"view_facturacion_tratamiento_paciente"_**
```sql
    SELECT 
    *
    FROM centro_medico.view_facturacion_tratamiento_paciente;
```
>
>
>
> Esta vista muestra detalles de la facturacion del paciente de cada tratamiento. Esto sera consumido por la app para mostrar datos que deban usarse como facturacion real
>o llevar un control de ello. Puede filtrarse por campos.
* Ejemplo:
```sql
    SELECT 
    *
    FROM centro_medico.view_facturacion_tratamiento_paciente
    WHERE obra_social LIKE 'osde';
```
* Esta compuesta por los siguientes campos:

            |   CAMPOS                   |
            | --------------------       |
            | paciente                   |
            | tiene_obra_social          |
            | obra_social                |
            | carnet_numero              |
            | estado                     |
            | descripcion                |
            | cuota                      |
            | mes_facturado              |
            | fecha_fin                  |

> #### Tablas involucradas: 
>                       * obra_social_pacientes
>                       * pacientes
>                       * tratamientos
>                       * factura_medico
___


## FUNCIONES:

> * "sumar_IVA_21()"
```sql
    sumar_IVA_21(DECIMAL)
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
    DISCOUNT_OS(DECIMAL, VARCHAR) 
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
>Funcion para checkear que la obra social ingresada exista al momento de registrar un empleado. Podria tener otros casos de uso. Devuelve un booleano, si se encuentra dentro de las obras sociales para empleados arroja 'True(1)', sino arroja 'False(0)'. Si la cantidad de obra sociales crece se deberia crear una nueva tabla.
___

## PROCEDIMIENTOS ALMACENADOS:

> *  **_"alta_paciente"_**
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
___



> *  **_"alta_medico"_**
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

>Este procedimiento actua sobre la tabla medicos, profesion_medicos y matriculas. Si sale todo ok. Esto dispara un trigger que registra esta matricula en la tabla RUP que seria el validador de las matriculas. Este procedimiento tiene iun proceso TCL.

___
___


> *  **_"alta_tratamiento"_**
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
>           * fecha_fin(si no finalizo se ingresa null manualmente)

>Este proceso involucra a la tabla Tratamientos, Medicos, Pacientes.

>Este proceso al finalizar dispara un trigger que se encargara de actualizar el estado del paciente y medico involucrado a "En tratamiento".

___
___


> *  **_"terminar_tratamiento"_**
```sql
   CALL centro_medico.terminar_tratamiento(64,128);
```

>Este procedimiento se encargara de terminar un tratamiento, poniendole fecha al campo "fecha_fin" y actualiza el estado del medico y del paciente de, true/Activo a false/Inactivo. Recibe 2 argumentos:

>           * id_medico
>           * id_paciente

>En este procedimiento se involucra la tabla "tratamientos", "medicos" y "pacientes". Este procedimiento tiene un proceso TCL.

___
___


> *  **_"generar_factura_medico"_**
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
___

> *   **_"generar_factura_paciente"_**
```sql
   CALL centro_medico.generar_factura_paciente( 128, 128 , 380000.00, '2024-07-30');
```

>Este procedimiento se encarga de generar una nueva factura mensual indicando el id_paciente y el id_tratamiento de donde esta siendo tratado. Recibe 4 argumentos:

>               * id_tratamiento
>               * id_paciente
>               * cuota_mensual
>               * factura_mes

>Este proceso no involucra ninguna tabla, solo hace consultas a la tabla "Tratamientos y Pacientes" para chekear si los identificadores que se pasan como argumento son reales.

>Si el paciente tiene obra social, tendra un descuento segun las que esten registradas en el centro medico. Este descuento se aplica, o no, justo antes de la sentencia insert dentro del procedimiento. Si logra aplicar el descuento. Se crea un registro en una tabla auditora llamada auditoria_trigger. Si no, se registra tal cual se ingresa como parametro al procedimiento. Este procedimiento tiene un proceso TCL.

___
___


> *   **_"alta_empleado"_**
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
___


> *  **_"nueva_factura_empleados"_**
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

>Este trigger se encarga de registrar la nueva matricula de un medico en la tabla " RUP_registro_matriculas" esta tabla simula un registro que validaria la existencia de las matriculas de los medicos.
>Actua sobre la tabla ---> "matriculas"
* Ejemplo
> Al ejecutar el procedimiento _**alta_medico**_ se registra la matricula en la tabla _**RUP_registro_matriculas**_ , esta tabla se utilizaria para comparar la veracidad con el registro real de la matricula, osea, que no este falcificada.
___

> * "alta_tratamiento_controller"

>Este trigger controla actualiza el estado del paciente y medico, de false a true, que se registraron en el momento que se ejecuta el alta del tratamiento. 
>Actua sobre la tabla ---> "tratamientos". 
>Este estado indica si esta inactivo o en tratamiento cualquiera de las dos entidades.
* Ejemplo:
> Si ejecuta el procedimiento _**"alta_tratamiento"**_ , actualiza el valor booleano en FALSE(0) a TRUE(1) del medico y paciente ingresado en los argumentos.
___

> * "alta_paciente_controller"

>Este trigger crea un registro para controlar las inserciones en la tabla "pacientes". 
>Se crea un registro en la tabla "alta_paciente_control".

* Ejemplo:
> Al ejecutar el procedimiento _**"alta_paciente"**_ (sin obra social) se crea un registro en la tabla _**"alta_paciente_control"**_ , con el campo de obra social vacio(null)
___

> * "alta_paciente_controller_OS"

>Este trigger controla la obra social de los pacientes en la tabla auditora, si el nuevo registro en "obra_social_pacientes" se encuentra
>en la tabla auditora esta actualiza el campo obra_social del mismo id correspondiente.

* Ejemplo:
> Al ejecutar el procedimiento _**"alta_paciente"**_ (con obra social) se crea un registro en la tabla _**"alta_paciente_control"**_ , con el campo de obra social correspondiente.
___

> * "alta_medico_controller"

>Este trigger inserta los datos relevantes del registro creado , medico, y lo inserta en la tabla auditora de medicos "alta_medico_control"
* Ejemplo:
> Al ejecutar el procedimiento _**"alta_medico"**_ se insertara los datos relevantes de este registro en la tabla _**"alta_medico_control"**_ .
___

> * "alta_medico_controller_matricula"

>Este trigger se encarga de vincular la matricula del medico recien creado o matricula insertada, y lo registra en la tabla auditoria de medicos "alta_medico_control"
* Ejemplo:
> Al insertarse una nueva matricula en la tabla _**"matriculas"**_ , este trigger actualizara el campo "matricula" de la tabla _**"alta_medico_control"**_ con la matricula correspondiente. Esto puede probarse usando el procedimiento _**"alta_medico"**_ .
___

> * "alta_medico_controller_profesion"

>Este trigger se encarga de vincular la profesion a la tabla auditoria de medicos "alta_medico_control".
>Busca la profesion y actualiza el registro.
* Ejemplo:
> Al insertarse una nueva matricula en la tabla _**"profesion_medicos"**_ , este trigger actualizara el campo "profesion" de la tabla _**"alta_medico_control"**_ con la profesion correspondiente. Esto puede probarse usando el procedimiento _**"alta_medico"**_ .
___
___

## ROLES Y USUARIOS:

> La base de datos "centro_medico" tendra 3 roles:

<br>

* **_Administracion_**: 
> Se encargara de gestionar el alta y baja de empleados, medicos, pacientes y tratamientos. Por lo que tendra permisos de ver, insertar, modificar y borrar sobre estas tablas y sus relaciones.

![Permisos - Rol - Administracion](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/accesos_administracion.png)

<br>

![Permisos - Rol - Administracion](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/prueba_acceso_admin1.png)

<br>

![Permisos - Rol - Administracion](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/prueba_acceso_admin2.png)

> _**No tendra permisos sobre el área de facturaciones**_.

<br>

* **_Facturaciones_**:
> Se encargara de gestionar las facturaciones del centro_medico. Por lo que tendra CRUD sobre las tablas de facturaciones (honorario_facturas, factura_medico, factura_paciente). 

![Permisos - Rol - Facturaciones](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/accesos_facturaciones.png)

<br>

![Permisos - Rol - Facturaciones](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/prueba_acceso_contador1.png)

<br>

![Permisos - Rol - Facturaciones](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/prueba_acceso_contador2.png)

> _**No tendra permisos sobre el área de administracion**_.

<br>

* **_Propietarios_**:
> Este rol lo tendran solo los propietarios del centro medico, solo tendran permisos de lectura para llevar algun tipo de control.

![Permisos - Rol - Propietarios](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/accesos_propietario.png)

<br>

![Permisos - Rol - Propietarios](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/prueba_acceso_duenos.png)

> El Rol propietario solo tiene permisos de lectura.

<br>

### Usuarios del area administrativa:
>           administrador1
>           administrador2

### Usuarios del area de facturaciones
>           contador1
>           contador2

### Usuarios del area de propietarios:
>           duenos

___
___


## BACKUP 

> Para generar un backup de la base de datos ejecutamos el comando **_make create-backup_** y se generara el backup en formato .sql en la raiz de codespaces.

![Backup - Ejecutado](https://github.com/gabrieltoloza/centro_medico-Gabriel-Toloza/blob/main/imagenes/prueba_del_backup.png)

<br>

> De esta manera automatizamos la creacion del backup y lo dejamos ubicado en la raiz de nuestro entorno de trabajo.



<br>
<br>

# ACLARACION
>Toda esta documentacion esta orientada para que sea consumida por un Backend Developer o DBA por lo que esta detallado lo que deben saber, tomar decisiones y hacer uso de este proyecto. 