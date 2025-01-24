-- Insert into en cada una de las tablas de la alta directiva:
INSERT INTO bancomax (id, nombreBanco, servicios, diasServicio, plasaPrincipal, numEmpleadosTotales, numContacto)
	VALUES(1, 'BancoMax', 'Cuentas de ahorro, préstamos, inversiones, seguros', 'Lunes a Viernes', 'Ciudad de México', 192, 567005674);

Insert Into juntaDirectiva(id, bancoMax_id, totalDeIntegrantes, totalDeReuniones, LugarDeJunta, fechaDeJunta)
	Values(1, 1, 10, 2, 'Toluca', '20/07/25');
    
-- Eliminacion de la tupla con el id uno de la junta directiva
Delete From juntaDirectiva
	Where id = 1;
    
-- Se ejecuta esta sentencia despues de la eliminacion de la tupla anterior
Insert Into juntaDirectiva(id, bancoMax_id, totalDeIntegrantes, totalDeReuniones, LugarDeJunta, fechaDeJunta)
	Values(1, 1, 10, 1, 'Ciudad de México', '05/12/25');
    
-- Actualizacion de la columna id a la tupla dos
Update  juntaDirectiva
	Set id = 1
    Where id = 2;

-- Insert Into a los inversionistas
Insert Into inversionistas(id, nombreCompletoInversionistas, sexo, edad, juntadirectiva_id)
	VALUES 
	(1, 'Pérez García, Juan', 'Masculino', 45, 1),
	(2, 'López Hernández, Ana', 'Femenino', 38, 1),
	(3, 'Rodríguez Martínez, Luis', 'Masculino', 52, 1),
	(4, 'Sánchez Fernández, María', 'Femenino', 40, 1);
    
-- Insert into a los nombres de la junta directiva
INSERT INTO nombresintegrantesjuntadirectiva (id, JuntaDirectiva_id, nombreCompleto) 
	VALUES 
	(1, 1, 'Ana María López Hernández'),
	(2, 1, 'Juan Carlos Rodríguez Martínez'),
	(3, 1, 'Laura Sánchez Fernández'),
	(4, 1, 'Pedro González García'),
	(5, 1, 'Sofía Pérez Rodríguez'),
	(6, 1, 'Miguel Ángel Martínez Sánchez'),
	(7, 1, 'Pérez García, Juan'),
	(8, 1, 'López Hernández, Ana'),
	(9, 1, 'Rodríguez Martínez, Luis'),
	(10, 1, 'Sánchez Fernández, María');
    
INSERT INTO fundador1 (id, juntaDirectiva_id, nombreCompleto, sexo, edad, nivelDeEducacion, cargoJuntaDirectiva) 
	VALUES (1, 1, 'Ana María López Hernández', 'Femenino', 48, 'Doctorado en Administración de Empresas', 'Presidenta');
    
INSERT INTO fundador2 (id, juntaDirectiva_id, nombreCompleto, sexo, edad, nivelDeEducacion, cargoJuntaDirectiva) 
	VALUES (1, 2, 'Juan Carlos Rodríguez Martínez', 'Masculino', 55, 'Maestría en Finanzas', 'Vicepresidente');
    
INSERT INTO ceo (id, fundador1_id, responsabilidades, departamentosAcargo) 
	VALUES (1, 1, 'Definir la visión y estrategia del banco', 'Todos los departamentos');
    
INSERT INTO coo (id, fundador2_id, responsabilidades, departamentosAcargo, ceo_id)
	VALUES (1, 1, 'Supervisar las operaciones diarias del banco', 'Operaciones, Tecnología, Recursos Humanos', 1);

INSERT INTO cto (id, nombreCompleto, sexo, edad, nivelDeEducacion, responsabilidades, departamentosAcargo, ceo_id) 
	VALUES (1, 'Laura Sánchez Fernández', 'Femenino', 38, 'Maestría en Ciencias de la Computación',
	 'Gestionar la infraestructura tecnológica del banco', 'Seguridad Informática', 1);
     
INSERT INTO cfo (id, nombreCompleto, sexo, edad, nivelDeEducacion, responsabilidades, departamentosAcargo, ceo_id) 
	VALUES (1, 'Pedro González García', 'Masculino', 42, 'Maestría en Administración Financiera', 'Gestionar las finanzas del banco', 'Contabilidad', 1);
    
INSERT INTO chro (id, nombreCompleto, sexo, edad, nivelDeEducacion, responsabilidades, departamentosAcargo, ceo_id) 
	VALUES (1, 'Sofía Pérez Rodríguez', 'Femenino', 35, 'Licenciatura en Psicología', 'Gestionar los recursos humanos del banco', 'Recursos Humanos', 1);
    
INSERT INTO cmo (id, nombreCompleto, sexo, edad, nivelDeEducacion, responsabilidades, departamentosAcargo, ceo_id) 
	VALUES (1, 'Miguel Ángel Martínez Sánchez', 'Masculino', 40, 'Maestría en Marketing Digital', 'Desarrollar estrategias de marketing', 'Marketing', 1);
     
     
