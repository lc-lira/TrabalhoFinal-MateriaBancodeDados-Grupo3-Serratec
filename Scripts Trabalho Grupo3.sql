

//criando tabelas

CREATE TABLE CATEGORIA (
   id_categoria SERIAL PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT
);


CREATE TABLE PRODUTO (
   id_produto SERIAL PRIMARY KEY,
   nome VARCHAR(100) UNIQUE NOT NULL,
   descricao TEXT,
   unidade VARCHAR(100) NOT NULL,
   id_categoria INTEGER NOT NULL,
   CONSTRAINT fk_categoria FOREIGN KEY (id_categoria)
       REFERENCES CATEGORIA (id_categoria) ON DELETE RESTRICT
);


CREATE TABLE ESTOQUE (
   id_estoque SERIAL PRIMARY KEY,
   id_produto INTEGER NOT NULL,
   quantidade DECIMAL NOT NULL CHECK (quantidade >= 0),
   estoque_minimo DECIMAL NOT NULL,
   ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT fk_produto_estoque FOREIGN KEY (id_produto)
       REFERENCES PRODUTO (id_produto) ON DELETE RESTRICT
);


CREATE TABLE HISTORICO_PRECO (
   id_historico SERIAL PRIMARY KEY,
   id_produto INTEGER NOT NULL,
   preco DECIMAL(10,2) NOT NULL,
   data_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   motivo VARCHAR(100),
   CONSTRAINT fk_produto_preco FOREIGN KEY (id_produto)
       REFERENCES PRODUTO (id_produto) ON DELETE RESTRICT
);


CREATE TABLE VENDA (
   id_venda SERIAL PRIMARY KEY,
   data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   cliente VARCHAR(100),
   total DECIMAL(10,2) DEFAULT 0
);




//inserindo dados

—--------------As categorias de produtos—---------------------------- 
INSERT INTO CATEGORIA (id_categoria, nome) VALUES
(1, 'Bebidas'),
(2, 'Laticínios'),
(3, 'Hortifruti'),
(4, 'Padaria');
—------------------Lista de produtos—------------------------------------------------
INSERT INTO PRODUTO (id_produto, nome, unidade, id_categoria) values
(1, 'Leite UHT','L', 2),
(2, 'Queijo Prato','KG', 2),
(3, 'Iogurte Natural','ml', 2),
(4, 'Refrigerante Guaraná 2L', 'L', 1),
(5, 'Suco de Uva 1L', 'L',1),
(6, 'Água Mineral 500ml','ml', 1),
(7, 'Limão', 'KG',3),
(8, 'Banana', 'KG',3),
(9, 'Brócolis','KG', 3),
(10, 'Tomate', 'KG',3),
(11, 'Pão Francês','KG', 4),
(12, 'Pão de Forma','U', 4),
(13, 'Bolo de Chocolate','U', 4),
(14, 'Margarina','KG', 2),
(15, 'Beterraba', 'KG',3);
—---------------------Estoque —---------------------------------------
– OBS:  estoque baixo, id 8 - Banana, id 10 - Tomate, id 13 - Bolo de Chocolate, id 15 - Beterraba)
INSERT INTO ESTOQUE (id_estoque, id_produto, quantidade) VALUES
(1, 1, 50),
(2, 2, 20),
(3, 3, 15),
(4, 4, 40),
(5, 5, 25),
(6, 6, 100),
(7, 7, 10),
(8, 8, 8),   
(9, 9, 12),
(10, 10, 9), 
(11, 11, 60),
(12, 12, 30),
(13, 13, 5), 
(14, 14, 18),
(15, 15, 7);  
—--------------- Historico de preço 


