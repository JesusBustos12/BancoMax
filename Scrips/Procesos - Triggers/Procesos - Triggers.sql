-- Triggers
DELIMITER //
CREATE TRIGGER validar_edad_inversionistas
BEFORE INSERT ON inversionistas
FOR EACH ROW
BEGIN
    IF NEW.edad < 18 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No se pueden insertar empleados menores de 18 años.';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER evitar_eliminar_departamento
BEFORE DELETE ON departamentogeneral
FOR EACH ROW
BEGIN
    DECLARE num_empleados INT;
    SELECT COUNT(*) INTO num_empleados FROM Empleados WHERE idDepartamento = OLD.id;
    IF num_empleados > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar el departamento porque tiene empleados asignados.';
    END IF;
END //
DELIMITER;

-- Elimina Trigger validar_edad_inversionistas
DROP TRIGGER validar_edad_inversionistas;


-- Procedures
DELIMITER //
CREATE PROCEDURE aumentar_salario (IN id_empleado INT, IN porcentaje_aumento DECIMAL(5,2))
BEGIN
    UPDATE sucursalUniversidad SET sueldoPorMes = sueldoPorMes * (1 + porcentaje_aumento/100) WHERE id = id_empleado;
END //
DELIMITER;

DELIMITER //
CREATE PROCEDURE calcular_horasDeTrabajo (IN id_empleado INT)
BEGIN
    DECLARE horasServicio DATE;
    SELECT horasServicio INTO horasServicio FROM sucursaluniversidad WHERE id = id_empleado;
END //
DELIMITER;

-- Elimina el procedure 
Drop Procedure calcular_horasDeTrabajo;

-- Funtions
DELIMITER //
CREATE FUNCTION salario_anual (salario_mensual DECIMAL(10,2))
RETURNS DECIMAL(10,2)
READS SQL DATA 
BEGIN
    DECLARE salario_anual DECIMAL(10,2);
    SET salario_anual = salario_mensual * 12;
    RETURN salario_anual;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION pertenece_a_departamento (id_empleado INT, id_departamento INT)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE pertenece BOOLEAN;
    SELECT COUNT(*) INTO pertenece FROM Empleados WHERE id = id_empleado AND idDepartamento = id_departamento;
    RETURN pertenece > 0;
END //
DELIMITER //

-- Views
CREATE VIEW CEO_Contacto AS
SELECT F1.nombreCompleto AS NombreCEO, C.responsabilidades AS Responsabilidades, C.departamentosAcargo AS DepartamentosACargo, B.numContacto AS NumeroContactoBanco
FROM CEO C
JOIN Fundador1 F1 ON C.Fundador1_id = F1.id
JOIN BancoMax B ON F1.juntaDirectiva_id = B.id;

CREATE VIEW JuntaDirectiva_Integrantes AS
SELECT N.nombreCompleto AS NombreIntegrante, F1.edad AS EdadFundador1, F1.cargoJuntaDirectiva AS CargoFundador1, F2.edad AS EdadFundador2, F2.cargoJuntaDirectiva AS CargoFundador2
FROM NombresIntegrantesJuntaDirectiva N
LEFT JOIN Fundador1 F1 ON N.id = F1.juntaDirectiva_id
LEFT JOIN Fundador2 F2 ON N.id = F2.juntaDirectiva_id;

Drop View juntadirectiva_integrantes;