/* Insert into en cada una de las tablas de los departamentos:
Insert Into a departamentogeneral */
INSERT INTO departamentogeneral (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, ceo_id) 
	VALUES (1, 'Supervisión general de la empresa', 'Ana María López Hernández', 'Femenino', 250000, 'CEO', 1);
-- Resto de empleados (19 tuplas)
INSERT INTO departamentogeneral (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, ceo_id) 
	VALUES 
	(2, 'Optimizar la eficiencia del departamento de marketing', 'Carlos Martínez Ruiz', 'Masculino', 60000, 'Gerente de Eficiencia', 1),
	(3, 'Gestionar el presupuesto del departamento de contabilidad', 'Luisa Gómez Pérez', 'Femenino', 80000, 'Gerente de Presupuesto', 1),
	(4, 'Supervisar el cumplimiento normativo del departamento de operaciones', 'Javier Rodríguez Sánchez', 'Masculino', 100000, 'Supervisor de Cumplimiento', 1),
	(5, 'Coordinar la comunicación entre departamentos', 'Isabel Fernández García', 'Femenino', 75000, 'Coordinador de Comunicación', 1),
	(6, 'Analizar el rendimiento del departamento de recursos humanos', 'Miguel López Hernández', 'Masculino', 55000, 'Analista de Rendimiento', 1),
	(7, 'Implementar mejoras en los procesos del departamento de seguridad informática', 'Ana García Martínez', 'Femenino', 70000, 'Especialista en Mejora de Procesos', 1),
	(8, 'Desarrollar estrategias de crecimiento para el departamento de operaciones bancarias', 'David Sánchez Rodríguez', 'Masculino', 90000, 'Estratega de Crecimiento', 1),
	(9, 'Evaluar la satisfacción de los empleados del departamento de marketing', 'María Pérez Fernández', 'Femenino', 65000, 'Evaluador de Satisfacción', 1),
	(10, 'Gestionar los riesgos del departamento de contabilidad', 'José Hernández García', 'Masculino', 120000, 'Gerente de Riesgos', 1),
	(11, 'Negociar contratos con proveedores del departamento de tecnología', 'Laura Martínez López', 'Femenino', 85000, 'Negociador de Contratos', 1),
	(12, 'Supervisar la calidad del servicio al cliente del departamento de operaciones bancarias', 'Pedro Rodríguez Sánchez', 'Masculino', 50000, 'Supervisor de Calidad', 1),
	(13, 'Implementar nuevas tecnologías en el departamento de recursos humanos', 'Carmen Fernández García', 'Femenino', 80000, 'Especialista en Tecnología', 1),
	(14, 'Asesorar legalmente al departamento de seguridad informática', 'Luis López Hernández', 'Masculino', 95000, 'Asesor Legal', 1),
	(15, 'Capacitar al personal del departamento de marketing', 'Marta García Martínez', 'Femenino', 60000, 'Capacitador', 1),
	(16, 'Optimizar la logística del departamento de contabilidad', 'Juan Sánchez Rodríguez', 'Masculino', 110000, 'Gerente de Logística', 1),
	(17, 'Analizar la eficiencia del departamento de recursos humanos', 'Rosa Pérez Fernández', 'Femenino', 85000, 'Analista de Eficiencia', 1),
	(18, 'Desarrollar un plan de marketing para el departamento de operaciones bancarias', 'Andrés Hernández García', 'Masculino', 70000, 'Planificador de Marketing', 1),
	(19, 'Evaluar el desempeño del departamento de seguridad informática', 'Elena Martínez López', 'Femenino', 90000, 'Evaluador de Desempeño', 1),
	(20, 'Gestionar el presupuesto del departamento de tecnología', 'Jorge Rodríguez Sánchez', 'Masculino', 130000, 'Gerente de Presupuesto', 1);
    
-- Altera departamentogeneral_id a un valor por default de uno
ALTER TABLE departamentooperacionesbancarias MODIFY departamentogeneral_id INT DEFAULT 1;

-- Insert Into a departamentooperacionesbancarias
INSERT INTO departamentooperacionesbancarias (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, coo_id) 
	VALUES (1, 'Supervisión de las operaciones bancarias', 'Juan Carlos Rodríguez Martínez', 'Masculino', 200000, 'COO', 1);
