-- ---------------------------------
-- COMANDOS UPDATE (MÍNIMO DE 3)
-- ---------------------------------

-- 1. UPDATE: Corrigir o telefone do Cliente 'João da Silva Santos'
UPDATE CLIENTE
SET Telefone = '(11) 91234-5678'
WHERE Nome = 'João da Silva Santos';

-- 2. UPDATE: Corrigir a dosagem de 'Clonazepam' (assumindo que 2mg estava incorreto)
UPDATE MEDICAMENTO
SET Dosagem = '1mg'
WHERE Nome = 'Clonazepam';

-- 3. UPDATE: Alterar o nome de um médico (caso haja erro de digitação)
UPDATE MEDICO
SET Nome = 'Dr. Ricardo F. Teixeira'
WHERE CRM = 'CRM/SP 54321';

-- ---------------------------------
-- COMANDOS DELETE (MÍNIMO DE 3)
-- ATENÇÃO: A integridade referencial (FKs) impede DELETES diretos
-- em registros que já possuem VENDA vinculada.
-- ---------------------------------

-- Para fins de demonstração, vamos simular que o Médico com ID 4 e o Medicamento com ID 5
-- foram cadastrados, mas nunca utilizados em vendas (o que permite o DELETE).
INSERT INTO MEDICO (CRM, Nome, UF_CRM) VALUES ('CRM/MG 10000', 'Dr. Teste Inutilizado', 'MG'); -- ID 3
INSERT INTO MEDICAMENTO (Nome, Dosagem, Lista_Controle) VALUES ('Novalgina', '500mg', 'N/C'); -- ID 4

-- 1. DELETE: Excluir o médico que nunca prescreveu (Dr. Teste Inutilizado - Id 3)
DELETE FROM MEDICO
WHERE Nome = 'Dr. Teste Inutilizado';

-- 2. DELETE: Excluir o medicamento que nunca foi vendido (Novalgina - Id 4)
DELETE FROM MEDICAMENTO
WHERE Nome = 'Novalgina';

-- 3. DELETE: Excluir o cliente Carlos Eduardo Lima se ele não tivesse nenhuma venda registrada (Exemplo Hipotético).
-- Este comando FALHARÁ se Carlos (ID 3) tiver vendas, demonstrando a regra de integridade.
-- Para que funcione no cenário real, é preciso garantir que o cliente não esteja na VENDA.
-- Exemplo de DELETE SEGURO (limpando a tabela VENDA, se necessário, o que NÃO É RECOMENDADO):
-- DELETE FROM VENDA WHERE Id_Cliente = 3;
-- DELETE FROM CLIENTE WHERE Id_Cliente = 3;

-- DELETE seguro em um cliente sem vendas
INSERT INTO CLIENTE (CPF, Nome, Data_Nascimento) VALUES ('444.444.444-44', 'Cliente a ser deletado', '2000-01-01');
DELETE FROM CLIENTE
WHERE CPF = '444.444.444-44';