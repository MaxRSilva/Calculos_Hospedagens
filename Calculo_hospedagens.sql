CALL listaClientes;	
CALL listaHospedagens;
CALL tiposDados;
CALL novoAluguel_22;
CALL novoAluguel_23('10003', '1003', '8635', '2023-03-06', '2023-03-10', 600);

SELECT * 
FROM reservas
WHERE reserva_id = '10003';