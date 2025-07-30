USE `insight_place`;
DROP PROCEDURE IF EXISTS `novoAluguel_35`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_35`(
    vAluguel VARCHAR(10),
    vClienteNome VARCHAR(150),
    vHospedagem VARCHAR(10),
    vDataInicio DATE,
    vDataFinal DATE,
    vPrecoUnitario DECIMAL(10,2)
)
BEGIN
    DECLARE vCliente VARCHAR(10);
    DECLARE vDias INTEGER DEFAULT 0;
    DECLARE vNumCliente INTEGER;
    DECLARE vPrecoTotal DECIMAL(10,2);
    DECLARE vMensagem VARCHAR(100);

    -- Tratador de erro para chave estrangeira
    DECLARE EXIT HANDLER FOR 1452
    BEGIN
        SET vMensagem = 'Problema de chave estrangeira associado a alguma entidade da base.';
        SELECT vMensagem;
    END;

    -- Verifica se o cliente existe
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);

    CASE 
        WHEN vNumCliente = 0 THEN
            SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque não existe.';
            SELECT vMensagem;
        
        WHEN vNumCliente = 1 THEN
            SET vDias = DATEDIFF(vDataFinal, vDataInicio);
            SET vPrecoTotal = vDias * vPrecoUnitario;
            SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
            INSERT INTO reservas 
            VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, vDataFinal, vPrecoTotal);
            SET vMensagem = 'Aluguel incluído na base com sucesso.';
            SELECT vMensagem;

        WHEN vNumCliente > 1 THEN
            SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque há duplicidade de nomes.';
            SELECT vMensagem;
    END CASE;
END$$

DELIMITER ;

CALL novoAluguel_33('10008', "Julia Pires", '8635', '2023-03-25', '2023-03-30', 40);
