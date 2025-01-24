-- Create nos permita crear una base de datos
Create DataBase BancoMax;
-- Uso de la base de datos BancoMax
Use BancoMax;

-- Create de las Tablas Principales con sus Relacciones:
Create Table BancoMax(
	id Int Not Null,
    nombreBanco Varchar(25) Not Null,
    servicios Varchar(50) Null,
    diasServicio Varchar(30) Null,
    plasaPrincipal Varchar(50) Null,
    numEmpleadosTotales int Not null,
    Primary Key(id)
);

-- Altera el estado de la tabla. Esto con la finalidad de agregar columnas o eliminarlas
Alter Table BancoMax
	Add numContacto int Not null; 

-- Altera el estado de la tabla. Esto con la finalidad de establecer una relacion de tabla madre a hija
Alter Table JuntaDirectiva
	Add Constraint fk_BancoMax_JuntaDirectiva
    Foreign Key(bancoMax_id) References BancoMax(id);

Create Table JuntaDirectiva(
	id Int Not Null,
    bancoMax_id Int Not Null,
    totalDeIntegrantes int Not null,
    totalDeReuniones int Not null,
    LugarDeJunta Varchar (25) Not null,
    fechaDeJunta time Not null,
    Primary Key(id)
);

-- Altera el estado de la tabla. Esto con la finalidad de establecer una relacion de tabla madre a hija
Alter Table nombresIntegrantesJuntaDirectiva
	Add Constraint fk_JuntaDirectiva_nombresIntegrantesJuntaDirectiva
    Foreign Key(JuntaDirectiva_Id) references JuntaDirectiva(id);

Create Table nombresIntegrantesJuntaDirectiva(
	id Int Not null Primary Key,
    JuntaDirectiva_Id Int Not null,
    nombreCompleto Varchar(50) Not null
);


-- Altera el estado de la tabla. Esto con la finalidad de establecer una relacion de tabla madre a hija
Alter Table Fundador1
	Add Constraint fk_nombresIntegrantesJuntaDirectiva_Fundador1
    Foreign Key(juntaDirectiva_id) References nombresIntegrantesJuntaDirectiva(id);
Alter Table Fundador2
	Add Constraint fk_nombresIntegrantesJuntaDirectiva_Fundador2
    Foreign Key(juntaDirectiva_id) References nombresIntegrantesJuntaDirectiva(id);
    
    
Create Table Fundador1(
	id Int Not Null,
    juntaDirectiva_id Int Not Null,
    nombreCompleto Varchar(50) Not null,
    sexo Varchar(20) Not null,
    edad int Not null,
    nivelDeEducacion Varchar(60) Null,
    cargoJuntaDirectiva Varchar(50) Not null,
    Primary Key(id)
);

Create Table Fundador2(
	id Int Not Null,
    juntaDirectiva_id Int Not Null,
    nombreCompleto Varchar(50) Not null,
    sexo Varchar(20) Not null,
    edad int Not null,
    nivelDeEducacion Varchar(60) Null,
    cargoJuntaDirectiva Varchar(50) Not null,
    Primary Key(id)
);


-- Altera el estado de la tabla. Esto con la finalidad de establecer una relacion de tabla madre a hija
Alter Table CEO
	Add Constraint fk_Fundador1_CEO
    Foreign Key(fundador1_id) References Fundador1(id);

Create Table CEO(
	id Int Not Null,
    fundador1_id Int Not Null,
    responsabilidades Varchar(100) Not null,
    departamentosAcargo Varchar(100) Not null,
    Primary Key(id)
);

Create Table COO(
	id Int Not Null,
    fundador2_id Int Not Null,
    responsabilidades Varchar(100) Not null,
    departamentosAcargo Varchar(100) Not null,
    Primary Key(id)
);

Create Table CFO(
	id Int Not Null,
    nombreCompleto Varchar(50) Not null,
    sexo Varchar(20) Not null,
    edad int Not null,
    nivelDeEducacion Varchar(60) Null,
    responsabilidades Varchar(100) Not null,
    departamentosAcargo Varchar(100) Not null,
    Primary Key(id)
);

Create Table CMO(
	id Int Not Null,
    nombreCompleto Varchar(50) Not null,
    sexo Varchar(20) Not null,
    edad int Not null,
    nivelDeEducacion Varchar(60) Null,
    responsabilidades Varchar(100) Not null,
    departamentosAcargo Varchar(100) Not null,
    Primary Key(id)
);

