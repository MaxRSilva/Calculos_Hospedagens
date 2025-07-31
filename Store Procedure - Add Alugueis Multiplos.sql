USE `insight_place`;
DROP procedure IF EXISTS `novosAlugueis_55`;

DELIMITER $$
USE `insight_place`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `novosAlugueis_55`(lista VARCHAR(255),
vHospedagem VARCHAR(10), vDataInicio DATE,
vDias INTEGER, vPrecoUnitario DECIMAL(10,2))
BEGIN
    DECLARE vClienteNome VARCHAR(150);
    DECLARE fimCursor INTEGER DEFAULT 0;
    DECLARE vnome VARCHAR(255);
    DECLARE cursor1 CURSOR FOR SELECT nome FROM temp_nomes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fimCursor = 1;
    DROP TEMPORARY TABLE IF EXISTS temp_nomes;
    CREATE TEMPORARY TABLE temp_nomes (nome VARCHAR(255));
    CALL inclui_usuarios_lista_52(lista);
    OPEN cursor1;
    FETCH cursor1 INTO vnome;
    WHILE fimCursor = 0 DO
        SET vClienteNome = vnome;
        CALL novoAluguel_44 (vClienteNome, vHospedagem, vDataInicio, vDias, vPrecoUnitario);
        FETCH cursor1 INTO vnome;
    END WHILE;
    CLOSE cursor1;
    DROP TEMPORARY TABLE IF EXISTS temp_nomes;
END$$

DELIMITER ;

CALL novosAlugueis_55('Gabriel Carvalho,Erick Oliveira,Catarina Correia,Lorena Jesus', '8635', '2023-06-03', 7, 45);


SELECT* FROM reservas WHERE reserva_id IN ('10011', '10012','10013','10014');