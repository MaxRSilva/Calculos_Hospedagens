SELECT DATEDIFF ('2023-04-03', '2023-04-01') AS diferenca_dias;  	

USE `insight_place`;
DROP procedure IF EXISTS `insight_place`.`novoAluguel_24`;
DELIMITER $$
USE `insight_place`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_24`
(vAluguel VARCHAR (255), vCliente VARCHAR (255), vHospedagem VARCHAR (255), vDataInicio DATE, vDataFinal DATE, vPrecoUnitario DECIMAL (10,2))
BEGIN
	DECLARE vDias INT DEFAULT 0;
    DECLARE vPrecoTotal DECIMAL (10,2);
    SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
    SET vPrecoTotal = vDias * vPrecoUnitario;
    INSERT INTO reservas VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
END$$novoAluguel_23

DELIMITER ;