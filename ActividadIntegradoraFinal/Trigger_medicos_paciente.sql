-- --------------------------------------------------------
-- TRIGGERS 2: Solo médicos pueden crear expedientes
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER tr_validar_medico_expediente
BEFORE INSERT ON expedientes_clinicos
FOR EACH ROW
BEGIN
    DECLARE rol_med TINYINT UNSIGNED;
    SELECT id_rol INTO rol_med FROM usuarios WHERE id_usuario = NEW.creado_por;
    IF rol_med != (SELECT id_rol FROM roles WHERE nombre_rol = 'medico') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solo los médicos pueden crear expedientes.';
    END IF;
END$$
DELIMITER ;