PRAGMA foreign_keys = ON;
BEGIN TRANSACTION; 

/*----------------------------------------------*/
DROP TABLE if exists Pessoa;

CREATE TABLE Pessoa (
nCC INTEGER PRIMARY KEY,
nome CHAR,
dataNascimento TEXT REFERENCES Nascimento,
morada CHAR,
telefone INTEGER UNIQUE
);

DROP TABLE if exists Nascimento;

CREATE TABLE Nascimento (
dataNascimento TEXT PRIMARY KEY,
idade INTEGER CHECK (idade > 0)

);


DROP TABLE if exists Utente;

CREATE TABLE Utente (
nCC INTEGER REFERENCES Pessoa ON DELETE CASCADE ON UPDATE CASCADE,
nSaude INT PRIMARY KEY
);

DROP TABLE if exists Funcionario;

CREATE TABLE Funcionario (
nCC INTEGER REFERENCES Pessoa ON DELETE CASCADE ON UPDATE CASCADE,
idHospital INTEGER PRIMARY KEY 
);

/*----------------------------------------------*/

DROP TABLE if exists Medico;

CREATE TABLE Medico (
especialidade CHAR,
idHospital INTEGER REFERENCES Funcionario PRIMARY KEY ON DELETE CASCADE ON UPDATE CASCADE,
);


DROP TABLE if exists Enfermeiro;

CREATE TABLE Enfermeiro (
especialidade CHAR,
idHospital INTEGER REFERENCES Funcionario PRIMARY KEY ON DELETE CASCADE ON UPDATE CASCADE,
);

DROP TABLE if exists Trabalha;

CREATE TABLE Trabalha (
idLocalizacao INTEGER REFERENCES Departamento,
idHospital INTEGER REFERENCES Funcionario,
CONSTRAINT trabalho PRIMARY KEY(idLocalizacao,idHospital)
);

/*----------------------------------------------*/

DROP TABLE if exists Data;

CREATE TABLE Data (
idHospital INTEGER REFERENCES Funcionario ON DELETE CASCADE ON UPDATE CASCADE,
data TEXT,
idAgenda INTEGER REFERENCES Agenda ON DELETE SET NULL ON UPDATE CASCADE,
PRIMARY KEY(idHospital,data)
);


DROP TABLE if exists Agenda;

CREATE TABLE Agenda (
idAgenda INTEGER PRIMARY KEY,
horaEntrada TEXT,
horaSaida TEXT,
CHECK(horaEntrada < horaSaida)
);

/*----------------------------------------------*/

DROP TABLE if exists GrauIntolerancia;

CREATE TABLE GrauIntolerancia (
nSaude INTEGER REFERENCES Utente,
substancia INTEGER REFERENCES Alergia,
nivel INTEGER CHECK(nivel > 0),
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
capacidade INTEGER CHECK (capacidade >= 0), 
nome TEXT
);


DROP TABLE if exists EncarregueEnf;

CREATE TABLE EncarregueEnf (
idProcesso INTEGER REFERENCES Processo,
idHospital INTEGER REFERENCES Funcionario,
horaEntrada TEXT,
horaSaida TEXT,
PRIMARY KEY(idProcesso,idHospital),
CHECK(horaEntrada < horaSaida)
);


DROP TABLE if exists Processo;

CREATE TABLE Processo (
idProcesso INTEGER PRIMARY KEY,
tipoProcesso TEXT,
horaEntrada INTEGER,
horaSaida INTEGER,
nSaude INTEGER REFERENCES Utente,
CHECK(horaEntrada < horaSaida)
);

DROP TABLE if exists EncarregueMed;

CREATE TABLE EncarregueMed (
idProcesso INTEGER REFERENCES Processo,
idHospital INTEGER REFERENCES Funcionario ,
horaEntrada TEXT,
horaSaida TEXT,
PRIMARY KEY(idProcesso,idHospital)
);

DROP TABLE if exists ProcessoDepartamento;

CREATE TABLE ProcessoDepartamento (
idProcesso INTEGER REFERENCES Processo,
idHospital INTEGER REFERENCES Funcionario,
PRIMARY KEY(idProcesso,idHospital)
);

/*---------------------------------------------*/
DROP TABLE if exists Tratamento;

CREATE TABLE Tratamento (
idTratamento INTEGER PRIMARY KEY,
descricao TEXT,
duracao TEXT CHECK(duracao >0)
);

DROP TABLE if exists Resulta;

CREATE TABLE Resulta (
idTratamento INTEGER REFERENCES Tratamento,
idProcesso INTEGER REFERENCES Processo,
PRIMARY KEY(idTratamento, idProcesso)
);

DROP TABLE if exists Medicamento;

CREATE TABLE Medicamento (
idMedicamento INTEGER PRIMARY KEY,
nome TEXT UNIQUE,
laboratorio TEXT,
substancia TEXT REFERENCES Farmaco
);


DROP TABLE if exists Farmaco;

CREATE TABLE Farmaco (
nome TEXT PRIMARY KEY,
classificacao TEXT
);


DROP TABLE if exists Prescricao;

CREATE TABLE Prescricao (
idMedicamento INTEGER REFERENCES Medicamento,
idProcesso INTEGER REFERENCES Processo,
dosagem TEXT ,
modoTome TEXT,
PRIMARY KEY(idMedicamento,idProcesso)
);




COMMIT;