-- Resto de empleados (19 tuplas)
INSERT INTO departamentooperacionesbancarias (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, coo_id) 
	VALUES 
	(2, 'Gestionar las cuentas de los clientes', 'Ana Torres', 'Femenino', 50000, 'Gerente de Cuentas', 2),
	(3, 'Procesar las transacciones bancarias', 'Luis Sánchez', 'Masculino', 45000, 'Operador de Transacciones', 1),
	(4, 'Atender a los clientes en ventanilla', 'María Gómez', 'Femenino', 40000, 'Cajero', 2),
	(5, 'Autorizar los préstamos bancarios', 'Pedro Ruiz', 'Masculino', 60000, 'Oficial de Préstamos', 1),
	(6, 'Gestionar las inversiones del banco', 'Laura Martínez', 'Femenino', 70000, 'Gerente de Inversiones', 2),
	(7, 'Analizar los riesgos de las operaciones', 'Javier Fernández', 'Masculino', 80000, 'Analista de Riesgos', 1),
	(8, 'Supervisar el cumplimiento de las regulaciones', 'Isabel García', 'Femenino', 65000, 'Oficial de Cumplimiento', 1),
	(9, 'Desarrollar nuevos productos bancarios', 'Miguel Rodríguez', 'Masculino', 75000, 'Desarrollador de Productos', 1),
	(10, 'Implementar estrategias de marketing para las operaciones', 'Carmen Sánchez', 'Femenino', 55000, 'Especialista en Marketing', 1),
	(11, 'Mejorar la eficiencia de las operaciones bancarias', 'Alberto Gómez', 'Masculino', 60000, 'Analista de Eficiencia', 1),
	(12, 'Gestionar la seguridad de las operaciones', 'Elena Ruiz', 'Femenino', 85000, 'Jefe de Seguridad', 1),
	(13, 'Brindar soporte técnico a los clientes', 'David Martínez', 'Masculino', 40000, 'Soporte Técnico', 1),
	(14, 'Atender las consultas de los clientes', 'Sofía Fernández', 'Femenino', 45000, 'Representante de Servicio al Cliente', 1),
	(15, 'Realizar auditorías internas de las operaciones', 'Pablo García', 'Masculino', 70000, 'Auditor Interno', 1),
	(16, 'Gestionar las relaciones con los corresponsales bancarios', 'Carmen Rodríguez', 'Femenino', 65000, 'Gerente de Relaciones', 1),
	(17, 'Optimizar los procesos de las operaciones bancarias', 'Juan Sánchez', 'Masculino', 55000, 'Especialista en Procesos', 1),
	(18, 'Capacitar al personal en operaciones bancarias', 'Ana María Gómez', 'Femenino', 50000, 'Capacitador', 1),
	(19, 'Analizar el desempeño de las operaciones bancarias', 'José Luis Ruiz', 'Masculino', 75000, 'Analista de Desempeño', 1),
	(20, 'Gestionar el presupuesto del departamento de operaciones', 'Laura Isabel Martínez', 'Femenino', 80000, 'Gerente de Presupuesto', 1);

-- Actualiza coo_id a uno a las tuplas con el id: "2, 4, 6"
Update departamentooperacionesbancarias
	Set coo_id = 1
    Where id in(2, 4, 6);

-- Insert Into a departamentoseguridadinformatica
INSERT INTO departamentoseguridadinformatica (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, cto_id, departamentogeneral_id) 
	VALUES (1, 'Gestionar la seguridad informática del banco', 'Laura Sánchez Fernández', 'Femenino', 150000, 'CTO', 1, 1);
-- Resto de empleados (14 tuplas)
INSERT INTO departamentoseguridadinformatica (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, cto_id, departamentogeneral_id) 
	VALUES 
	(2, 'Monitorear las redes del banco', 'Juan Pérez', 'Masculino', 60000, 'Analista de Seguridad', 1, 1),
	(3, 'Proteger los datos de los clientes', 'Ana García', 'Femenino', 70000, 'Especialista en Ciberseguridad', 1, 1),
	(4, 'Prevenir ataques informáticos', 'Luis Martínez', 'Masculino', 80000, 'Arquitecto de Seguridad', 1, 1),
	(5, 'Implementar medidas de seguridad', 'María Rodríguez', 'Femenino', 65000, 'Ingeniero de Seguridad', 1, 1),
	(6, 'Investigar incidentes de seguridad', 'Pedro Fernández', 'Masculino', 75000, 'Analista Forense', 1, 1),
	(7, 'Desarrollar soluciones de seguridad', 'Carmen López', 'Femenino', 90000, 'Desarrollador de Seguridad', 1, 1),
	(8, 'Realizar pruebas de penetración', 'Javier Sánchez', 'Masculino', 85000, 'Tester de Penetración', 1, 1),
	(9, 'Educar a los empleados sobre seguridad informática', 'Isabel Gómez', 'Femenino', 55000, 'Especialista en Concienciación', 1, 1),
	(10, 'Gestionar el acceso a los sistemas', 'Miguel Ruiz', 'Masculino', 60000, 'Administrador de Sistemas', 1, 1),
	(11, 'Asegurar el cumplimiento de las normativas de seguridad', 'Sofía Martínez', 'Femenino', 70000, 'Oficial de Cumplimiento', 1, 1),
	(12, 'Implementar firewalls y sistemas de detección de intrusos', 'David Fernández', 'Masculino', 80000, 'Ingeniero de Redes', 1, 1),
	(13, 'Realizar análisis de vulnerabilidades', 'Marta López', 'Femenino', 65000, 'Analista de Vulnerabilidades', 1, 1),
	(14, 'Gestionar la seguridad de la información', 'José Sánchez', 'Masculino', 75000, 'Gerente de Seguridad de la Información', 1, 1),
	(15, 'Encriptar la información confidencial', 'Laura Gómez', 'Femenino', 90000, 'Especialista en Criptografía', 1, 1);
	
 -- Insert Into a departamentocontabilidad   
