DROP TEMPORARY TABLE IF EXISTS temp_nomes;
CREATE TEMPORARY TABLE temp_nomes (nome VARCHAR (255));
CALL inclui_usuarios_lista_52('Luana Moura,Enrico Correia,Paulo Vieira,Marina Nunes');


SELECT * FROM temp_nomes;