CALL listaClientes;	
CALL listaHospedagens;
CALL tiposDados;
CALL novoAluguel_22;
CALL novoAluguel_23('10003', '1003', '8635', '2023-03-06', '2023-03-10', 600);
CALL novoAluguel_24('10005', '1003', '8635', '2023-03-13', '2023-03-16', 40);

SELECT * 
FROM reservas
WHERE reserva_id = '10005';