INSERT INTO departamentocontabilidad (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, cfo_id, departamentogeneral_id) 
	VALUES (1, 'Gestionar las finanzas del banco', 'Pedro González García', 'Masculino', 120000, 'CFO', 1, 1);
-- Resto de empleados (19 tuplas)
INSERT INTO departamentocontabilidad (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, cfo_id, departamentogeneral_id) 
	VALUES 
	(2, 'Llevar la contabilidad general', 'Ana Pérez', 'Femenino', 50000, 'Contador General', 1, 1),
	(3, 'Preparar los estados financieros', 'Luis Gómez', 'Masculino', 60000, 'Analista Financiero', 1, 1),
	(4, 'Analizar la información financiera', 'María Martínez', 'Femenino', 70000, 'Controlador Financiero', 1, 4),
	(5, 'Gestionar las cuentas por pagar', 'José Sánchez', 'Masculino', 45000, 'Auxiliar Contable', 1, 1),
	(6, 'Gestionar las cuentas por cobrar', 'Laura Rodríguez', 'Femenino', 55000, 'Asistente de Cuentas por Cobrar', 1, 6),
	(7, 'Preparar las declaraciones de impuestos', 'Javier Fernández', 'Masculino', 65000, 'Especialista en Impuestos', 1, 1),
	(8, 'Realizar auditorías internas', 'Isabel García', 'Femenino', 75000, 'Auditor Interno', 1, 1),
	(9, 'Elaborar presupuestos', 'Miguel López', 'Masculino', 50000, 'Analista de Presupuesto', 1, 1),
	(10, 'Gestionar el flujo de caja', 'Carmen Martínez', 'Femenino', 60000, 'Tesorero', 1, 10);
    
-- Actualiza departamentogeneral_id a uno a las tuplas con el id: "4, 6, 10"
Update departamentocontabilidad
	Set departamentogeneral_id = 1
    Where id in(4, 6, 10);
    
 -- Insert Into a departamentorecursoshumanos 
INSERT INTO departamentorecursoshumanos (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, chro_id, departamentogeneral_id)
	VALUES (1, 'Gestionar los recursos humanos del banco', 'Sofía Pérez Rodríguez', 'Femenino', 100000, 'CHRO', 1, 1);
-- Resto de empleados (9 tuplas)
INSERT INTO departamentorecursoshumanos (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, chro_id, departamentogeneral_id)
	VALUES
	(2, 'Reclutar y seleccionar personal', 'Juan Pérez', 'Masculino', 50000, 'Reclutador', 1, 1),
	(3, 'Capacitar a los empleados', 'Ana García', 'Femenino', 60000, 'Capacitador', 1, 1),
	(4, 'Evaluar el desempeño del personal', 'Luis Martínez', 'Masculino', 70000, 'Evaluador de Desempeño', 1, 1),
	(5, 'Gestionar la nómina', 'María Rodríguez', 'Femenino', 55000, 'Analista de Nómina', 1, 1),
	(6, 'Administrar los beneficios de los empleados', 'Pedro Fernández', 'Masculino', 65000, 'Especialista en Beneficios', 1, 1),
	(7, 'Resolver conflictos laborales', 'Carmen López', 'Femenino', 75000, 'Mediador Laboral', 1, 1),
	(8, 'Promover el bienestar laboral', 'Javier Sánchez', 'Masculino', 80000, 'Especialista en Bienestar', 1, 1),
	(9, 'Desarrollar planes de carrera', 'Isabel Gómez', 'Femenino', 60000, 'Asesor de Carrera', 1, 1),
	(10, 'Gestionar el clima laboral', 'Miguel Ruiz', 'Masculino', 70000, 'Analista de Clima Laboral', 1, 1);

-- Insert Into a departamentomarketing
INSERT INTO departamentomarketing (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, cmo_id, departamentogeneral_id) 
	VALUES (1, 'Desarrollar estrategias de marketing', 'Miguel Ángel Martínez Sánchez', 'Masculino', 110000, 'CMO', 1, 1);
