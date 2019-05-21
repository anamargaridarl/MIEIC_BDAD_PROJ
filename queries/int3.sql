.mode columns
.headers on
.nullvalue NULL

-- Quais os funcionários envolvidos num determinado processo?
select idProcesso, nome from Pessoa,
    (select idProcesso, nCC 
    from Funcionario, 
        (select distinct Processo.idProcesso, Processo.tipoProcesso, EncarregueEnf.idHospital
        from Processo, EncarregueEnf, EncarregueMed 
        on Processo.idProcesso=EncarregueEnf.idProcesso
        union
        select distinct Processo.idProcesso, Processo.tipoProcesso, EncarregueMed.idHospital
        from Processo, EncarregueMed
    on Processo.idProcesso=EncarregueMed.idProcesso) as F 
    on F.idHospital=Funcionario.idHospital) as P 
on P.nCC=Pessoa.nCC order by idProcesso asc;