USE projetoIntegrador;

INSERT INTO venda (idVenda, dataVenda, dataEntrega, valorTotal, clienteId, funcionarioId)
VALUES 
(1, '2022-03-02 08:10:00', '2022-03-15 12:00:00', 240.00, 1, 2  );

INSERT INTO itemVenda (nomeEsquadria, quantidade, valorMetroQuadrado, altura, largura, valorUnitario, subTotal, vendaId, esquadriaId)
VALUES
( 'Tela de Proteção', 2, 160.00, 1.00, 0.75, 120.00, 240.00, 1, 1);

INSERT INTO pagamento (idPagamento, dataPagamento, tipoPagamento, vendaId, numeroCartao, numeroParcelas)
VALUES 
(1, '2022-03-02 08:10:00', 'D', '1', null, null );

SELECT * FROM venda;
SELECT * FROM itemVenda ;
SELECT * FROM esquadria;


INSERT INTO cliente(idCliente, nome, cpf, rua, numero, balneario, cidade)
VALUES 

(1, 'Adriano de Souza','29043921068','Rua Franca','470','Bal. Icarai','Ilha Comprida'),
(2, 'Gabriel Medina','22724372069','Rua Franca','470','Bal. Icarai','Ilha Comprida'),
(3, 'Felipe Toledo','59610341004','Rua Casa Verde','60','Bal. Leão de Iguape','Ilha Comprida'),
(4, 'Italo Ferreira','89476252057','Rua da Garças','38','Bal. Mar e Sol','Ilha Comprida'),
(5, 'Raissa Leal','41507587007','Rua das Papoulas','987','Bal. Porto Velho','Ilha Comprida'),
(6, 'Peterson Rosa','95837653090','Rua Cascata','160','Bal. Atlantico','Ilha Comprida'),
(7, 'Pamela Rosa','76798976034','Rua Rio Grande do Norte','540','Bal. Adriana','Ilha Comprida'),
(8, 'Gustavo Borges','49008644045','Rua Cuiaba','150','Bal. Adriana','Ilha Comprida'),
(9, 'Leticia Sabatela','29346675020','Rua Cuiaba','150','Bal. Adriana','Ilha Comprida'),
(10, 'Fabio Gouveia','44450569016','Rua Tino Gonsalves Dias','549','Bal. Britania','Ilha Comprida');


INSERT INTO telefoneCliente (idTelefoneCliente, telefone, clienteId)
VALUES 

(1,'11 96214 6625', 1),
(2,'11 98402 3155', 2),
(3,'13 99876 6578', 3),
(4,'13 99777 0301', 4),
(5,'15 99757 6618', 5),
(6,'13 99764 7676', 6),
(7,'11 99876 9956', 7),
(8,'67 99876 4433', 8),
(9,'15 99764 8201', 9),
(10,'11 94910 5239', 10);

INSERT INTO usuario (idUsuario, login, senha, ultimoLogin)
VALUES 
	(1, 'admin', '123456A','2023-01-02 08:00:00'),
	(2, 'proprietario','123456B','2023-01-02 08:00:00'),
	(3, 'gerente', '123456C','2023-01-02 08:00:00'),
    (4, 'serralherio', '123456D','2023-01-02 08:00:00'),
	(5, 'meioOficial', '123456E','2023-01-02 08:00:00'),
	(6, 'vendedor', '123456F','2023-01-02 08:00:00');
    
    INSERT INTO cargo (idCargo, cargo, descricao, salario, beneficios, assistenciaMedica, valeTransporte, valeAlimentacao)
VALUES 
	
(1,'Proprietario', 'Responsavel pela Loja', 8000.00, null, null, null, null),    
(2,'Gerente','- Gerencia os Funcionários, cuida da parte Administrativa',  7000, 'S', 'S', null, 'S'),
(3,'Serralheiro Alumínio', 'Profissional que fabrica e executa as instalações', 5000, 'S', 'S', 'S', 'S'),
(4,'Meio Oficial','Profissional que auxilia o Serralheiro', 3000, 'S', 'S', null, 'S'),
(5,'Vendedor', 'Supervisor de Vendas', 3000.00, 'S', null, null, 'S');


