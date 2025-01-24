--  Lista de empleados del departamento de contabilidad, ordenados por salario de forma descendente
SELECT nombreCompletoEmpleados, salarioMensual 
	FROM DepartamentoContabilidad 
	ORDER BY salarioMensual DESC;
    
-- Mostrar los nombres y salarios de los empleados que ganan más de $20,000
SELECT nombreCompletoEmpleados, salarioMensual 
	FROM DepartamentoGeneral 
	WHERE salarioMensual > 20000;
    
-- Obtener los nombres de los empleados que trabajan en la sucursal Condesa
SELECT nombreEmpleados FROM SucursalCondesa;

--  Mostrar los nombres de los empleados que trabajan en la Ciudad de México y Toluca, utilizando UNION
SELECT nombreEmpleados FROM SucursalCondesa
	UNION
SELECT nombreEmpleados FROM SucursalRomaNorte
	UNION
SELECT nombreEmpleados FROM SucursalPolanco
	UNION
SELECT nombreEmpleados FROM SucursalSantaFe
	UNION
SELECT nombreEmpleados FROM SucursalCoyoacan
	UNION
SELECT nombreEmpleados FROM SucursalCentroHistorico
	UNION
SELECT nombreEmpleados FROM SucursalReforma
	UNION
SELECT nombreEmpleados FROM SucursalIndustrial
	UNION
SELECT nombreEmpleados FROM SucursalUniversidad
	UNION
SELECT nombreEmpleados FROM SucursalCacalomacan;
    
-- Mostrar los nombres de los empleados del departamento de marketing que tienen un salario mayor a $15,000, ordenados por nombre
SELECT nombreCompletoEmpleados 
	FROM DepartamentoMarketing 
	WHERE salarioMensual > 15000 
	ORDER BY nombreCompletoEmpleados;

-- Obtener los nombres de los empleados que trabajan en la sucursal Polanco y que ganan más de $20,000
SELECT nombreEmpleados 
	FROM SucursalPolanco 
	WHERE SueldoPorMes > 20000;
    
-- Mostrar los nombres de los empleados que trabajan en la Ciudad de México, ordenados por cargo
SELECT nombreEmpleados, cargoEmpleados 
	FROM SucursalCondesa 
	ORDER BY cargoEmpleados;
    
-- Mostrar los nombres de los empleados del departamento de seguridad informática que tienen un salario menor a $10,000, ordenados por salario de forma ascendente
SELECT nombreCompletoEmpleados 
	FROM DepartamentoSeguridadInformatica 
	WHERE salarioMensual < 10000 
	ORDER BY salarioMensual ASC;
    
-- Calcular el salario promedio de los empleados de la sucursal Santa Fe
SELECT AVG(SueldoPorMes) AS SalarioPromedio FROM SucursalSantaFe;
    
-- Mostrar los nombres de los empleados que trabajan en Toluca, ordenados por nombre
SELECT nombreEmpleados 
	FROM SucursalCentroHistorico 
	ORDER BY nombreEmpleados;
    
-- Encontrar los nombres de los empleados que tienen un salario igual al salario mínimo del departamento de contabilidad
SELECT nombreCompletoEmpleados 
	FROM DepartamentoContabilidad 
	WHERE salarioMensual = (SELECT MIN(salarioMensual) FROM DepartamentoContabilidad);
    
-- Mostrar los nombres de los empleados del departamento de operaciones bancarias que tienen un salario entre $20,000 y $40,000
SELECT nombreCompletoEmpleados 
	FROM DepartamentoOperacionesBancarias 
	WHERE salarioMensual BETWEEN 20000 AND 40000;
    
-- Obtener los nombres de los empleados que trabajan en la sucursal Reforma y que ganan más de $15,000, ordenados por salario de forma descendente
SELECT nombreEmpleados 
	FROM SucursalReforma 
	WHERE SueldoPorMes > 15000 
	ORDER BY SueldoPorMes DESC;
    
-- Obtener las primeras 10 tuplas del departamentoGeneral
SELECT * FROM departamentogeneral
	Limit 0, 10;
    
-- Obtener las ultimas 10 tuplas del departamentoGeneral
SELECT * FROM departamentogeneral
	Limit 10, 20;
   
-- Buscar los empleados del DepartamentoGeneral que ganan más que el promedio de los empleados del DepartamentoContabilidad
SELECT nombreCompletoEmpleados, salarioMensual
	FROM DepartamentoGeneral
	WHERE salarioMensual > (SELECT AVG(salarioMensual) FROM DepartamentoContabilidad);