CREATE SCHEMA tbLojaSapato  ;
USE tbLojaSapato ;

CREATE TABLE tbPessoa (
  id  INT NOT NULL   PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(80) NOT NULL,
  cpf VARCHAR(15) NULL,
  endereco VARCHAR(80) NULL);

CREATE TABLE tbFuncionario (
  id INT NOT NULL   PRIMARY KEY AUTO_INCREMENT,
  carteira_trabalho VARCHAR(45) NOT NULL,
  turno_trabalho VARCHAR(20) NOT NULL,
  salario DECIMAL(10,2) NOT NULL,
  cargo VARCHAR(55) NOT NULL,
  id_pessoa INT  NOT NULL,
    FOREIGN KEY (id_pessoa)
    REFERENCES tbPessoa (id));

CREATE TABLE  tbProduto (
  id INT NOT NULL   PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  qntd_estoque INT NOT NULL);

CREATE TABLE tbCliente (
  id INT NOT NULL   PRIMARY KEY AUTO_INCREMENT,
  data_cadastro DATE NOT NULL,
  limite_cred DECIMAL(10,2) NULL,
  id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa)
    REFERENCES tbPessoa (id));

CREATE TABLE tbVenda (
  id INT NOT NULL   PRIMARY KEY AUTO_INCREMENT,
  data_venda DATE NOT NULL,
  data_receb DATE NOT NULL,
  forma_pagamento VARCHAR(45) NOT NULL,
  id_cli INT NOT NULL,
    FOREIGN KEY (id_cli)
    REFERENCES tbCliente (id));

CREATE TABLE  Itens_venda (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_prod INT NOT NULL,
  id_venda INT NOT NULL,
    FOREIGN KEY (id_prod)
    REFERENCES tbProduto (id),
    FOREIGN KEY (id_venda)
    REFERENCES tbVenda (id));

CREATE TABLE Registro_venda (
  id INT NOT NULL  PRIMARY KEY AUTO_INCREMENT,
  id_func INT NOT NULL,
  id_venda INT NOT NULL,
    FOREIGN KEY (id_func)
    REFERENCES tbFuncionario (id),
    FOREIGN KEY (id_venda)
    REFERENCES tbVenda (id));
