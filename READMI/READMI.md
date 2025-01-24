# Proyecto BancoMax: Base de Datos MySQL

Este proyecto consiste en la creación de una base de datos MySQL para un banco ficticio llamado "BancoMax". La base de datos fue diseñada y desarrollada utilizando el IDE **Workbench**.

## Detalles

En la sección de Scripts, dentro de la carpeta DDL, se encuentra el script "DDL_BancoMax_Forward Engineer". Este archivo contiene el código SQL que genera automáticamente el diagramador de Workbench al utilizar la herramienta "Forward Engineer" en el apartado "Database".  Se optó por este método ya que las relaciones entre las tablas se definieron utilizando la interfaz gráfica del diagramador de Workbench.

## Modelo de Datos

El modelo de datos se compone de las siguientes tablas:

* **BancoMax:** Almacena información general del banco, como su nombre, servicios, días de servicio, plaza principal, número de empleados y número de contacto.
* **JuntaDirectiva:** Contiene información sobre la junta directiva del banco, incluyendo el número total de integrantes, el número total de reuniones, el lugar y la fecha de las juntas.
* **NombresIntegrantesJuntaDirectiva:** Almacena los nombres completos de los integrantes de la junta directiva.
* **Fundador1 y Fundador2:** Contiene información personal de los fundadores del banco, como su nombre, sexo, edad, nivel de educación y cargo en la junta directiva.
* **CEO, COO, CFO, CMO, CTO, CHRO:** Almacena información de los principales ejecutivos del banco, como sus responsabilidades y los departamentos a su cargo.
* **DepartamentoGeneral:** Contiene información general de los departamentos del banco.
* **DepartamentoOperacionesBancarias, DepartamentoContabilidad, DepartamentoMarketing, DepartamentoRecursosHumanos, DepartamentoSeguridadInformatica:** Almacena información específica de cada departamento, como sus responsabilidades, número de empleados y nombre de los empleados.
* **LugarDondeOpera:** Almacena información sobre los países y ciudades donde opera el banco.
* **CiudadDeMexico y Toluca:** Contiene información sobre las sucursales del banco en Ciudad de México y Toluca, respectivamente.
* **SucursalCondesa, SucursalRomaNorte, SucursalPolanco, SucursalSantaFe, SucursalCoyoacan, SucursalCentroHistorico, SucursalReforma, SucursalIndustrial, SucursalUniversidad, SucursalCacalomacan:** Almacena información detallada de cada sucursal, como su dirección, horario de servicio, nombre de los empleados y sus cargos.
* **Inversionistas:** Almacena información sobre los inversionistas del banco.

## Scripts

Los scripts del proyecto se organizan en las siguientes carpetas:

* **DDL:** Contiene los scripts para la creación de la base de datos y las tablas (Data Definition Language).
* **DML:** Contiene los scripts para la inserción, actualización y eliminación de datos (Data Manipulation Language).
* **Procesos - Triggers:** Contiene los scripts para la creación de procedimientos almacenados, funciones y triggers.

## Funcionalidades

La base de datos permite realizar las siguientes operaciones:

* **Insertar datos:** Se pueden insertar datos en todas las tablas, incluyendo información del banco, la junta directiva, los empleados, los departamentos y las sucursales.
* **Actualizar datos:** Se pueden actualizar los datos existentes en cualquier tabla.
* **Eliminar datos:** Se pueden eliminar datos de cualquier tabla, con la restricción de que no se pueden eliminar departamentos que tengan empleados asignados.
* **Consultar datos:** Se pueden realizar consultas para obtener información específica de la base de datos, como la lista de empleados de un departamento, los empleados que ganan más de un salario determinado, etc.
* **Validar datos:** Se valida la edad de los inversionistas antes de insertarlos en la base de datos, para asegurar que sean mayores de 18 años.
* **Automatizar tareas:** Se utilizan procedimientos almacenados para automatizar tareas como el aumento de salario y el cálculo de las horas de trabajo.
* **Calcular valores:** Se utilizan funciones para calcular el salario anual de los empleados y verificar la pertenencia a un departamento.

## Conclusiones

Este proyecto me ha permitido aplicar mis conocimientos de SQL y MySQL para crear una base de datos relacional completa y funcional. He aprendido a diseñar un modelo de datos, crear tablas, establecer relaciones entre ellas, insertar y manipular datos, y utilizar herramientas como vistas, triggers, procedimientos almacenados y funciones para optimizar el acceso a la información y automatizar tareas.
