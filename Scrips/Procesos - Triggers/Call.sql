-- Ejecutar o mandar a llamar los Procedures
CALL aumentar_salario(2, 13);  -- Aumenta el salario del empleado con id 2 en un 13%
CALL calcular_horasDeTrabajo (3);   

-- Ejecutar o mandar a llamar los Funtions
SELECT salario_anual(50000);  -- Devuelve el salario anual de un empleado que gana 50000 al mes
SELECT pertenece_a_departamento(1, 5);

-- Ejecutar o mandar a llamar los Views
SELECT * FROM CEO_Contacto;  -- Muestra la informacion o contacto del CEO
SELECT * FROM JuntaDirectiva_Integrantes; -- Muestra los integrantes de la junta directiva


-- En el caso de los Triggers. Estos al ser disparadores se ejecutan al cumplir dicho evento antes o despues.