-- Resto de empleados (6 tuplas)
INSERT INTO departamentomarketing (id, Responsabilidades, nombreCompletoEmpleados, Sexo, salarioMensual, Cargo, cmo_id, departamentogeneral_id) 
	VALUES 
	(2, 'Realizar estudios de mercado', 'Ana Pérez', 'Femenino', 50000, 'Analista de Mercado', 1, 1),
	(3, 'Gestionar las redes sociales', 'Luis Gómez', 'Masculino', 60000, 'Community Manager', 1, 1),
	(4, 'Crear campañas publicitarias', 'María Martínez', 'Femenino', 70000, 'Publicista', 1, 4),
	(5, 'Diseñar materiales de marketing', 'José Sánchez', 'Masculino', 55000, 'Diseñador Gráfico', 1, 1),
	(6, 'Organizar eventos promocionales', 'Laura Rodríguez', 'Femenino', 65000, 'Coordinador de Eventos', 1, 1),
	(7, 'Analizar el retorno de la inversión', 'Javier Fernández', 'Masculino', 75000, 'Analista de Marketing', 1, 1);
    
-- Actualiza departamentogeneral_id a uno a la tupla con el id: "4"
Update departamentocontabilidad
	Set departamentogeneral_id = 1
    Where id = 4;
    
    
-- Insert into en cada una de las tablas de las sucursales:
Insert Into lugarDondeOpera(id, pais, departamentoGeneral_id)
	Values(1, "Mexico", 1);
    
Insert into ciudadDeMexico(id, num_Sucursales, numEmpleadosTotal, lugarDondeOpera_id)
	Values(1, 5, 50, 1);
    
Insert Into toluca(id, num_Sucursales, numEmpleadosTotal, lugarDondeOpera_id)
	Values(2, 5, 50, 1);
    
-- Insert Into a sucursalcondesa
INSERT INTO sucursalcondesa (id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, ciudaddemexico_id) 
	VALUES 
	(1, 'Av. Tamaulipas 150, Condesa, Ciudad de México', '09:00:00', 'Gerardo Rodríguez', 'Gerente', 60000, 1),
	(2, 'Calle Michoacán 120, Condesa, Ciudad de México', '10:00:00', 'Valeria Martínez', 'Cajero', 40000, 1),
	(3, 'Av. Veracruz 80, Condesa, Ciudad de México', '11:00:00', 'Daniel García', 'Asesor financiero', 50000, 1),
	(4, 'Calle Ámsterdam 200, Condesa, Ciudad de México', '12:00:00', 'Fernanda López', 'Ejecutivo de cuenta', 55000, 1),
	(5, 'Calle Atlixco 50, Condesa, Ciudad de México', '13:00:00', 'Guillermo Sánchez', 'Promotor de ventas', 45000, 1),
	(6, 'Av. Insurgentes 300, Condesa, Ciudad de México', '14:00:00', 'Lorena Ramírez', 'Analista de crédito', 65000, 1),
	(7, 'Calle Parral 100, Condesa, Ciudad de México', '15:00:00', 'Ernesto Torres', 'Cajero', 40000, 1),
	(8, 'Av. Nuevo León 220, Condesa, Ciudad de México', '16:00:00', 'Jimena González', 'Asesor financiero', 50000, 1),
	(9, 'Calle Mazatlán 80, Condesa, Ciudad de México', '17:00:00', 'Ricardo Martínez', 'Ejecutivo de cuenta', 55000, 1),
	(10, 'Av. Sonora 150, Condesa, Ciudad de México', '18:00:00', 'Paola García', 'Promotor de ventas', 45000, 1);
    
-- Insert Into a sucursalromanorte
INSERT INTO sucursalromanorte (id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, ciudaddemexico_id) 
	VALUES 
	(11, 'Av. Ejército Nacional 400, Polanco, Ciudad de México', '09:00:00', 'Brenda Ruiz', 'Gerente', 60000, 1),
	(12, 'Calle Molière 220, Polanco, Ciudad de México', '10:00:00', 'Saúl Martínez', 'Cajero', 40000, 1),
	(13, 'Av. Horacio 300, Polanco, Ciudad de México', '11:00:00', 'Estefanía García', 'Asesor financiero', 50000, 1),
	(14, 'Calle Galileo 100, Polanco, Ciudad de México', '12:00:00', 'Óscar López', 'Ejecutivo de cuenta', 55000, 1),
	(15, 'Av. Presidente Masaryk 450, Polanco, Ciudad de México', '13:00:00', 'Ivana Sánchez', 'Promotor de ventas', 45000, 1),
	(16, 'Calle Arquímedes 200, Polanco, Ciudad de México', '14:00:00', 'Manuel Ramírez', 'Analista de crédito', 65000, 1),
	(17, 'Av. Homero 150, Polanco, Ciudad de México', '15:00:00', 'Karla Torres', 'Cajero', 40000, 1),
	(18, 'Calle Tennyson 330, Polanco, Ciudad de México', '16:00:00', 'Jaime González', 'Asesor financiero', 50000, 1),
	(19, 'Av. Moliere 120, Polanco, Ciudad de México', '17:00:00', 'Bárbara Martínez', 'Ejecutivo de cuenta', 55000, 1),
	(20, 'Calle Newton 80, Polanco, Ciudad de México', '18:00:00', 'Abraham García', 'Promotor de ventas', 45000, 1);
    
