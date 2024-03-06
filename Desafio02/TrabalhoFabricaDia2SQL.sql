CREATE DATABASE sistemaLivros;
use sistemaLivros;


CREATE TABLE Venda (
    idVenda INTEGER PRIMARY KEY,
    idCliente INTEGER,
    idLivro INTEGER,
    quantidade INTEGER,
    idVendedor INTEGER,
    idEndereco INTEGER,
    dataVenda DATE
);

CREATE TABLE Cliente (
    idCliente INTEGER PRIMARY KEY,
    idContato INTEGER,
    nome VARCHAR(70),
    dataNascimento DATE,
    genero VARCHAR(20),
    statusCliente BOOLEAN
);

CREATE TABLE Vendedor (
    idVendedor INTEGER PRIMARY KEY,
    nome VARCHAR(70),
    idContato INTEGER,
    genero VARCHAR(20),
    dataNascimento DATE
);

CREATE TABLE Livro (
    idLivro INTEGER PRIMARY KEY,
    titulo VARCHAR(35),
    autor VARCHAR(70),
    classificacao INTEGER,
    generoLiterario VARCHAR(30),
    idEditora INTEGER,
    preco FLOAT,
    dataLancamento DATE
);

CREATE TABLE Editora (
    nome VARCHAR(70),
    fundacao DATE,
    idEditora INTEGER PRIMARY KEY
);

CREATE TABLE Endereco (
    idEndereco INTEGER PRIMARY KEY,
    rua VARCHAR(100),
    numero INTEGER,
    complemento VARCHAR(50),
    bairro VARCHAR(30),
    cidade VARCHAR(30),
    cep VARCHAR(10)
);

CREATE TABLE Contato (
    idContato INTEGER PRIMARY KEY,
    email VARCHAR(35),
    telefone VARCHAR(15)
);

CREATE TABLE Contem (
    fk_Livro_idLivro INTEGER,
    fk_Venda_idVenda INTEGER
);

CREATE TABLE Fornece (
    fk_Editora_idEditora INTEGER,
    fk_Livro_idLivro INTEGER
);

CREATE TABLE Realiza (
    fk_Vendedor_idVendedor INTEGER,
    fk_Venda_idVenda INTEGER
);

CREATE TABLE Possui (
    fk_Endereco_idEndereco INTEGER,
    fk_Venda_idVenda INTEGER
);

CREATE TABLE Participa (
    fk_Cliente_idCliente INTEGER,
    fk_Venda_idVenda INTEGER
);

CREATE TABLE Tem (
    fk_Contato_idContato INTEGER,
    fk_Cliente_idCliente INTEGER
);

CREATE TABLE detem (
    fk_Vendedor_idVendedor INTEGER,
    fk_Contato_idContato INTEGER
);
 
ALTER TABLE Venda ADD CONSTRAINT FK_Venda_2
    FOREIGN KEY (idCliente)
	REFERENCES Cliente (idCliente);

ALTER TABLE Venda ADD CONSTRAINT FK_Venda_3
    FOREIGN KEY (idLivro)
	REFERENCES Livro (idLivro);
   
   ALTER TABLE Venda ADD CONSTRAINT FK_Venda_4
    FOREIGN KEY (idVendedor)
	REFERENCES Vendedor (idVendedor);

ALTER TABLE Venda ADD CONSTRAINT FK_Venda_5
    FOREIGN KEY (idEndereco)
	REFERENCES Endereco (idEndereco);
    
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_2
    FOREIGN KEY (idContato)
	REFERENCES Contato (idContato);
 
