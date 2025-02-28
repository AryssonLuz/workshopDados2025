/* Código lógico da Loja de roupa: */

CREATE TABLE Produto (
    Nome VARCHAR,
    Codigo_do_Produto INTEGER PRIMARY KEY,
    Estoque INTEGER,
    Categoria VARCHAR,
    Codigo_do_Fabricante INTEGER,
    fk_Categoria_Codigo_de_Categoria INTEGER,
    UNIQUE (Codigo_do_Fabricante, fk_Categoria_Codigo_de_Categoria)
);

CREATE TABLE Fabricante (
    Nome VARCHAR,
    Numero_de_telefone INTEGER,
    Codigo_do_fabricante INTEGER PRIMARY KEY,
    CNPJ INTEGER,
    Endereco VARCHAR
);

CREATE TABLE Loja (
    Codigo_da_Loja INTEGER PRIMARY KEY,
    Endereco VARCHAR,
    Nome VARCHAR,
    CNPJ INTEGER
);

CREATE TABLE Cliente (
    Numero_de_telefone INTEGER,
    E_mail VARCHAR,
    Nome VARCHAR,
    Codigo_do_Cliente INTEGER PRIMARY KEY,
    CPF INTEGER
);

CREATE TABLE Vendedor (
    Numero_de_telefone INTEGER,
    Codigo_do_Vendedor INTEGER PRIMARY KEY,
    E_mail VARCHAR,
    Nome VARCHAR,
    CPF INTEGER
);

CREATE TABLE Pedido (
    Codigo_do_Vendedor INTEGER,
    Data_do_Pedido DATE,
    Codigo_do_Cliente INTEGER,
    Codigo_do_Pedido INTEGER PRIMARY KEY,
    Valor_total FLOAT,
    UNIQUE (Codigo_do_Cliente, Codigo_do_Vendedor)
);

CREATE TABLE Categoria (
    Nome VARCHAR,
    Codigo_de_Categoria INTEGER PRIMARY KEY
);

CREATE TABLE Fabrica (
    fk_Produto_Codigo_do_Produto INTEGER,
    fk_Produto_Codigo_do_Fabricante INTEGER,
    fk_Fabricante_Codigo_do_fabricante INTEGER
);

CREATE TABLE Realiza (
    fk_Pedido_Codigo_do_Vendedor INTEGER,
    fk_Pedido_Codigo_do_Cliente INTEGER,
    fk_Pedido_Codigo_do_Pedido INTEGER,
    fk_Cliente_Codigo_do_Cliente INTEGER
);

CREATE TABLE Atende (
    fk_Pedido_Codigo_do_Vendedor INTEGER,
    fk_Pedido_Codigo_do_Cliente INTEGER,
    fk_Pedido_Codigo_do_Pedido INTEGER,
    fk_Vendedor_Codigo_do_Vendedor INTEGER
);

CREATE TABLE Contrata (
    fk_Loja_Codigo_da_Loja INTEGER,
    fk_Vendedor_Codigo_do_Vendedor INTEGER
);

CREATE TABLE Contem (
    fk_Pedido_Codigo_do_Vendedor INTEGER,
    fk_Pedido_Codigo_do_Cliente INTEGER,
    fk_Pedido_Codigo_do_Pedido INTEGER,
    fk_Produto_Codigo_do_Produto INTEGER,
    fk_Produto_Codigo_do_Fabricante INTEGER
);
 
ALTER TABLE Produto ADD CONSTRAINT FK_Produto_2
    FOREIGN KEY (fk_Categoria_Codigo_de_Categoria)
    REFERENCES Categoria (Codigo_de_Categoria)
    ON DELETE RESTRICT;
 
ALTER TABLE Fabrica ADD CONSTRAINT FK_Fabrica_1
    FOREIGN KEY (fk_Produto_Codigo_do_Produto, fk_Produto_Codigo_do_Fabricante???)
    REFERENCES Produto (Codigo_do_Produto, ???)
    ON DELETE RESTRICT;
 
ALTER TABLE Fabrica ADD CONSTRAINT FK_Fabrica_2
    FOREIGN KEY (fk_Fabricante_Codigo_do_fabricante)
    REFERENCES Fabricante (Codigo_do_fabricante)
    ON DELETE SET NULL;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_1
    FOREIGN KEY (fk_Pedido_Codigo_do_Vendedor???, fk_Pedido_Codigo_do_Cliente???, fk_Pedido_Codigo_do_Pedido)
    REFERENCES Pedido (???, ???, Codigo_do_Pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_2
    FOREIGN KEY (fk_Cliente_Codigo_do_Cliente)
    REFERENCES Cliente (Codigo_do_Cliente)
    ON DELETE SET NULL;
 
ALTER TABLE Atende ADD CONSTRAINT FK_Atende_1
    FOREIGN KEY (fk_Pedido_Codigo_do_Vendedor???, fk_Pedido_Codigo_do_Cliente???, fk_Pedido_Codigo_do_Pedido)
    REFERENCES Pedido (???, ???, Codigo_do_Pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE Atende ADD CONSTRAINT FK_Atende_2
    FOREIGN KEY (fk_Vendedor_Codigo_do_Vendedor)
    REFERENCES Vendedor (Codigo_do_Vendedor)
    ON DELETE SET NULL;
 
ALTER TABLE Contrata ADD CONSTRAINT FK_Contrata_1
    FOREIGN KEY (fk_Loja_Codigo_da_Loja)
    REFERENCES Loja (Codigo_da_Loja)
    ON DELETE RESTRICT;
 
ALTER TABLE Contrata ADD CONSTRAINT FK_Contrata_2
    FOREIGN KEY (fk_Vendedor_Codigo_do_Vendedor)
    REFERENCES Vendedor (Codigo_do_Vendedor)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (fk_Pedido_Codigo_do_Vendedor???, fk_Pedido_Codigo_do_Cliente???, fk_Pedido_Codigo_do_Pedido)
    REFERENCES Pedido (???, ???, Codigo_do_Pedido)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_2
    FOREIGN KEY (fk_Produto_Codigo_do_Produto, fk_Produto_Codigo_do_Fabricante???)
    REFERENCES Produto (Codigo_do_Produto, ???)
    ON DELETE SET NULL;