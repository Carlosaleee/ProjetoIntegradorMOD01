USE projetoIntegrador;

INSERT INTO cliente(idCliente, nome, cpf, rua, numero, balneario, cidade)
VALUES ();



INSERT INTO cliente(idCliente, nome, cpf, rua, numero, balneario, cidade)
VALUES ();


INSERT INTO esquadria (idEsquadria, nomeEsquadria, descricao, valormetroQuadrado, distribuidorAluminioId)
VALUES (1,'Tela de Proteção','','','','','');

 
INSERT INTO cargo (idCargo, cargo, descricao, salario)
VALUES ('Gerente', 5000, null),
	('Vendedor', 2500, 10),
	('Serviços Gerais', 1500, null),
	('Supervisor de Vendas', 2800, 10),
	('Estoquista', 2000, null);

INSERT INTO usuario (idUsuario, login, senha, ultimoLogin)
VALUES 
	(1, 'admin','12345','2022-01-10 10:00:00'),
	(2, 'gerencia','67890','2022-01-10 10:00:00'),
	(3, 'dev','1q2w3e','2022-01-10 10:00:00');
    
    
INSERT INTO funcionario (idFuncionario, nome, dataAdmissao, dataDemissao, numcarteiratrabalho, rg, cpf, rua, numero, balneario, cidade, cargo_id, usuario_id)
VALUES ('Sílvio Cortês', '99 7898-1234', '84537768061', 2, 4),
	('Amaro Valadão', '99 7534-1234', '03074142057', 2, 5),
	('Marcos Valadão', '99 7534-7897', '40967947081', 2, 6);

select*from venda;

INSERT INTO venda (idVenda, dataVenda, dataEntrega, valor_total, cliente_id, funcionario_id)
VALUES 
(1, '2019-01-08 12:10', '2019-01-18 12:10', 'FINALIZADO', 0,50, 2, 'C', '6340509298359554',2,'2019-01-08 12:10'),
(2, '2019-01-08 16:10', '2019-01-18 16:10', 'FINALIZADO', 0,46, 1, 'D', null,1,'2019-01-08 16:10'),
(3, '2022-02-27 15:10', null, 'FATURADO', 0,167, 3, 'C', '7766114051786030',4,'2022-02-27 15:10');

SELECT*FROM item_venda ;

INSERT INTO item_venda (nome_produto, quantidade, valor_unitario, subtotal, venda_id, produto_id)
VALUES
( 'Ventilador de mesa', 2, 157.00, 314.00, 1, 2),
( 'Multiprocessador', 2, 117.00, 234.00, 1, 39),
( 'Chapinha cerâmica', 2, 462.00, 924.00, 1, 20),
( 'Aspirador de pó', 2, 108.00, 216.00, 1, 4);
 