-- Insert Into a sucursalpolanco
INSERT INTO sucursalpolanco (id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, ciudaddemexico_id) 
	VALUES 
	(21, 'Av. Presidente Masaryk 100, Polanco, Ciudad de México', '09:00:00', 'Rubén Herrera', 'Gerente', 60000, 1),
	(22, 'Calle Anatole France 220, Polanco, Ciudad de México', '10:00:00', 'Ximena Molina', 'Cajero', 40000, 1),
	(23, 'Av. Emilio Castelar 300, Polanco, Ciudad de México', '11:00:00', 'Joel Ortega', 'Asesor financiero', 50000, 1),
	(24, 'Calle Alejandro Dumas 100, Polanco, Ciudad de México', '12:00:00', 'Yolanda Vargas', 'Ejecutivo de cuenta', 55000, 1),
	(25, 'Av. Campos Elíseos 450, Polanco, Ciudad de México', '13:00:00', 'Ismael Cuevas', 'Promotor de ventas', 45000, 1),
	(26, 'Calle Edgar Allan Poe 200, Polanco, Ciudad de México', '14:00:00', 'Rebeca Ávila', 'Analista de crédito', 65000, 1),
	(27, 'Av. Paseo de la Reforma 150, Polanco, Ciudad de México', '15:00:00', 'Damián Castro', 'Cajero', 40000, 1),
	(28, 'Calle Julio Verne 330, Polanco, Ciudad de México', '16:00:00', 'Mayra Medina', 'Asesor financiero', 50000, 1),
	(29, 'Av. Mahatma Gandhi 120, Polanco, Ciudad de México', '17:00:00', 'Adolfo Romero', 'Ejecutivo de cuenta', 55000, 1),
	(30, 'Calle Lord Byron 80, Polanco, Ciudad de México', '18:00:00', 'Nuria Flores', 'Promotor de ventas', 45000, 1);

-- Insert Into a sucursalsantafe
INSERT INTO sucursalsantafe (id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, ciudaddemexico_id) 
	VALUES 
	(31, 'Av. Vasco de Quiroga 3000, Santa Fe, Ciudad de México', '09:00:00', 'Ignacio Rivera', 'Gerente', 60000, 1),
	(32, 'Calle Juan Salvador Agraz 40, Santa Fe, Ciudad de México', '10:00:00', 'Alma Cuevas', 'Cajero', 40000, 1),
	(33, 'Av. Santa Fe 482, Santa Fe, Ciudad de México', '11:00:00', 'Emilio Vargas', 'Asesor financiero', 50000, 1),
	(34, 'Calle Guillermo González Camarena 1200, Santa Fe, Ciudad de México', '12:00:00', 'Angélica Flores', 'Ejecutivo de cuenta', 55000, 1),
	(35, 'Av. Prolongación Paseo de la Reforma 1015, Santa Fe, Ciudad de México', '13:00:00', 'Cristóbal Romero', 'Promotor de ventas', 45000, 1),
	(36, 'Calle Javier Barros Sierra 540, Santa Fe, Ciudad de México', '14:00:00', 'Lucía Medina', 'Analista de crédito', 65000, 1),
	(37, 'Av. Carlos Echanove 200, Santa Fe, Ciudad de México', '15:00:00', 'Aarón Castro', 'Cajero', 40000, 1),
	(38, 'Calle José María Castorena 425, Santa Fe, Ciudad de México', '16:00:00', 'Beatriz Ávila', 'Asesor financiero', 50000, 1),
	(39, 'Av. Tamaulipas 150, Santa Fe, Ciudad de México', '17:00:00', 'Rafael Herrera', 'Ejecutivo de cuenta', 55000, 1),
	(40, 'Calle Guillermo Haro 180, Santa Fe, Ciudad de México', '18:00:00', 'Elvira Molina', 'Promotor de ventas', 45000, 1);

-- Insert Into a sucursalcoyoacan
INSERT INTO sucursalcoyoacan(id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, ciudaddemexico_id) 
	VALUES 
	(41, 'Av. Miguel Ángel de Quevedo 200, Coyoacán, Ciudad de México', '09:00:00', 'Amelia Suárez', 'Gerente', 60000, 1),
	(42, 'Calle Francisco Sosa 320, Coyoacán, Ciudad de México', '10:00:00', 'Sebastián Rivera', 'Cajero', 40000, 1),
	(43, 'Av. Universidad 1800, Coyoacán, Ciudad de México', '11:00:00', 'Adriana Flores', 'Asesor financiero', 50000, 1),
	(44, 'Calle Centenario 20, Coyoacán, Ciudad de México', '12:00:00', 'Enrique Romero', 'Ejecutivo de cuenta', 55000, 1),
	(45, 'Av. Pacífico 450, Coyoacán, Ciudad de México', '13:00:00', 'Guadalupe Molina', 'Promotor de ventas', 45000, 1),
	(46, 'Calle Hidalgo 10, Coyoacán, Ciudad de México', '14:00:00', 'Teodoro Vargas', 'Analista de crédito', 65000, 1),
	(47, 'Av. División del Norte 2800, Coyoacán, Ciudad de México', '15:00:00', 'Victoria Ortega', 'Cajero', 40000, 1),
	(48, 'Calle Allende 30, Coyoacán, Ciudad de México', '16:00:00', 'Maximiliano Cuevas', 'Asesor financiero', 50000, 1),
	(49, 'Av. México Coyoacán 340, Coyoacán, Ciudad de México', '17:00:00', 'Consuelo Ávila', 'Ejecutivo de cuenta', 55000, 1),
	(50, 'Calle Abasolo 150, Coyoacán, Ciudad de México', '18:00:00', 'Agustín Castro', 'Promotor de ventas', 45000, 1);

