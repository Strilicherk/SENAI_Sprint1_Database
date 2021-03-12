-- DDL

-- Criando o banco de dados
CREATE DATABASE MEDICAL_GROUP_TARDE
GO

-- Selecionando o banco de dados que será utilizado
USE MEDICAL_GROUP_TARDE
GO

-- Criando as tabelas que farão parte do nosso banco de dados
CREATE TABLE TipoUsuario
(
	IdTipoUsuario INT PRIMARY KEY IDENTITY
	,TipoUsuario VARCHAR (200) UNIQUE NOT NULL
);
GO

CREATE TABLE Usuario
(
	IdUsuario INT PRIMARY KEY IDENTITY
	,IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario)
	,Email VARCHAR (150) UNIQUE NOT NULL
	,Senha VARCHAR (100) NOT NULL

);
GO

CREATE TABLE Especialidade
(
	IdEspecialidade INT PRIMARY KEY IDENTITY
	,Especialidade VARCHAR (100) UNIQUE NOT NULL
);
GO

CREATE TABLE Clinica
(
	IdClinica INT PRIMARY KEY IDENTITY
	,CNPJ CHAR (14) UNIQUE
	,Endereco VARCHAR (200) NOT NULL
	,NomeFantasia VARCHAR (100) UNIQUE NOT NULL
	,RazaoSocial VARCHAR (150) UNIQUE NOT NULL
);
GO

CREATE TABLE Medico
(
	IdMedico INT PRIMARY KEY IDENTITY
	,IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario)
	,IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(IdEspecialidade)
	,IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica)
	,NomeMedico VARCHAR (100) NOT NULL
	,CRM VARCHAR (50) UNIQUE NOT NULL
);
GO

CREATE TABLE Paciente
(
	IdPaciente INT PRIMARY KEY IDENTITY
	,IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario)
	,DataNascimento DATE NOT NULL
	,NomePaciente VARCHAR (100) NOT NULL
	,RG CHAR (9) UNIQUE NOT NULL
	,CPF CHAR (11) UNIQUE NOT NULL
	,Telefone VARCHAR (11) 
	,Endereco VARCHAR (100) UNIQUE NOT NULL
);
GO

CREATE TABLE Situacao
(
	IdSituacao INT PRIMARY KEY IDENTITY
	,Situacao VARCHAR(30) NOT NULL
);
GO

CREATE TABLE Consulta
(
	IdConsulta INT PRIMARY KEY IDENTITY
	,IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico)
	,IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente)
	,IdSituacao INT FOREIGN KEY REFERENCES Situacao(IdSituacao)
	,DataConsulta DATE NOT NULL
	,Descricao VARCHAR (255) NOT NULL
);
GO

-- DML


-- Selecionando o banco de dados que será utilizado
USE MEDICAL_GROUP_TARDE
GO

-- Inserindo as informações nas tabelas
INSERT INTO TipoUsuario (TipoUsuario)
VALUES					('Administrador')
						,('Médico')
						,('Paciente')
GO

INSERT INTO Usuario (IdTipoUsuario, Email, Senha)
VALUES					(2,'ricardo.lemos@spmedicalgroup.com.br', 'ricardo123')
						,(2,'roberto.possarle@spmedicalgroup.com.br', 'possarle456')
						,(2, 'helena.souza@spmedicalgroup.com.br',	'helena789')
						,(3, 'ligia@gmail.com', 'ligia123')
						,(3, 'alexandre@gmail.com',	'alexandre456')
						,(3, 'fernando@gmail.com', 'fernando789')
						,(3, 'henrique@gmail.com',	'henrique987')
						,(3, 'joao@gmail.com', 'joao654')
						,(3, 'bruno@gmail.com',	'bruno123')
						,(3, 'mariana@outlook.com',	'mariana987')
GO

-- DQL

SELECT * FROM TipoUsuario
SELECT * FROM Usuario