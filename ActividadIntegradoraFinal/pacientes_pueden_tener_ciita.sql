-- --------------------------------------------------------
-- TRIGGERS 2: Solo pacientes pueden tener citas
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER tr_validar_paciente_cita
BEFORE INSERT ON citas
FOR EACH ROW
BEGIN
    DECLARE rol_pac TINYINT UNSIGNED;
    SELECT id_rol INTO rol_pac FROM usuarios WHERE id_usuario = NEW.id_paciente;
    IF rol_pac != (SELECT id_rol FROM roles WHERE nombre_rol = 'paciente') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solo los pacientes pueden tener citas.';
    END IF;
END$$
DELIMITER ;