INSERT INTO HISTORICO_PRECO (id_produto, preco, data_inicio) VALUES
( 1, 4.50, '2025-01-01 09:00:00'),
( 1, 4.99, '2025-03-01 09:00:00'),
( 2, 29.90, '2025-01-01 09:00:00'),
( 2, 32.90, '2025-03-01 09:00:00'),
( 3, 3.50, '2025-01-01 09:00:00'),
( 3, 3.99, '2025-03-01 09:00:00'),
( 4, 7.00, '2025-01-01 09:00:00'),
( 4, 7.50, '2025-03-01 09:00:00'),
( 5, 6.50, '2025-01-01 09:00:00'),
( 5, 6.99,'2025-03-01 09:00:00'),
( 6, 2.00, '2025-01-01 09:00:00'),
( 6, 2.20, '2025-03-01 09:00:00'),
( 7, 5.00, '2025-01-01 09:00:00'),
( 7, 5.50, '2025-03-01 09:00:00'),
( 8, 4.00, '2025-01-01 09:00:00'),
( 8, 4.50, '2025-03-01 09:00:00'),
( 9, 2.50, '2025-01-01 09:00:00'),
( 9, 2.99, '2025-03-01 09:00:00'),
( 10, 6.00, '2025-01-01 09:00:00'),
( 10, 6.80, '2025-03-01 09:00:00'),
( 11, 0.80, '2025-01-01 09:00:00'),
( 11, 0.90, '2025-03-01 09:00:00'),
( 12, 6.00, '2025-01-01 09:00:00'),
( 12, 6.50, '2025-03-01 09:00:00'),
(13, 15.00, '2025-01-01 09:00:00'),
( 13, 17.00, '2025-03-01 09:00:00'),
( 14, 8.00, '2025-01-01 09:00:00'),
(14, 8.90, '2025-03-01 09:00:00'),
( 15, 3.00, '2025-01-01 09:00:00'),
(15, 3.50, '2025-03-01 09:00:00');




—--------------------------  Vendas- minimo de 10 vendas—------------------------------




INSERT INTO VENDA (id_venda, data_venda, cliente, total) VALUES
(1, '2025-03-10 09:15:00', 'João Silva', 19.77),
(2, '2025-03-10 11:40:00', 'Lucas Soares', 39.60),
(3, '2025-03-10 17:20:00', 'Maria Souza', 41.80),
(4, '2025-03-11 10:05:00', 'Carlos Lima', 38.08),
(5, '2025-03-11 14:30:00', 'Douglas Barbosa', 28.49),
(6, '2025-03-12 09:50:00', 'Ana Paula', 27.18),
(7, '2025-03-12 13:10:00', 'Fernanda Rocha', 59.30),
(8, '2025-03-13 16:45:00', 'Carla Cristina', 25.09),
(9, '2025-03-14 12:25:00', 'Bruno Alves', 21.99),
(10, '2025-03-14 18:55:00', 'Juliana Costa', 45.37);




—---------------------------------------------------------------------------------




INSERT INTO ITEM_VENDA (id_venda, id_produto, quantidade, preco_unidade, subtotal) values


(1, 1, 2, 4.99, 9.98),
(1, 11, 6, 0.90, 5.40),
(1, 5, 1, 6.99, 6.99),


(2, 7, 2, 5.50, 11.00),
(2, 8, 3, 4.50, 13.50),
(2, 10, 1, 6.80, 6.80),
(2, 6, 4, 2.20, 8.80),


(3, 2, 1, 32.90, 32.90),
(3, 14, 1, 8.90, 8.90),


(4, 3, 2, 3.99, 7.98),
(4, 4, 1, 7.50, 7.50),
(4, 11, 8, 0.90, 7.20),
(4, 9, 2, 2.99, 5.98),
(4, 15, 2, 3.50, 7.00),


(5, 13, 1, 17.00, 17.00),
(5, 12, 1, 6.50, 6.50),
(5, 1, 1, 4.99, 4.99),


(6, 5, 2, 6.99, 13.98),
(6, 6, 6, 2.20, 13.20),


(7, 2, 1, 32.90, 32.90),
(7, 11, 10, 0.90, 9.00),
(7, 7, 2, 5.50, 11.00),
(7, 8, 2, 4.50, 9.00),


(8, 10, 2, 6.80, 13.60),
(8, 15, 3, 3.50, 10.50),
(8, 9, 1, 2.99, 2.99),


(9, 4, 2, 7.50, 15.00),
(9, 5, 1, 6.99, 6.99),


(10, 1, 1, 4.99, 4.99),
(10, 3, 2, 3.99, 7.98),
(10, 12, 1, 6.50, 6.50),
(10, 14, 1, 8.90, 8.90),
(10, 13, 1, 17.00, 17.00)



//consultas e querys

//C1 
SELECT p.nome AS NomeProduto,
           p.unidade,
           c.nome AS Categoria
FROM produto p INNER JOIN categoria c ON p.id_categoria = c.id_categoria
ORDER BY p.id_categoria  ASC, p.nome asc;