-- Insert Into a sucursalcentrohistorico 
INSERT INTO sucursalcentrohistorico (id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, toluca_id) 
	VALUES 
	(51, 'Calle 5 de Febrero 10, Centro Histórico, Toluca', '09:00:00', 'Irma Pineda', 'Gerente', 60000, 2),
	(52, 'Av. Independencia 200, Centro Histórico, Toluca', '10:00:00', 'Efraín Luna', 'Cajero', 40000, 2),
	(53, 'Calle Nicolás Bravo 30, Centro Histórico, Toluca', '11:00:00', 'Gloria Ríos', 'Asesor financiero', 50000, 2),
	(54, 'Av. Hidalgo 450, Centro Histórico, Toluca', '12:00:00', 'Esteban Vega', 'Ejecutivo de cuenta', 55000, 2),
	(55, 'Calle Morelos 5, Centro Histórico, Toluca', '13:00:00', 'Leticia Campos', 'Promotor de ventas', 45000, 2),
	(56, 'Av. Juárez 600, Centro Histórico, Toluca', '14:00:00', 'Arnulfo Sierra', 'Analista de crédito', 65000, 2),
	(57, 'Calle Lerdo 70, Centro Histórico, Toluca', '15:00:00', 'Marisol Guerrero', 'Cajero', 40000, 2),
	(58, 'Av. Primero de Mayo 880, Centro Histórico, Toluca', '16:00:00', 'Isidro Peña', 'Asesor financiero', 50000, 2),
	(59, 'Calle Santos Degollado 90, Centro Histórico, Toluca', '17:00:00', 'Rosaura Valle', 'Ejecutivo de cuenta', 55000, 2),
	(60, 'Av. Benito Juárez 1000, Centro Histórico, Toluca', '18:00:00', 'Albino Fuentes', 'Promotor de ventas', 45000, 2);
		
-- Insert Into a sucursalreforma
INSERT INTO sucursalreforma (id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, toluca_id) 
	VALUES 
	(61, 'Av. Paseo de la Reforma 400, Centro, Toluca', '09:00:00', 'Juana Bautista', 'Gerente', 60000, 2),
	(62, 'Calle Ignacio López Rayón 220, Centro, Toluca', '10:00:00', 'Vicente Guerrero', 'Cajero', 40000, 2),
	(63, 'Av. José María Morelos 300, Centro, Toluca', '11:00:00', 'Guillermina Juárez', 'Asesor financiero', 50000, 2),
	(64, 'Calle Miguel Hidalgo 100, Centro, Toluca', '12:00:00', 'Porfirio Díaz', 'Ejecutivo de cuenta', 55000, 2),
	(65, 'Av. Ignacio Allende 450, Centro, Toluca', '13:00:00', 'Lucrecia Salinas', 'Promotor de ventas', 45000, 2),
	(66, 'Calle Nicolás Bravo 200, Centro, Toluca', '14:00:00', 'Wenceslao Vargas', 'Analista de crédito', 65000, 2),
	(67, 'Av. Sebastián Lerdo de Tejada 150, Centro, Toluca', '15:00:00', 'Amalia Ortega', 'Cajero', 40000, 2),
	(68, 'Calle Josefa Ortiz de Domínguez 330, Centro, Toluca', '16:00:00', 'Epifanio Cuevas', 'Asesor financiero', 50000, 2),
	(69, 'Av. Lerdo 120, Centro, Toluca', '17:00:00', 'Remedios Ávila', 'Ejecutivo de cuenta', 55000, 2),
	(70, 'Calle Mariano Matamoros 80, Centro, Toluca', '18:00:00', 'Casimiro Castro', 'Promotor de ventas', 45000, 2);

