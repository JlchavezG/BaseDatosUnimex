-- --------------------------------------------------------
-- TRIGGERS
-- --------------------------------------------------------
DELIMITER $$
CREATE TRIGGER tr_no_citas_pasado
BEFORE INSERT ON citas
FOR EACH ROW
BEGIN
    IF NEW.fecha_hora < NOW() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permiten citas en el pasado.';
    END IF;
END$$
DELIMITER ;