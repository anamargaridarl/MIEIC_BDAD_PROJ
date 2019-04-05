PRAGMA foreign_keys = ON;
BEGIN TRANSACTION; 

DROP TABLE if exists Utente;

CREATE TABLE Utente (
nCC INTEGER ,
nome CHAR,
dataNascimento TEXT,
morada CHAR,
telefone INTEGER ,
nSaude INT PRIMARY KEY,
UNIQUE(nCC,telefone)
/*/vagas*/
);

DROP TABLE if exists Funcionario;

CREATE TABLE Funcionario (
nCC INTEGER,
nome CHAR,
dataNascimento TEXT,
morada CHAR,
telefone INTEGER ,
idHospital INT PRIMARY KEY,
UNIQUE(nCC,telefone)
/*/vagas*/
);

DROP TABLE if exists Medico;

CREATE TABLE Medico (
especialidade CHAR,
idHospital REFERENCES Funcionario PRIMARY KEY
);


DROP TABLE if exists Enfermeiro;

CREATE TABLE Enfermeiro (
especialidade CHAR,
idHospital REFERENCES Funcionario PRIMARY KEY
);


DROP TABLE if exists Data;

CREATE TABLE Data (
idHospital REFERENCES Funcionario ON DELETE CASCADE ON UPDATE CASCADE,
data TEXT,
idAgenda REFERENCES Agenda ON DELETE SET NULL ON UPDATE CASCADE,
PRIMARY KEY(idHospital,data)
);


DROP TABLE if exists Agenda;

CREATE TABLE Agenda (
idAgenda INTEGER PRIMARY KEY,
horaEntrada INTEGER,
horaSaida INTEGER,
CHECK(horaEntrada < horaSaida)
);


DROP TABLE if exists UtenteAlergia;

CREATE TABLE UtenteAlergia (
nSaude REFERENCES Utente,
substancia REFERENCES Alergia,
/*classe de associaçao*/
PRIMARY KEY(nSaude,substancia)
);


DROP TABLE if exists Alergia;

CREATE TABLE Alergia (
substancia TEXT PRIMARY KEY,
descricao TEXT
);


DROP TABLE if exists Departamento;

CREATE TABLE Departamento (
idLocalizacao TEXT PRIMARY KEY,
capacidade INTEGER,
nome TEXT
/*/vagas*/
);


DROP TABLE if exists Trabalha;

CREATE TABLE Trabalha (
idLocalizacao REFERENCES Departamento,
idHospital REFERENCES Funcionario,
PRIMARY KEY(idLocalizacao,idHospital)
);


DROP TABLE if exists ProcessoEnfermeiro;

CREATE TABLE ProcessoEnfermeiro (
idProcesso REFERENCES Processo,
idHospital REFERENCES Funcionario,
PRIMARY KEY(idProcesso,idHospital)
/*classe de associacao*/
);


DROP TABLE if exists Processo;

CREATE TABLE Processo (
idProcesso INTEGER PRIMARY KEY,
tipoProcesso TEXT,
horaEntrada INTEGER,
horaSaida INTEGER,
nSaude REFERENCES Utente,
CHECK(horaEntrada < horaSaida)
);

DROP TABLE if exists ProcessoMedico;

CREATE TABLE ProcessoMedico (
id REFERENCES Processo,
idHospital REFERENCES Funcionario ,
PRIMARY KEY(idProcesso,idHospital)
/*classe de associacao*/
);



COMMIT;




