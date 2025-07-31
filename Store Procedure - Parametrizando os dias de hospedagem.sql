USE `insight_place`;
DROP PROCEDURE IF EXISTS `novoAluguel_41`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_41`(
    vAluguel VARCHAR(10),
    vClienteNome VARCHAR(150),
    vHospedagem VARCHAR(10),
    vDataInicio DATE,
    vDias INT,
    vPrecoUnitario DECIMAL(10,2)
)
BEGIN
    DECLARE vCliente VARCHAR(10);
    DECLARE vDataFinal DATE;
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
            -- SET vDias = DATEDIFF(vDataFinal, vDataInicio);
            SET vDataFinal = (SELECT vDataInicio + INTERVAL vDias DAY);
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

CALL novoAluguel_41('10009', "Rafael Peixoto", '8635', '2023-04-01',5, 40);

SELECT* FROM reservas WHERE reserva_id = '10009';