.mode columns
.headers on
.nullvalue NULL

-- Quais os medicamentos que cada utente internado (cujo processo ainda se encontra ativo) toma?
select nSaude, nome, laboratorio, substancia
from Medicamento,
    (select nSaude, idMedicamento
    from Processo, Prescricao
    on Processo.idProcesso = Prescricao.idProcesso
    where dataSaida is NULL and tipoProcesso='Internamento') as meds
on meds.idMedicamento = Medicamento.idMedicamento;