//C2
SELECT p.nome AS NomeProduto,
      e.quantidade AS EstoqueAtual,
      e.estoque_minimo AS EstoqueMinimo
FROM estoque e
INNER JOIN produto p ON e.id_produto = p.id_produto
ORDER by e.quantidade asc;




//C3

SELECT  p.nome AS NomeProduto,
               h.preco AS PrecoAtual,
               h.data_inicio,
               h.motivo
FROM historico_preco h
LEFT JOIN produto p ON p.id_produto = p.id_produto
ORDER BY p.nome ASC, h.data_inicio DESC;


//C4

SELECT p.nome,
              h.preco,
              h.data_inicio
FROM historico_preco h
INNER JOIN produto p ON h.id_produto = p.id_produto
where h.data_inicio = (select MAX(h.data_inicio) from historico_preco h where p.id_produto = h.id_produto);


//C5

select v.id_venda,
	 v.data_venda as data,
	v.cliente as cliente,
	 sum(i.quantidade) as qtd_itens,
	 sum(i.quantidade * i.preco_unidade) as total_venda
from venda v   
inner join item_venda i on v.id_venda = i.id_venda
group by v.id_venda;


//C6

SELECT p.nome,
      sum(v.quantidade) as "Unidades vendidas no total",
  		c.nome as categoria
FROM produto p
INNER JOIN item_venda v ON v.id_produto = p.id_produto
INNER JOIN categoria c ON p.id_categoria = c.id_categoria
group by p.nome, c.nome
limit 5;


//C7

SELECT DISTINCT ON (h.id_produto)
  p.nome,
  h.preco as "preço atual",
  e.quantidade,
  e.estoque_minimo
FROM historico_preco h
INNER JOIN produto p ON h.id_produto = p.id_produto
inner join estoque e on h.id_produto = e.id_produto
WHERE e.quantidade <= e.estoque_minimo
ORDER BY h.id_produto, h.data_inicio DESC;


//C8

SELECT c.nome,
      SUM(v.preco_unidade * v.quantidade) AS faturamento_total
FROM item_venda v
INNER JOIN produto p ON v.id_produto = p.id_produto
INNER JOIN categoria c ON p.id_categoria = c.id_categoria
GROUP BY c.nome;


//desafio

//1
SELECT p.nome AS NomeProduto,
    e.quantidade AS EstoqueAtual,
    e.estoque_minimo AS EstoqueMinimo
FROM estoque e INNER JOIN produto p ON e.id_produto = p.id_produto
WHERE e.quantidade < e.estoque_minimo


//2
SELECT p.nome AS NomeProduto,
    e.quantidade AS EstoqueAtual,
    e.estoque_minimo AS EstoqueMinimo,
    h.preco * 1.15 as PrecoAlterado 
FROM estoque e INNER JOIN produto p ON e.id_produto = p.id_produto
inner join  historico_preco h on p.id_produto = h.preco  
WHERE e.quantidade < e.estoque_minimo



//3
insert into historico_preco(id_produto, preco, data_inicio)
select
p.id_produto,
h.preco * 1.15,
now()
from produto p
join estoque e
on p.id_produto  = e.id_estoque
join historico_preco h on p.id_produto = h.preco  
where e.quantidade < e.estoque_minimo



//4

SELECT p.nome,
              h.preco,
              h.data_inicio
FROM historico_preco h
INNER JOIN produto p ON h.id_produto = p.id_produto
where h.data_inicio = (select MAX(h.data_inicio) from historico_preco h where p.id_produto = h.id_produto)


//c4
      
SELECT DISTINCT ON (h.id_produto)
   p.nome,
   h.preco,
   h.data_inicio
FROM historico_preco h
INNER JOIN produto p ON h.id_produto = p.id_produto
ORDER BY h.id_produto, h.data_inicio DESC;

//c7

SELECT DISTINCT ON (h.id_produto)
  p.nome,
  h.preco as "preço atual",
  e.quantidade,
  e.estoque_minimo
FROM historico_preco h
INNER JOIN produto p ON h.id_produto = p.id_produto
inner join estoque e on h.id_produto = e.id_produto
WHERE e.quantidade <= e.estoque_minimo
ORDER BY h.id_produto, h.data_inicio DESC;
 










