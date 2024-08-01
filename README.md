# Centro Medico - Salud Mental // Gabriel Toloza

> Este proyecto se trata de un centro medico orientado a salud mental, se debe gestionar los servicios dados hacia pacientes ofreciendo profesionales(medicos) para cubrir necesidades. El diseño de la base de datos gestiona tratamientos, medicos con sus respectivas matriculas y profesion, pacientes con sus obras sociales y facturacion, tanto como para medicos en forma de salarios/honorarios y pacientes en forma de aranceles. 

> Ademas se gestiona las entidades del area operativa para manejar los empleados, sus puestos y obra social correspondiente.


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
|               | ID_CENTRO_MEDICO  | INT NOT NULL                          |
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
|               | ID_CENTRO_MEDICO  | INT NOT NULL                          |
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
|               | ID_CENTRO_MEDICO  | INT NOT NULL                          |
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
|               | ID_CENTRO_MEDICO  | INT NOT NULL                          |
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





## Guia para levantar la base de datos:


### 1 - Primer paso
<table>
    <tr><td>
        Una vez tenga el respositorio debera hacer click en la seccion " < > Code " de 
        Github. Luego hacer click en "Create codespace on main".
    </td></tr>
</table>


![Centro Medico - Saludo Mental](https://github.com/ToxicBlood2023/centro_medico-Gabriel-Toloza/blob/main/1er_paso_Guia.png)


### 2 - Segundo paso
<table>
    <tr><td>
        Dejamos cargar el sitio una vez este listo hacemos click abajo a la izquierda
        Justo en la esquina
    </td></tr>
</table>


![Centro Medico - Saludo Mental](https://github.com/ToxicBlood2023/centro_medico-Gabriel-Toloza/blob/main/Guia-2-paso.png)



### 3 - Tercer paso
<table>
    <tr><td>
        Luego hacemos click la opcion " Open in VS Code Desktop ..." y confirmamos los permisos.
    </td></tr>
</table>

![Centro Medico - Saludo Mental](https://github.com/ToxicBlood2023/centro_medico-Gabriel-Toloza/blob/main/Guia-paso-3.png)


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
> ## Vistas: 
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
---
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
---

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
---

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
---

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
---

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
---

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
---

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
---

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
---
