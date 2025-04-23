-- Inserindo usuários
INSERT INTO USUARIO (nome, login) VALUES
('Ana Gerente', 'ana_g'),
('Carlos Func', 'carlos_f'),
('Bruna Gerente', 'bruna_g'),
('Daniel Func', 'daniel_f'),
('Eduardo Func', 'edu_f'),
('Fernanda Func', 'fer_f'),
('Gustavo Gerente', 'gusta_g'),
('Helena Func', 'helena_f'),
('Igor Func', 'igor_f'),
('Joana Func', 'joana_f');

-- Associando Gerentes
INSERT INTO GERENTE (usuario_id) VALUES (1), (3), (7);

-- Associando Funcionários
INSERT INTO FUNCIONARIO (usuario_id) VALUES (2), (4), (5), (6), (8), (9), (10);

-- Inserindo fornecedores
INSERT INTO FORNECEDOR (nome, contato, gerente_id) VALUES
('Fornecedor A', 'contato@a.com', 1),
('Fornecedor B', 'contato@b.com', 3),
('Fornecedor C', 'contato@c.com', 7),
('Fornecedor D', 'contato@d.com', 3),
('Fornecedor E', 'contato@e.com', 7),
('Fornecedor F', 'contato@f.com', 1),
('Fornecedor G', 'contato@g.com', 3),
('Fornecedor H', 'contato@h.com', 7),
('Fornecedor I', 'contato@i.com', 1),
('Fornecedor J', 'contato@j.com', 3);

INSERT INTO PRODUTO (nome, preco, quantidade, fornecedor_id) VALUES
('Óculos de Grau Clássico', 250.00, 40, 1),
('Óculos de Sol Polarizado', 180.00, 30, 2),
('Óculos Esportivo', 300.00, 20, 3),
('Relógio Masculino', 400.00, 15, 4),
('Relógio Feminino', 420.00, 10, 5),
('Lentes de Contato - Caixa com 6', 150.00, 50, 6),
('Lenços para Limpeza de Lentes', 20.00, 100, 7),
('Spray Antiembaçante', 35.00, 80, 8),
('Estojo para Óculos', 25.00, 60, 9),
('Serviço de Reparo de Armação', 50.00, 200, 10); -- quantidade aqui representa serviços disponíveis

-- Inserindo estoque
INSERT INTO ESTOQUE (produto_id, quantidade_atual) VALUES
(1, 35),
(2, 28),
(3, 18),
(4, 12),
(5, 9),
(6, 48),
(7, 95),
(8, 75),
(9, 55),
(10, 195);

-- Inserindo vendas
INSERT INTO VENDA (data, total, funcionario_id) VALUES
('2025-04-01', 105.00, 2),
('2025-04-02', 50.25, 4),
('2025-04-03', 157.50, 5),
('2025-04-04', 32.00, 6),
('2025-04-05', 60.00, 8),
('2025-04-06', 123.00, 9),
('2025-04-07', 39.90, 10),
('2025-04-08', 189.00, 2),
('2025-04-09', 74.50, 5),
('2025-04-10', 142.00, 6);

-- Inserindo itens de venda
INSERT INTO ITEM_VENDA (venda_id, produto_id, quantidade, subtotal) VALUES
(1, 1, 5, 52.50),
(1, 2, 10, 52.50),
(2, 3, 2, 31.50),
(2, 4, 3, 18.75),
(3, 5, 5, 100.00),
(3, 6, 2, 24.60),
(4, 7, 8, 31.92),
(5, 8, 2, 37.80),
(6, 9, 5, 37.25),
(7, 10, 2, 28.40);

-- Inserindo pagamentos
INSERT INTO PAGAMENTO (valor, metodo, status, venda_id) VALUES
(105.00, 'Cartão', 'Pago', 1),
(50.25, 'Dinheiro', 'Pago', 2),
(157.50, 'Pix', 'Pago', 3),
(32.00, 'Cartão', 'Pendente', 4),
(60.00, 'Dinheiro', 'Pago', 5),
(123.00, 'Cartão', 'Pago', 6),
(39.90, 'Pix', 'Pago', 7),
(189.00, 'Cartão', 'Pago', 8),
(74.50, 'Dinheiro', 'Pago', 9),
(142.00, 'Pix', 'Pago', 10);