Create Table CTO(
	id Int Not Null,
    nombreCompleto Varchar(50) Not null,
    sexo Varchar(20) Not null,
    edad int Not null,
    nivelDeEducacion Varchar(60) Null,
    responsabilidades Varchar(100) Not null,
    departamentosAcargo Varchar(100) Not null,
    Primary Key(id)
);

Create Table CHRO(
	id Int Not Null,
    nombreCompleto Varchar(50) Not null,
    sexo Varchar(20) Not null,
    edad int Not null,
    nivelDeEducacion Varchar(60) Null,
    responsabilidades Varchar(100) Not null,
    departamentosAcargo Varchar(100) Not null,
    Primary Key(id)
);


-- Create de las Tablas Secundarias:
-- Los Drops ColumnS los realise esto debido a que relacione las tablas Secundarias en el Diagramador de MySQL por su comodidad.
Create Table DepartamentoGeneral(
	id Int Not null Primary Key,
    CEO_id Int Not null,
    Responsabilidades Varchar(100) Not null,
	numEmpleados int Not null,
	nombreCompletoEmpleados Varchar(50) Not null
);

-- Altera el estado de la tablas para eliminar columna
Alter Table DepartamentoGeneral
	Drop Column CEO_id;

Create Table DepartamentoOperacionesBancarias(
	id Int Not null Primary Key,
    COO_id Int Not null,
    DepartamentoGeneral_id Int Not null,
    Responsabilidades Varchar(100) Not null,
	numEmpleados int Not null,
	nombreCompletoEmpleados Varchar(50) Not null
);

-- Altera el estado de la tablas para eliminar columna
Alter Table DepartamentoOperacionesBancarias
	Drop Column COO_id,
    Drop Column  DepartamentoGeneral_id;

Create Table DepartamentoContabilidad(
	id Int Not null Primary Key,
    CFO_id Int Not null,
	DepartamentoGeneral_id Int Not null,
    Responsabilidades Varchar(100) Not null,
	numEmpleados int Not null,
	nombreCompletoEmpleados Varchar(50) Not null
);

Alter Table DepartamentoContabilidad
	Drop Column CFO_id,
    Drop Column  DepartamentoGeneral_id;

Create Table DepartamentoMarketing(
	id Int Not null Primary Key,
    CMO_id Int Not null,
	DepartamentoGeneral_id Int Not null,
    Responsabilidades Varchar(100) Not null,
	numEmpleados int Not null,
	nombreCompletoEmpleados Varchar(50) Not null
);

Alter Table DepartamentoMarketing
	Drop Column CMO_id,
    Drop Column  DepartamentoGeneral_id;

Create Table DepartamentoRecursosHumanos(
	id Int Not null Primary Key,
    CHRO_id Int Not null,
    DepartamentoGeneral_id Int Not null,
    Responsabilidades Varchar(100) Not null,
	numEmpleados int Not null,
	nombreCompletoEmpleados Varchar(50) Not null
);

Alter Table DepartamentoRecursosHumanos
	Drop Column CHRO_id,
    Drop Column  DepartamentoGeneral_id;

Create Table DepartamentoSeguridadInformatica(
	id Int Not null Primary Key,
    CTO_id Int Not null,
    DepartamentoGeneral_id Int Not null,
    Responsabilidades Varchar(100) Not null,
	numEmpleados int Not null,
    nombreCompletoEmpleados Varchar(50) Not null
);

Alter Table DepartamentoSeguridadInformatica
	Drop Column CTO_id,
    Drop Column  DepartamentoGeneral_id;

Create Table LugarDondeOpera(
	id Int Not null Primary Key,
    Pais Varchar(10) Not null,
    CiudadesPrincipales Varchar(50) Not null
);

Create Table CiudadesPrincipales(
	id Int not null,
	LugarDondeOpera_id Int Not null,
    num_SucursalesTotales int Not null,
    Primary Key(id)
);

-- Ejemplo de la estructura de una sucursal en ciudad de Mexico:
Create Table CiudadDeMexico(
	id Int not null Primary Key,
    num_Sucursales Int Not null
);

Create Table sucursal(
	id Int Not null Primary Key,
    CiudadDeMexico_id Int not null,
    Direccion Varchar(50) Not null,
    numEmpleados Int null,
    nombreEmpleados Varchar(50) Null,
    CargoEmpleados Varchar(50) Null
);

-- En caso de querer Borrar Tablas:
Drop Table BancoMax;