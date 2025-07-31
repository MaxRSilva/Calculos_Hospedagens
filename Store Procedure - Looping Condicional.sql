USE `insight_place`;
DROP PROCEDURE IF EXISTS `novoAluguel_42`;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_42`(
    vAluguel VARCHAR(10),
    vClienteNome VARCHAR(150),
    vHospedagem VARCHAR(10),
    vDataInicio DATE,
    vDias INT,
    vPrecoUnitario DECIMAL(10,2)
)
BEGIN
    DECLARE vContador INT;
    DECLARE vDiaSemana INT;
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
    SET vNumCliente = (SELECT COUNT(*) FROM clientes WHERE nome = vClienteNome);
    CASE 
    WHEN vNumCliente = 0 THEN
        SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque não existe.';
        SELECT vMensagem;
    WHEN vNumCliente = 1 THEN
        -- SET vDias = (SELECT DATEDIFF (vDataFinal, vDataInicio));
        -- SET vDataFinal = (SELECT vDataInicio + INTERVAL vDias DAY) ;
        SET vContador = 1;
        SET vDataFinal = vDataInicio;
        WHILE vContador < vDias
        DO
            SET vDiaSemana = (SELECT DAYOFWEEK(STR_TO_DATE(vDataFinal,'%Y-%m-%d')));
            IF (vDiaSemana <> 7 AND vDiaSemana <> 1) THEN
                SET vContador = vContador + 1;
            END IF;
            SET vDataFinal = (SELECT vDataFinal + INTERVAL 1 DAY) ;
        END WHILE;
        SET vPrecoTotal = vDias * vPrecoUnitario;
        SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
        INSERT INTO reservas VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, 
        vDataFinal, vPrecoTotal);
        SET vMensagem = 'Aluguel incluido na base com sucesso.';
        SELECT vMensagem;
    WHEN vNumCliente > 1 THEN
       SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque não existe.';
       SELECT vMensagem;
    END CASE;
END$$

DELIMITER ;


CALL novoAluguel_42('10010', "Gabriela Pires", '8635', '2023-04-12',5, 40);

SELECT* FROM reservas WHERE reserva_id = '10010';