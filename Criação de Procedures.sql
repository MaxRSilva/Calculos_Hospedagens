
USE `insight_place`;
DROP procedure IF EXISTS `insight_place`.`novoAluguel_21`;
DELIMITER $$
USE `insight_place`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_21`()
BEGIN
	DECLARE vAluguel VARCHAR (255) DEFAULT 10001;
    DECLARE vCliente VARCHAR (255) DEFAULT 1002;
    DECLARE vHospedagem VARCHAR (255) DEFAULT 8635;
    DECLARE vDataInicio DATE DEFAULT '2023-03-01';
    DECLARE vDataFinal DATE DEFAULT '2023-03-05';
    DECLARE vPrecoTotal DECIMAL (10,2) DEFAULT 550.23;
    SELECT vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal;
END$$

DELIMITER ;

USE `insight_place`;
DROP procedure IF EXISTS `insight_place`.`novoAluguel_22`;
DELIMITER $$
USE `insight_place`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_22`()
BEGIN
	DECLARE vAluguel VARCHAR (255) DEFAULT 10001;
    DECLARE vCliente VARCHAR (255) DEFAULT 1002;
    DECLARE vHospedagem VARCHAR (255) DEFAULT 8635;
    DECLARE vDataInicio DATE DEFAULT '2023-03-01';
    DECLARE vDataFinal DATE DEFAULT '2023-03-05';
    DECLARE vPrecoTotal DECIMAL (10,2) DEFAULT 550.23;
    INSERT INTO reservas VALUES ('10001', '1002', '8635', '2023-03-01', '2023-03-05', 550.2);
END$$

DELIMITER ;



USE `insight_place`;
DROP procedure IF EXISTS `insight_place`.`novoAluguel_23`;
DELIMITER $$
USE `insight_place`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_23`
(vAluguel VARCHAR (255), vCliente VARCHAR (255), vHospedagem VARCHAR (255), vDataInicio DATE, vDataFinal DATE, vPrecoTotal DECIMAL (10,2))
BEGIN
	
    INSERT INTO reservas  (reserva_id, cliente_id, hospedagem_id, data_inicio, data_fim, preco_total)
   VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
END$$novoAluguel_23

DELIMITER ;