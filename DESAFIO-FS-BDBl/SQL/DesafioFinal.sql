/* 1ModeloLogicoDesafioFinal: */
CREATE DATABASE sistemaEscolar;
USE sistemaEscolar;

CREATE TABLE Professor (
    idProfessor INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(70) NOT NULL,
    estaAtuando BOOLEAN NOT NULL,
    idade INTEGER NOT NULL
);

CREATE TABLE Aluno (
    idAluno INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(70) NOT NULL,
    estaMatriculado BOOLEAN NOT NULL
);

CREATE TABLE Curso (
    cargaHoraria FLOAT NOT NULL,
    idCurso INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(70) NOT NULL
);

CREATE TABLE Faculdade (
    idFaculdade INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(70) NOT NULL,
    mensalidade FLOAT NOT NULL
);

CREATE TABLE Estuda (
    fk_Aluno_idAluno INTEGER,
    fk_Faculdade_idFaculdade INTEGER
);

CREATE TABLE Trabalha (
    fk_Professor_idProfessor INTEGER,
    fk_Faculdade_idFaculdade INTEGER
);

CREATE TABLE Ensina (
    fk_Professor_idProfessor INTEGER,
    fk_Curso_idCurso INTEGER
);

CREATE TABLE Matriculado (
    fk_Curso_idCurso INTEGER,
    fk_Aluno_idAluno INTEGER
);
 
ALTER TABLE Estuda ADD CONSTRAINT FK_Estuda_1
    FOREIGN KEY (fk_Aluno_idAluno)
    REFERENCES Aluno (idAluno)
    ON DELETE SET NULL;
 
ALTER TABLE Estuda ADD CONSTRAINT FK_Estuda_2
    FOREIGN KEY (fk_Faculdade_idFaculdade)
    REFERENCES Faculdade (idFaculdade)
    ON DELETE SET NULL;
 
ALTER TABLE Trabalha ADD CONSTRAINT FK_Trabalha_1
    FOREIGN KEY (fk_Professor_idProfessor)
    REFERENCES Professor (idProfessor)
    ON DELETE SET NULL;
 
ALTER TABLE Trabalha ADD CONSTRAINT FK_Trabalha_2
    FOREIGN KEY (fk_Faculdade_idFaculdade)
    REFERENCES Faculdade (idFaculdade)
    ON DELETE SET NULL;
 
ALTER TABLE Ensina ADD CONSTRAINT FK_Ensina_1
    FOREIGN KEY (fk_Professor_idProfessor)
    REFERENCES Professor (idProfessor)
    ON DELETE SET NULL;
 
ALTER TABLE Ensina ADD CONSTRAINT FK_Ensina_2
    FOREIGN KEY (fk_Curso_idCurso)
    REFERENCES Curso (idCurso)
    ON DELETE SET NULL;
 
ALTER TABLE Matriculado ADD CONSTRAINT FK_Matriculado_1
    FOREIGN KEY (fk_Curso_idCurso)
    REFERENCES Curso (idCurso)
    ON DELETE SET NULL;
 
ALTER TABLE Matriculado ADD CONSTRAINT FK_Matriculado_2
    FOREIGN KEY (fk_Aluno_idAluno)
    REFERENCES Aluno (idAluno)
    ON DELETE SET NULL;

#Adicionando a coluna idade do tipo INTEGER na tabela Aluno
ALTER TABLE Aluno ADD idade INTEGER;

#Adicionando dados na tabela Professor
INSERT INTO Professor (idProfessor, nome, estaAtuando, idade)
values(00001, "João Paulo", true, 70), 
(00002, "Pedro Alexandre", true, 45), 
(00003, "Matheus Felix", false, 39), 
(00004, "Sérgio Pessoa", true, 50);

INSERT INTO Aluno (idAluno, nome, estaMatriculado, idade)
values(00011, "Daniel Barreto", true, 19),
(00012, "Cleiton Rodrigues", true, 20),
(00013, "Davi Silva", true, 18),
(00014, "Edgard Neto", true, 30);

INSERT INTO Curso (cargaHoraria, idCurso, nome)
values(70.0, 00111, "Ciência de Dados"), 
(80.0, 00112, "Ciências da Computação"), 
(50.0, 00113, "Medicina Veterinária"), 
(60.0, 00114, "Odontologia");

INSERT INTO Faculdade(idFaculdade, nome, mensalidade)
values(01111, "Unipê", 683.98),
(01112, "Puc", 1517.18),
(01113, "Facisa", 809.55),
(01114, "Usp", 2004.23);

#Selecionando todas as colunas e linhas da entidade Professor
SELECT * FROM Professor;
#Selecionando todas as colunas e linhas da entidade Aluno
SELECT * FROM Aluno;
#Selecionando todas as colunas e linhas da entidade Curso
SELECT * FROM Curso;
#Selecionando todas as colunas e linhas da entidade Faculdade
SELECT * FROM Faculdade;

