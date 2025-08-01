USE `insight_place`;
DROP PROCEDURE IF EXISTS `novoAluguel_32`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_32`
(
    vAluguel VARCHAR(255),
    vClienteNome VARCHAR(255),
    vHospedagem VARCHAR(255),
    vDataInicio DATE,
    vDataFinal DATE,
    vPrecoUnitario DECIMAL(10,2)
)
BEGIN
    DECLARE vCliente VARCHAR(100);
    DECLARE vDias INT DEFAULT 0;
    DECLARE vNumCliente INT;
    DECLARE vPrecoTotal DECIMAL(10,2);
    DECLARE vMensagem VARCHAR(100);

    DECLARE EXIT HANDLER FOR 1452
    BEGIN
        SET vMensagem = 'Problema de chave estrangeira associado a alguma entidade da base.';
        SELECT vMensagem;
    END;

    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);

    IF vNumCliente > 1 THEN 
        SET vMensagem = 'Este cliente não pode ser incluido pelo nome';
        SELECT vMensagem;
    
    ELSE 
        SET vDias = DATEDIFF(vDataFinal, vDataInicio);
        SET vPrecoTotal = vDias * vPrecoUnitario;
        SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
        INSERT INTO reservas VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
        SET vMensagem = 'Aluguel incluido na base com sucesso.';
        SELECT vMensagem;
    END IF;
END$$

DELIMITER ;

CALL novoAluguel_32('10008', "Júlia Pires", '8635', '2023-03-25', '2023-03-30', 40);



SELECT * FROM clientes WHERE nome = "Julia Pires";







