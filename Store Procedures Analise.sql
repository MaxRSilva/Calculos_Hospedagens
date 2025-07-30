

USE `insight_place`;
DROP procedure IF EXISTS `insight_place`.`novoAluguel_31`;
DELIMITER $$
USE `insight_place`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_31`
(vAluguel VARCHAR (255), vClienteNome VARCHAR (255), vHospedagem VARCHAR (255), vDataInicio DATE, vDataFinal DATE, vPrecoUnitario DECIMAL (10,2))
BEGIN
	DECLARE vCliente VARCHAR (100);
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
    SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
    INSERT INTO reservas VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
     SET vMensagem = 'Aluguel incluido na base com sucesso.';
    SELECT vMensagem;
END$$

DELIMITER ;

CALL novoAluguel_31('10007', 'Luana Moura', '8635', '2023-03-17', '2023-03-22', 40);

SELECT *
FROM reservas
WHERE reserva_id = '10007';