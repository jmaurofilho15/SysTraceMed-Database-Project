-- 1. CONSULTA COM JOIN (Taxonomia de Fink: Integração)
-- Objetivo: Listar todas as dispensações (vendas), mostrando o nome completo de todos os envolvidos.
SELECT
    V.Data_Venda AS 'Data/Hora',
    C.Nome AS 'Cliente',
    M.Nome AS 'Médico Prescritor',
    MED.Nome AS 'Medicamento',
    V.Quantidade
FROM VENDA V
JOIN CLIENTE C ON V.Id_Cliente = C.Id_Cliente
JOIN MEDICO M ON V.Id_Medico = M.Id_Medico
JOIN MEDICAMENTO MED ON V.Id_Medicamento = MED.Id_Medicamento
ORDER BY V.Data_Venda DESC;

-- 2. CONSULTA COM WHERE E ORDER BY
-- Objetivo: Listar clientes nascidos antes de 1980, ordenados pelo nome.
SELECT
    Nome,
    CPF,
    Data_Nascimento
FROM CLIENTE
WHERE Data_Nascimento < '1980-01-01'
ORDER BY Nome ASC;

-- 3. CONSULTA COM JOIN E FILTRO POR LISTA DE CONTROLE
-- Objetivo: Listar as vendas que envolveram medicamentos da Lista C1.
SELECT
    C.Nome AS Cliente,
    MED.Nome AS Medicamento,
    MED.Lista_Controle
FROM VENDA V
JOIN CLIENTE C ON V.Id_Cliente = C.Id_Cliente
JOIN MEDICAMENTO MED ON V.Id_Medicamento = MED.Id_Medicamento
WHERE MED.Lista_Controle = 'C1';

-- 4. CONSULTA PARA AUDITORIA (GROUP BY / SUM)
-- Objetivo: Calcular o total de unidades vendidas por medicamento.
SELECT
    MED.Nome AS Medicamento,
    SUM(V.Quantidade) AS Total_Unidades_Vendidas
FROM VENDA V
JOIN MEDICAMENTO MED ON V.Id_Medicamento = MED.Id_Medicamento
GROUP BY MED.Nome
ORDER BY Total_Unidades_Vendidas DESC;