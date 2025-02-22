Create Schema desafio;

Create Table `desafio`.`Produto`(
`ProdutoID` Int Not Null,
`Nome` Varchar(50) Null,
`Valor` Float Null,
`DataFabricação` Date Null,
`DataValidade` Date Null,
Primary Key(`ProdutoID`));

Alter Table produto
Add Column Estoque Int Null;

Alter Table produto
Drop Column DataFabricação,
Drop Column DataValidade;

Alter Table produto
Add Column Tipo Varchar(50) Null;

Insert Into produto(ProdutoID,Nome,Valor,Estoque,Tipo)
Values 
(101, 'Arroz', 5.50, 100, 'Grãos e Cereais'),
(102, 'Leite', 3.00, 150, 'Laticínios'),
(103, 'Feijão', 4.75, 200, 'Grãos e Cereais'),
(104, 'Pão', 2.25, 250, 'Panificados'),
(105, 'Suco de Laranja', 5.00, 300, 'Bebidas'),
(106, 'Manteiga', 4.75, 350, 'Laticínios'),
(107, 'Café', 8.50, 400, 'Bebidas'),
(108, 'Atum em Lata', 3.50, 450, 'Enlatados'),
(109, 'Açúcar', 2.80, 500, 'Grãos e Cereais'),
(110, 'Iogurte', 2.99, 550, 'Laticínios');


Create Table `desafio`.`Transação`(
`TransaçãoID` Int Not Null,
`ProdutoID` Int NUll,
`Produtos1` Int NUll,
`Produtos2` Int NUll,
`Produtos3` Int NUll,
`Estoque` Int Null,
Primary Key(`TransaçãoID`));

Alter Table transação
Drop Column Estoque;

Alter Table transação
Modify Column Produtos1 Varchar(50) null,
Modify Column Produtos2 Varchar(50) null,
Modify Column Produtos3 Varchar(50) null;


Insert Into transação(TransaçãoID,ProdutoID,Produtos1,Produtos2,Produtos3)
Values 
(1, 101, 'Arroz', 'Feijão', 'Açúcar'),
(2, 102, 'Leite', 'Manteiga', 'Iogurte'),
(3, 103, 'Feijão', 'Arroz', 'Pão'),
(4, 104, 'Pão', 'Suco de Laranja', 'Café'),
(5, 105, 'Suco de Laranja', 'Leite', 'Manteiga'),
(6, 106, 'Café', 'Atum em Lata', 'Açúcar'),
(7, 107, 'Atum em Lata', 'Arroz', 'Pão'),
(8, 108, 'Iogurte', 'Leite', 'Café'),
(9, 109, 'Açúcar', 'Suco de Laranja', 'Arroz'),
(10, 110, 'Pão', 'Feijão', 'Iogurte');

### AÇÕES DE AGREGAÇÕES ###

#1.Somas do valor de todos os produtos que tem na tabela produtos:
Select Sum(Valor)
From produto;
# Dão 43 de soma no total de todos os produtos!


#2.Selecionar todas as os produtos que são grãos e cereais:
Select Count(Tipo)
From produto
Where Tipo = 'Grãos e Cereais';
# São 3 produtos que são do tipo de grãos e cereais!

#3.Saber qual é a medio dos preços dos produtos na tabela:
Select Avg(Valor)
From produto;
# Da a media de 4,3!

### AÇÕES DE AGRUPAMENTOS ###

#1.Selecionar duas tabelas e ver o nome do produto, valor, estoque e as 3 primeiras compras das transações:
Select produto.Nome, produto.Valor, produto.Estoque, transação.produtos1, transação.produtos2, transação.produtos3
from produto
Inner Join transação
on produto.ProdutoID = transação.ProdutoID;

#2.Selecionar o nome do produto e o valor em ordem decrescente
Select Nome,Valor
From produto
group by Nome,Valor
order by count(valor) DESC;
