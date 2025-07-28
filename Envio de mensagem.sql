USE `insight_place`;
DROP procedure IF EXISTS `insight_place`.`novoAluguel_25`;
DELIMITER $$
USE `insight_place`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_25`
(vAluguel VARCHAR (255), vCliente VARCHAR (255), vHospedagem VARCHAR (255), vDataInicio DATE, vDataFinal DATE, vPrecoUnitario DECIMAL (10,2))
BEGIN
	DECLARE vDias INT DEFAULT 0;
    DECLARE vPrecoTotal DECIMAL (10,2);
    DECLARE vMensagem VARCHAR(100);
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
        SET vMensagem = 'Problema de chave estrangeira associado a alguma entidade da base.';
        SELECT vMensagem;
    END;
    SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
    SET vPrecoTotal = vDias * vPrecoUnitario;
    INSERT INTO reservas VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
     SET vMensagem = 'Aluguel incluido na base com sucesso.';
    SELECT vMensagem;
END$$

DELIMITER ;

CALL novoAluguel_25('10006', '1004', '8635', '2023-03-13', '2023-03-16', 40);

SELECT * 
FROM clientes
WHERE cliente_id = '10001';