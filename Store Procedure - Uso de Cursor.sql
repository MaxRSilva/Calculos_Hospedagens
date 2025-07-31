DROP TEMPORARY TABLE IF EXISTS temp_nomes;
CREATE TEMPORARY TABLE temp_nomes (nome VARCHAR (255));
CALL inclui_usuarios_lista_52('Maria,José,João,Gabriel,Rafael');


SELECT * FROM temp_nomes;
CALL looping_cursor_54();