ALTER TABLE Vendedor ADD CONSTRAINT FK_Vendedor_2
    FOREIGN KEY (idContato)
    REFERENCES Contato (idContato);
 
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_2
   FOREIGN KEY (idEditora)
   REFERENCES Editora (idEditora);
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_1
    FOREIGN KEY (fk_Livro_idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE SET NULL;
 
ALTER TABLE Contem ADD CONSTRAINT FK_Contem_2
    FOREIGN KEY (fk_Venda_idVenda)
    REFERENCES Venda (idVenda)
    ON DELETE SET NULL;
 
ALTER TABLE Fornece ADD CONSTRAINT FK_Fornece_1
    FOREIGN KEY (fk_Editora_idEditora)
    REFERENCES Editora (idEditora)
    ON DELETE SET NULL;
 
ALTER TABLE Fornece ADD CONSTRAINT FK_Fornece_2
    FOREIGN KEY (fk_Livro_idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE SET NULL;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_1
    FOREIGN KEY (fk_Vendedor_idVendedor)
    REFERENCES Vendedor (idVendedor)
    ON DELETE SET NULL;
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_2
    FOREIGN KEY (fk_Venda_idVenda)
    REFERENCES Venda (idVenda)
    ON DELETE SET NULL;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_1
    FOREIGN KEY (fk_Endereco_idEndereco)
    REFERENCES Endereco (idEndereco)
    ON DELETE SET NULL;
 
ALTER TABLE Possui ADD CONSTRAINT FK_Possui_2
    FOREIGN KEY (fk_Venda_idVenda)
    REFERENCES Venda (idVenda)
    ON DELETE SET NULL;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_1
    FOREIGN KEY (fk_Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE SET NULL;
 
ALTER TABLE Participa ADD CONSTRAINT FK_Participa_2
    FOREIGN KEY (fk_Venda_idVenda)
    REFERENCES Venda (idVenda)
    ON DELETE SET NULL;
 
ALTER TABLE detem ADD CONSTRAINT FK_detem_1
    FOREIGN KEY (fk_Contato_idContato)
    REFERENCES Contato (idContato)
    ON DELETE SET NULL;
 
ALTER TABLE tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Cliente_idCliente)
    REFERENCES Cliente (idCliente)
    ON DELETE SET NULL;
 
ALTER TABLE detem ADD CONSTRAINT FK_detem_2
    FOREIGN KEY (fk_Vendedor_idVendedor)
    REFERENCES Vendedor (idVendedor)
    ON DELETE SET NULL;
 
ALTER TABLE Tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Contato_idContato)
    REFERENCES Contato (idContato)
    ON DELETE SET NULL;
    
    
INSERT INTO Venda(idVenda, quantidade, dataVenda)
values ("0000001", "2", "2024/03/05"),
("0000002", "1", "2021/07/13"),
("0000003", "1", "2020/09/01"),
("0000004", "5", "2024/05/25"),
("0000005", "3", "2023/01/18"),
("0000006", "2", "2022/02/22");

INSERT INTO cliente(idCliente, nome, dataNascimento, genero, statusCliente)
values ("0000011", "Pedro Soares", "2005/05/13", "Masculino", true),
("0000012", "Lui Costa", "2002/01/23", "Masculino", false),
("0000013", "Larissa Gondim", "1989/05/01", "Feminino", true),
("0000014", "Paulo Neto", "2000/10/18", "Masculino", true),
("0000015", "Camila Serpa", "2005/03/13", "Feminino", false),
("0000016", "Cláudio Soares", "1985/05/25", "Masculino", true);

INSERT INTO vendedor(idVendedor, nome, genero, dataNascimento)
values(0000111, "Fábio Rodrigues", "Masculino", "2004/09/20"),
(0000112, "Luis Carvalho", "Masculino", "2003/09/17"),
(0000113, "Pâmela Gouveia", "Feminino", "1978/09/02"),
(0000114, "Lois Lane", "Feminino", "1999/09/01"),
(0000115, "Sérgio Valadares", "Masculino", "2001/09/29"),
(0000116, "Márcia Cossenzo", "Feminino", "1998/09/22");

INSERT INTO livro(idLivro, titulo, autor, classificacao, generoLiterario, preco, dataLancamento)
values("0001111", "A morte do dragão", "Shakespeare", "18", "Ação", "19.99", "2007/03/01"),
("0001112", "Largados e Pelados", "Pelé", "18", "Reality Show", "89.99", "2001/01/01"),
("0001113", "Piadas Alegres", "Jorge Aragão", "10", "Comédia", "39.99", "2002/10/01"),
("0001114", "A história do carro", "Giorgio Ferrari", "0", "Documentário", "59.99", "2005/12/01"),
("0001115", "Mentirinha", "Tirirca", "0", "Comédia", "9.99", "2007/08/01"),
("0001116", "Traições e Guerras", "Judas Iscariotes", "18", "Ação", "99.99", "2003/08/24");

INSERT INTO editora(nome, fundacao, idEditora)
values("Faber Castelis", "1974/01/17", "0011111"),
("Pedro Livros", "1961/06/23", "0011112"),
("Geisers Caminhos", "1989/11/29", "0011113"),
("The Book is On the Table", "1990/05/21", "0011114"),
("Legos News", "1987/01/14", "0011115"),
("Marvelis", "1975/11/11", "0011116");

INSERT INTO endereco(idEndereco, rua, numero, complemento, bairro, cidade, cep)
values("0111111", "Poeta Cleiton", "789", "ap 201", "Guadalarrara", "Cabedelo", "567-0001"),
("0111112", "Dr João", "12", "sem", "Seriguela", "Ponta de Campina", "231-0451"),
("0111113", "Padre Suelsson", "157", "ap 134", "Mamanguape", "Cabedelo", "901-0211"),
("0111114", "Governador Pedrinho", "222", "ap 111", "Madrid", "Pedras de Fogo", "590-1001"),
("0111115", "Tirirca Avon", "189", "sem", "Lourdina", "Camboinha", "787-0571"),
("0111116", "Barcelona Do Céu", "1005", "ap 221", "Sol", "Sergipe", "556-2000");

INSERT INTO contato(idContato, email, telefone)
values("1111111", "sofe@gmail.com", "098876310971"),
("1111112", "jesus@gmail.com", "093679821371"),
("1111113", "smaria@gmail.com", "083124509872"),
("1111114", "aleluia@gmail.com", "081896514567"),
("1111115", "waltinho@gmail.com", "082576109876"),
("1111116", "sofeliz@gmail.com", "075094823397"),
("1111117", "django@gmail.com", "035900865512"),
("1111118", "node@gmail.com", "021958227709"),
("1111119", "powerbi@gmail.com", "031985798855"),
("1111101", "excel@gmail.com", "049971124682"),
("1111102", "python@gmail.com", "032198277892"),
("1111103", "chefin@gmail.com", "017183087332");

#Exemplo 1: Mostrar todos os clientes cujos nomes comece com a letra "A"

SELECT * FROM cliente WHERE nome LIKE 'A%';

#Exemplo 2: Mostrar todos os vendedores cujos nomes começam com a letra "S" e possuem exatamente 4 letras

SELECT * FROM vendedor WHERE nome LIKE 'S_ _ _ ';

#Exemplo 3: Mostrar todos os clientes cujos nomes não começam com a letra "A".

SELECT * FROM cliente WHERE nome NOT LIKE 'A%';

#Exemplo 4: Mostrar todos os clientes cujo não possuem status

SELECT * FROM cliente WHERE statusCliente IS NULL;

#Exemplo 5: Moatrar todos os livros que são do genero "ação" e classificação "18"

SELECT * FROM livro WHERE generoLiterario = 'Ação' AND classificacao = '18';

#Exemplo 6: Exibir todos os dados dos livros com preço entre R$ 30,00 e R$ 100,00 ordenados pelo titulo do livro em ordem ascendente

SELECT * FROM livro WHERE preco BETWEEN 30 AND 100 ORDER BY titulo ASC;

#Exemplo 7: Exibir em uma coluna chamada Quantidade o total de clientes

SELECT COUNT(*) AS Quantidade FROM cliente;

#Exemplo 8: Exibir em uma nova coluna "Total" a soma dos valores de todos os livros

SELECT SUM(preco) AS Total FROM livro;

#Exemplo 9: Exibir o "Média dos Preços" dos livros 

SELECT AVG(preco) AS 'Media dos Preços' FROM livro;

#Exemplo 10: Exibir o "Maior Preço" do livro mais caro da empresa

SELECT MAX(preco) AS 'Maior Preço' FROM livro;

#Exemplo 11: Exibir o 'Menor Preço' do livro mais barato

SELECT MIN(preco) AS 'Menor Preço' FROM livro;

#Exemplo 12: Exibir a data e a quantidade de livros vendidos nesta data

SELECT dataVenda, COUNT(*) AS Vendas FROM venda GROUP BY dataVenda;
