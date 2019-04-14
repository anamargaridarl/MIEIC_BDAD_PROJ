BEGIN TRANSACTION; 

/*----------------------------------------------*/
DROP TABLE if exists GrauIntolerancia;
DROP TABLE if exists EncarregueMed;
DROP TABLE if exists EncarregueEnf;
DROP TABLE if exists ProcessoDepartamento;
DROP TABLE if exists Resulta;
DROP TABLE if exists Prescricao;
DROP TABLE if exists Medicamento;
DROP TABLE if exists Trabalha;
DROP TABLE if exists Data;
DROP TABLE if exists Medico;
DROP TABLE if exists Enfermeiro;
DROP TABLE if exists Funcionario;
DROP TABLE if exists Processo;
DROP TABLE if exists Utente;
DROP TABLE if exists Pessoa;
/*Tables without any referencing*/
DROP TABLE if exists Agenda;
DROP TABLE if exists Farmaco;
DROP TABLE if exists Tratamento;
DROP TABLE if exists Alergia;
DROP TABLE if exists Departamento;
DROP TABLE if exists Nascimento;

CREATE TABLE Nascimento (
dataNascimento TEXT PRIMARY KEY,
idade INTEGER CHECK (idade >= 0)
);

CREATE TABLE Pessoa (
nCC INTEGER PRIMARY KEY,
nome TEXT NOT NULL,
dataNascimento TEXT REFERENCES Nascimento,
morada TEXT,
telefone INTEGER UNIQUE
);

CREATE TABLE Utente (
nCC INTEGER REFERENCES Pessoa ON DELETE CASCADE ON UPDATE CASCADE,
nSaude INTEGER PRIMARY KEY
);

CREATE TABLE Funcionario (
idHospital INTEGER PRIMARY KEY,
nCC INTEGER REFERENCES Pessoa /*como usar on delete e update??*/
);

/*----------------------------------------------*/
CREATE TABLE Medico (
especialidade TEXT NOT NULL,
idHospital INTEGER PRIMARY KEY REFERENCES Funcionario /*ON DELETE SET Funcionario.ativo 0 ON UPDATE CASCADE  como usar on delete e update??*/
);

CREATE TABLE Enfermeiro (
especialidade TEXT ,
idHospital INTEGER PRIMARY KEY REFERENCES Funcionario /*ON DELETE SET Funcionario.ativo = 0 ON UPDATE CASCADE  como usar on delete e update??*/
);

CREATE TABLE Trabalha (
idDepartamento INTEGER REFERENCES Departamento ON DELETE CASCADE ON UPDATE CASCADE,
idHospital INTEGER REFERENCES Funcionario ON DELETE CASCADE ON UPDATE CASCADE, /*?*/
CONSTRAINT trabalho PRIMARY KEY(idDepartamento,idHospital)
);

/*----------------------------------------------*/
CREATE TABLE Data (
idHospital INTEGER REFERENCES Funcionario ON DELETE CASCADE ON UPDATE CASCADE, /*?*/
data TEXT,
idAgenda INTEGER REFERENCES Agenda ON DELETE SET NULL ON UPDATE CASCADE, 
PRIMARY KEY(idHospital,data)
);

CREATE TABLE Agenda (
idAgenda INTEGER PRIMARY KEY,
horaEntrada TEXT NOT NULL,
horaSaida TEXT NOT NULL
);

/*----------------------------------------------*/
CREATE TABLE GrauIntolerancia (
nSaude INTEGER REFERENCES Utente ON DELETE CASCADE ON UPDATE CASCADE,
substancia INTEGER REFERENCES Alergia ON DELETE CASCADE ON UPDATE CASCADE,
nivel INTEGER CHECK(nivel > 0 AND nivel <= 5),
PRIMARY KEY(nSaude, substancia)
);

CREATE TABLE Alergia (
substancia TEXT PRIMARY KEY,
descricao TEXT
);

/*----------------------------------------------*/
CREATE TABLE Departamento (
idDepartamento TEXT PRIMARY KEY,
capacidade INTEGER NOT NULL CHECK (capacidade >= 0), 
nome TEXT NOT NULL
);

CREATE TABLE EncarregueEnf (
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,
idHospital INTEGER REFERENCES Enfermeiro ON DELETE CASCADE ON UPDATE CASCADE, /*?*/
dataEntrada TEXT NOT NULL,
dataSaida TEXT,
PRIMARY KEY(idProcesso,idHospital),
CHECK(datetime(dataEntrada) < datetime(dataSaida))
);

CREATE TABLE EncarregueMed (
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,
idHospital INTEGER REFERENCES Medico ON DELETE CASCADE ON UPDATE CASCADE, /*?*/
dataEntrada TEXT NOT NULL,
dataSaida TEXT,
PRIMARY KEY(idProcesso,idHospital),
CHECK(datetime(dataEntrada) < datetime(dataSaida))
);

CREATE TABLE Processo (
idProcesso INTEGER PRIMARY KEY,
tipoProcesso TEXT,
dataEntrada TEXT DEFAULT CURRENT_TIMESTAMP NOT NULL,
dataSaida TEXT,
nSaude INTEGER REFERENCES Utente ON DELETE CASCADE ON UPDATE CASCADE,
CHECK(datetime(dataEntrada) < datetime(dataSaida))
);


CREATE TABLE ProcessoDepartamento (
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,
idDepartamento INTEGER REFERENCES Departamento ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(idProcesso,idDepartamento)
);

/*---------------------------------------------*/
CREATE TABLE Tratamento (
idTratamento INTEGER PRIMARY KEY,
descricao TEXT,
duracao INTEGER CHECK(duracao > 0)
);

CREATE TABLE Resulta (
idTratamento INTEGER REFERENCES Tratamento ON DELETE CASCADE ON UPDATE CASCADE,
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(idTratamento, idProcesso)
);

CREATE TABLE Medicamento (
idMedicamento INTEGER PRIMARY KEY,
nome TEXT,
laboratorio TEXT,
substancia TEXT REFERENCES Farmaco ON DELETE SET NULL ON UPDATE CASCADE,
UNIQUE(nome, laboratorio)
);

CREATE TABLE Farmaco (
substancia TEXT PRIMARY KEY,
classificacao TEXT
);

CREATE TABLE Prescricao (
idMedicamento INTEGER REFERENCES Medicamento ON DELETE CASCADE ON UPDATE CASCADE, /* caso medicamento seja eliminado etao prescriçao tmb*/
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,  
dosagem TEXT NOT NULL,
modoToma TEXT,
PRIMARY KEY(idMedicamento,idProcesso)
);

COMMIT;