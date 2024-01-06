USE projetoIntegrador;

-- ------------------------------------------------
-- ------------------------------------------------


INSERT INTO venda (idVenda, dataVenda, dataEntrega, valorTotal, clienteId, funcionarioId)
VALUES 
(1, '2022-03-02 08:10:00', '2022-03-15 12:00:00', 240.00, 1, 5  );

INSERT INTO itemVenda (nomeEsquadria, quantidade, valorMetroQuadrado, altura, largura, valorUnitario, subTotal, vendaId, esquadriaId)
VALUES
( 'Tela de Proteção', 2, 160.00, 1.00, 0.75, 120.00, 240.00, 1, 1);

INSERT INTO pagamento (idPagamento, dataPagamento, tipoPagamento, vendaId, numeroCartao, numeroParcelas)
VALUES 
(1, '2022-03-02 08:10:00', 'D', '1', null, null );

-- ------------------------------------------------
-- ------------------------------------------------

INSERT INTO venda (idVenda, dataVenda, dataEntrega, valorTotal, clienteId, funcionarioId)
VALUES 
(2, '2022-04-04 09:30:00', '2022-04-20 11:30:00', 1083.00, 2, 5  );

INSERT INTO itemVenda (nomeEsquadria, quantidade, valorMetroQuadrado, altura, largura, valorUnitario, subTotal, vendaId, esquadriaId)
VALUES
('Box de Vidro', 1, 380.00, 1.90, 1.50, 1083.00, 1083.00, 2, 2);

INSERT INTO pagamento (idPagamento, dataPagamento, tipoPagamento, vendaId, numeroCartao, numeroParcelas)
VALUES 
(2, '2022-03-02 08:10:00', 'C', '2', 5150443238837875, 3 );

-- -------------------------------------------------
-- ------------------------------------------------

INSERT INTO venda (idVenda, dataVenda, dataEntrega, valorTotal, clienteId, funcionarioId)
VALUES 
(3, '2022-05-18 09:00:00', '2022-06-10 12:30:00', 4475.00, 4, 5  );

INSERT INTO itemVenda (nomeEsquadria, quantidade, valorMetroQuadrado, altura, largura, valorUnitario, subTotal, vendaId, esquadriaId)
VALUES
('Grades de Proteção', 5, 450.00, 1.00, 1.50, 675.00, 3375.00, 3, 5),
('Porta de Tela', 2, 0.00, 2.10, 0.90, 550.00, 1100.00, 3, 6);

INSERT INTO pagamento (idPagamento, dataPagamento, tipoPagamento, vendaId, numeroCartao, numeroParcelas)
VALUES 
(3, '2022-06-10 12:30:00', 'C', '3', 6453443238837875, 5 );

-- -------------------------------------------------
-- ------------------------------------------------

INSERT INTO venda (idVenda, dataVenda, dataEntrega, valorTotal, clienteId, funcionarioId)
VALUES 
(4, '2022-05-25 10:00:00', '2022-07-02 17:00:00', 9994.20, 3, 5  );

INSERT INTO itemVenda (nomeEsquadria, quantidade, valorMetroQuadrado, altura, largura, valorUnitario, subTotal, vendaId, esquadriaId)
VALUES
('Janela Linha Suprema 4 folhas', 2, 800.00, 1.00, 1.50, 1200.00, 2400.00, 4, 15),
('Veneziana Linha Suprema 6 folhas', 3, 950.00, 1.00, 1.50, 1425.00, 4275.00, 4, 19),
('Vitro Basculhante', 2, 0.00, 1.00, 0.60, 0.60, 900.00, 4, 20),
('Porta de Giro Fechada', 2, 640.00, 2.10, 0.90, 1209.60 , 2419.20 , 4, 7);

INSERT INTO pagamento (idPagamento, dataPagamento, tipoPagamento, vendaId, numeroCartao, numeroParcelas)
VALUES 
(4, '2022-05-25 10:00:00', 'C', '4', 876238837875, 10 );

-- -------------------------------------------------
-- ------------------------------------------------

SELECT * FROM venda;
SELECT * FROM itemVenda ;
SELECT * FROM esquadria;