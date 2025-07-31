USE `insight_place`;
DROP procedure IF EXISTS `insight_place`.`novoAluguel_44`;
;

DELIMITER $$
USE `insight_place`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novoAluguel_44`(
    vClienteNome VARCHAR(150),
    vHospedagem VARCHAR(10),
    vDataInicio DATE,
    vDias INT,
    vPrecoUnitario DECIMAL(10,2)
)
BEGIN
    DECLARE vAluguel VARCHAR(10);
    DECLARE vCliente VARCHAR(10);
    DECLARE vDataFinal DATE;
    DECLARE vNumCliente INTEGER;
    DECLARE VPrecoTotal DECIMAL(10,2);
    DECLARE vMensagem VARCHAR(100);
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
        SELECT CAST(MAX(CAST(aluguel_id AS UNSIGNED)) + 1 AS CHAR) INTO vAluguel FROM alugueis;
        CALL calculaDataFinal_43 (vDataInicio, vDataFinal, vDias);
        SET vPrecoTotal = vDias * vPrecoUnitario;
        SELECT cliente_id INTO vCliente FROM clientes WHERE nome = vClienteNome;
        INSERT INTO alugueis VALUES (vAluguel, vCliente, vHospedagem, vDataInicio, 
        vDataFinal, vPrecoTotal);
        SET vMensagem = CONCAT('Aluguel incluido na base com sucesso. - ID ' , vAluguel) ;
        SELECT vMensagem;
    WHEN vNumCliente > 1 THEN
       SET vMensagem = 'Este cliente não pode ser usado para incluir o aluguel porque não existe.';
       SELECT vMensagem;
    END CASE;
END$$

DELIMITER ;