-- Insert Into a sucursalindustrial
INSERT INTO sucursalindustrial (id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, toluca_id)
	VALUES
	(71, 'Av. 5 de Mayo 123, Centro', '09:00:00', 'Esteban García', 'Gerente', 60000, 2),
	(72, 'Calle Hidalgo 456, Col. Reforma', '10:00:00', 'Valeria Martínez', 'Subgerente', 45000, 2),
	(73, 'Blvd. Isidro Fabela 789, Col. Universidad', '08:30:00', 'Ricardo Sánchez', 'Cajero', 25000, 2),
	(74, 'Av. Morelos 1011, Col. Industrial', '09:30:00', 'Fernanda López', 'Asesor', 30000, 2),
	(75, 'Calle Benito Juárez 1213, Col. Nueva Oxtotitlán', '10:30:00', 'Daniel Ramírez', 'Gerente', 65000, 2),
	(76, 'Av. Lerdo de Tejada 1415, Col. Santa Ana Tlapaltitlán', '09:00:00', 'Jimena González', 'Subgerente', 50000, 2),
	(77, 'Calle Ignacio Allende 1617, Col. San Mateo Otzacatipan', '08:00:00', 'Miguel Pérez', 'Cajero', 28000, 2),
	(78, 'Av. Sebastián Lerdo de Tejada 1819, Col. San Lorenzo Tepaltitlán', '10:00:00', 'Andrea Martínez', 'Asesor', 35000, 2),
	(79, 'Calle Josefa Ortiz de Domínguez 2021, Col. San Pedro Totoltepec', '09:30:00', 'David García', 'Gerente', 70000, 2),
	(80, 'Av. Miguel Hidalgo 2223, Col. Cacalomacán', '11:00:00', 'Camila Sánchez', 'Subgerente', 55000, 2);
	
-- Insert Into a sucursaluniversidad
INSERT INTO sucursaluniversidad (id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, toluca_id)
	VALUES
	(81, 'Av. Universidad 123, Col. Universidad', '09:00:00', 'Ernesto Ramírez', 'Gerente', 55000, 2),
	(82, 'Calle López Mateos 456, Col. Reforma', '10:00:00', 'Brenda Flores', 'Subgerente', 40000, 2),
	(83, 'Blvd. Miguel Alemán 789, Col. Centro', '08:30:00', 'Joel Martínez', 'Cajero', 22000, 2),
	(84, 'Av. Independencia 1011, Col. Industrial', '09:30:00', 'Araceli González', 'Asesor', 28000, 2),
	(85, 'Calle Guerrero 1213, Col. Nueva Oxtotitlán', '10:30:00', 'Kevin Hernández', 'Gerente', 60000, 2),
	(86, 'Av. Pino Suárez 1415, Col. Santa Ana Tlapaltitlán', '09:00:00', 'Zaira Rodríguez', 'Subgerente', 48000, 2),
	(87, 'Calle Ignacio Comonfort 1617, Col. San Mateo Otzacatipan', '08:00:00', 'Óscar Pérez', 'Cajero', 25000, 2),
	(88, 'Av. Alfredo del Mazo 1819, Col. San Lorenzo Tepaltitlán', '10:00:00', 'Monserrat García', 'Asesor', 32000, 2),
	(89, 'Calle Nicolás Bravo 2021, Col. San Pedro Totoltepec', '09:30:00', 'Emilio Ramírez', 'Gerente', 68000, 2),
	(90, 'Av. Vicente Guerrero 2223, Col. Cacalomacán', '11:00:00', 'Alexa Flores', 'Subgerente', 52000, 2);

-- Insert Into a sucursalcacalomacan
INSERT INTO sucursalcacalomacan (id, direccion, horasServicio, nombreEmpleados, cargoEmpleados, SueldoPorMes, toluca_id)
	VALUES
	(91, 'Av. Cacalomacán 123, Col. Cacalomacán', '09:00:00', 'Manuel Gómez', 'Gerente', 58000, 2),
	(92, 'Calle Morelos 456, Col. Reforma', '10:00:00', 'Lorena Herrera', 'Subgerente', 42000, 2),
	(93, 'Blvd. Adolfo López Mateos 789, Col. Centro', '08:30:00', 'Ismael Rodríguez', 'Cajero', 24000, 2),
	(94, 'Av. Solidaridad las Torres 1011, Col. Industrial', '09:30:00', 'Berenice Martínez', 'Asesor', 30000, 2),
	(95, 'Calle 16 de Septiembre 1213, Col. Nueva Oxtotitlán', '10:30:00', 'Saúl Pérez', 'Gerente', 62000, 2),
	(96, 'Av. Ignacio Comonfort 1415, Col. Santa Ana Tlapaltitlán', '09:00:00', 'Ximena González', 'Subgerente', 50000, 2),
	(97, 'Calle José María Morelos 1617, Col. San Mateo Otzacatipan', '08:00:00', 'Abraham Sánchez', 'Cajero', 26000, 2),
	(98, 'Av. Vicente Guerrero 1819, Col. San Lorenzo Tepaltitlán', '10:00:00', 'Mayte Ramírez', 'Asesor', 34000, 2),
	(99, 'Calle Benito Juárez 2021, Col. San Pedro Totoltepec', '09:30:00', 'Uriel Flores', 'Gerente', 70000, 2),
	(100, 'Av. 5 de Mayo 2223, Col. Universidad', '11:00:00', 'Jaqueline Martínez', 'Subgerente', 54000, 2);