INSERT INTO funcionario (idFuncionario, nome, dataAdmissao, dataDemissao, numcarteiratrabalho, rg, cpf, rua, numero, bairro, cidade, cargoId, usuarioId)
VALUES 
(1,'Edson Gularte da Silva', '2001-01-01 08:00:00', '0000-00-00 08:00:00', '000.000.000-00' ,'00000000000', '00000000000',  'Avenida Copacabana','798', 'Bal. Monte Carlo', 'Ilha Comprida', '2', '1'),
(2,'Carlos Alexandre da Silva', '2001-01-01 08:00:00', '0000-00-00 08:00:00', '000.000.000-00', '00000000000', '00000000000', 'Alamenda São Judas Tadeu','805', 'Bal. Britania', 'Ilha Comprida', '2', '3'),
(3,'Miguel Gularte', '2010-01-01 08:00:00', '0000-00-00 08:00:00', '000.000.000-00', '00000000000', '00000000000', 'Alamenda São Judas Tadeu','805', 'Bal. Britania', 'Ilha Comprida', '3', '4'),
(4,'Bernardo Gularte', '2016-01-01 08:00:00', '0000-00-00 08:00:00', '000.000.000-00', '00000000000', '00000000000', 'Alamenda São Paulo','200', 'Bal. Adriana', 'Ilha Comprida', '4', '5'),
(5,'Ana Paula', '2001-01-01 08:00:00', '0000-00-00 08:00:00', '000.000.000-00', '00000000000', '00000000000', 'Alamenda São Judas Tadeu','805', 'Bal. Britania', 'Ilha Comprida','5', '6');
	
 UPDATE `projetointegrador`.`funcionario` SET `cargoId` = '1' WHERE (`idFuncionario` = '1');
   
    
INSERT INTO telefoneFuncionario(idtelefoneFuncionario, telefone, funcionarioId)
VALUES 

(1,'13 99876 1234', 1),
(2,'13 99876 6754', 1),
(3,'13 99876 6578', 2),
(4,'13 99876 9098', 2),
(5,'13 99876 6677', 3),
(6,'13 99876 8755', 3),
(7,'13 99876 9834', 4),
(8,'13 99876 4321', 5);
    
INSERT INTO distribuidorAluminio(idDistribuidorAluminio, nomeEmpresa, cnpj, cidade)
VALUES 

(1,'Ideal Aluminio','000.000.000-00','Praia Grande'),
(2,'AlumiSantos','000.000.000-00','Santos'),
(3,'Ferragens Rodrigues','000.000.000-00','Sorocaba'),
(4,'Litoral Aluminio','000.000.000-00','Santos');

INSERT INTO telefoneDistribuidor(idtelefoneDistribuidor, telefone, setor, responsavel, distribuidoraluminioId)
VALUES	
(1,'13 99876 1234', 'Compras Aluminio', 'Neia','1'),
(2,'13 99876 5678', 'Administrativo', 'Paulo Roberto','1'),
(3,'13 93364 8156', 'Compras Aluminio', 'Raul','2'),
(4,'15 99876 7834', 'Compras Aluminio', 'Roberta','3'),
(5,'15 99876 7654', 'Compras Vidros Temperado', 'Marcia','3'),
(6,'15 99876 9834', 'Compras Acessorios', 'Julia','3'),
(7,'13 99833 9836', 'Compras Aluminio', 'Carlos','4');

INSERT INTO esquadria (idEsquadria, nomeEsquadria, descricao, valormetroQuadrado, distribuidorAluminioId)
VALUES 

(1,'Tela de Proteção','Tela de Proteção contra Insetos','160.00','1'),
(2,'Box de Vidro','Box de Vidro Temperado para Banho','380.00','3'),
(3,'Abrigo de Pia em Aluminio','Abrigo para Pia de Cozinha','500.00','1'),
(4,'Abrigo de Pia em Acrilico','Abrigo para Pia de Cozinha','300.00','2'),
(5,'Grades de Proteção','Grades de Proteção com Ferro','450.00','1'),
(6,'Porta de Tela ','Porta de Tela de Proteção contra Insetos','550.00','2'),
(7,'Porta de Giro Fechada','Porta de Giro fechada em Paletas','640.00','1'),
(8,'Portão Fechado Aluminio Branco','Portão de Alumínio Deslizante','750.00','1'),
(9,'Portão Fechado Aluminio Bronze','Portão de Alumínio Deslizante','800.00','2'),
(10,'Portão Fechado Lambril Simples','Portão de Alumínio Deslizante','750.00','4'),
(11,'Portão Fechado Lambril Duplo','Portão de Alumínio Deslizante','830.00','4'),
(12,'Portão de Regua','Portão de Alumínio Deslizante','750.00','1'),
(13,'Portão de Tubo Simples','Portão de Alumínio Deslizante','690.00','1'),
(14,'Janela Linha Suprema 2 folhas','Janela de Alumínio Branco com 2 folhas e vidro','600.00','3'),
(15,'Janela Linha Suprema 4 folhas','Janela de Alumínio Branco com 4 folhas e vidro','800.00','4'),
(16,'Janela Linha Vidro Temperado 4 folhas','Janela de Vidro Temperado com 4 folhas','900.00','3'),
(17,'Portão Social Fechado','Portão Social 2.10 x 0.90','950.00','1'),
(18,'Veneziana Linha Suprema 3 folhas','Janela para Quarto 3 folhas Deslizantes','800.00','1'),
(19,'Veneziana Linha Suprema 6 folhas','Janela para Quarto 6 folhas Deslizantes','950.00','1'),
(20,'Vitro Basculhante','Vitro Basculante para Banheiro','450.00','1');

SELECT * FROM esquadria; 

