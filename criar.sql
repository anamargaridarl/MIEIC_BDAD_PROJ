BEGIN TRANSACTION; 

/*----------------------------------------------*/
DROP TABLE if exists Pessoa;

CREATE TABLE Pessoa (
nCC INTEGER PRIMARY KEY,
nome TEXT NOT NULL,
dataNascimento TEXT REFERENCES Nascimento,
morada TEXT,
telefone INTEGER UNIQUE
);

DROP TABLE if exists Nascimento;

CREATE TABLE Nascimento (
dataNascimento TEXT PRIMARY KEY,
idade INTEGER CHECK (idade >= 0)

);


DROP TABLE if exists Utente;

CREATE TABLE Utente (
nCC INTEGER REFERENCES Pessoa ON DELETE CASCADE ON UPDATE CASCADE,
nSaude INT PRIMARY KEY
);

DROP TABLE if exists Funcionario;

CREATE TABLE Funcionario (
--ativo INTEGER,
idHospital INTEGER PRIMARY KEY,
nCC INTEGER REFERENCES Pessoa /*como usar on delete e update??*/
);

/*----------------------------------------------*/

DROP TABLE if exists Medico;

CREATE TABLE Medico (
especialidade TEXT NOT NULL,
idHospital INTEGER PRIMARY KEY REFERENCES Funcionario /*ON DELETE SET Funcionario.ativo 0 ON UPDATE CASCADE  como usar on delete e update??*/
);


DROP TABLE if exists Enfermeiro;

CREATE TABLE Enfermeiro (
especialidade TEXT ,
idHospital INTEGER PRIMARY KEY REFERENCES Funcionario /*ON DELETE SET Funcionario.ativo = 0 ON UPDATE CASCADE  como usar on delete e update??*/
);

DROP TABLE if exists Trabalha;

CREATE TABLE Trabalha (
idDepartamento INTEGER REFERENCES Departamento ON DELETE CASCADE ON UPDATE CASCADE,
idHospital INTEGER REFERENCES Funcionario ON DELETE CASCADE ON UPDATE CASCADE, /*?*/
CONSTRAINT trabalho PRIMARY KEY(idDepartamento,idHospital)
);

/*----------------------------------------------*/

DROP TABLE if exists Data;

CREATE TABLE Data (
idHospital INTEGER REFERENCES Funcionario ON DELETE CASCADE ON UPDATE CASCADE, /*?*/
data TEXT,
idAgenda INTEGER REFERENCES Agenda ON DELETE SET NULL ON UPDATE CASCADE, 
PRIMARY KEY(idHospital,data)
);


DROP TABLE if exists Agenda;

CREATE TABLE Agenda (
idAgenda INTEGER PRIMARY KEY,
dataEntrada TEXT NOT NULL,
dataSaida TEXT NOT NULL,
CHECK(dataEntrada < dataSaida)
);

/*----------------------------------------------*/

DROP TABLE if exists GrauIntolerancia;

CREATE TABLE GrauIntolerancia (
nSaude INTEGER REFERENCES Utente ON DELETE CASCADE ON UPDATE CASCADE,
substancia INTEGER REFERENCES Alergia ON DELETE CASCADE ON UPDATE CASCADE,
nivel INTEGER CHECK(nivel > 0 && nivel < 5),
PRIMARY KEY(nSaude, substancia)
);


DROP TABLE if exists Alergia;

CREATE TABLE Alergia (
substancia TEXT PRIMARY KEY,
descricao TEXT
);

/*----------------------------------------------*/

DROP TABLE if exists Departamento;

CREATE TABLE Departamento (
idDepartamento TEXT PRIMARY KEY,
capacidade INTEGER NOT NULL CHECK (capacidade >= 0), 
nome TEXT NOT NULL
);


DROP TABLE if exists EncarregueEnf;

CREATE TABLE EncarregueEnf (
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,
idHospital INTEGER REFERENCES Enfermeiro ON DELETE CASCADE ON UPDATE CASCADE, /*?*/
dataEntrada TEXT NOT NULL,
dataSaida TEXT ,
PRIMARY KEY(idProcesso,idHospital),
CHECK(dataEntrada < dataSaida)
);


DROP TABLE if exists Processo;

CREATE TABLE Processo (
idProcesso INTEGER PRIMARY KEY,
tipoProcesso TEXT,
dataEntrada TEXT DEFAULT CURRENT_TIMESTAMP NOT NULL,
dataSaida TEXT,
nSaude INTEGER REFERENCES Utente ON DELETE CASCADE ON UPDATE CASCADE,
CHECK(dataEntrada < dataSaida)
);

DROP TABLE if exists EncarregueMed;

CREATE TABLE EncarregueMed (
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,
idHospital INTEGER REFERENCES Medico ON DELETE CASCADE ON UPDATE CASCADE, /*?*/
dataEntrada TEXT NOT NULL,
dataSaida TEXT,
PRIMARY KEY(idProcesso,idHospital)
);

DROP TABLE if exists ProcessoDepartamento;

CREATE TABLE ProcessoDepartamento (
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,
idDepartamento INTEGER REFERENCES Departamento ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(idProcesso,idDepartamento)
);

/*---------------------------------------------*/
DROP TABLE if exists Tratamento;

CREATE TABLE Tratamento (
idTratamento INTEGER PRIMARY KEY,
descricao TEXT,
duracao INTEGER CHECK(duracao > 0)
);

DROP TABLE if exists Resulta;

CREATE TABLE Resulta (
idTratamento INTEGER REFERENCES Tratamento ON DELETE CASCADE ON UPDATE CASCADE,
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(idTratamento, idProcesso)
);

DROP TABLE if exists Medicamento;

CREATE TABLE Medicamento (
idMedicamento INTEGER PRIMARY KEY,
nome TEXT,
laboratorio TEXT,
substancia TEXT REFERENCES Farmaco ON DELETE SET NULL ON UPDATE CASCADE,
UNIQUE(nome , laboratorio)
);


DROP TABLE if exists Farmaco;

CREATE TABLE Farmaco (
nome TEXT PRIMARY KEY,
classificacao TEXT
);


DROP TABLE if exists Prescricao;

CREATE TABLE Prescricao (
idMedicamento INTEGER REFERENCES Medicamento ON DELETE CASCADE ON UPDATE CASCADE, /* caso medicamento seja eliminado etao prescriçao tmb*/
idProcesso INTEGER REFERENCES Processo ON DELETE CASCADE ON UPDATE CASCADE,  
dosagem TEXT NOT NULL,
modoToma TEXT,
PRIMARY KEY(idMedicamento,idProcesso)
);




COMMIT;




