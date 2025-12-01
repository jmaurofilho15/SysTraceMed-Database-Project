-- INSERÇÃO EM CLIENTE
INSERT INTO CLIENTE (CPF, Nome, Data_Nascimento, Telefone) VALUES
('111.111.111-11', 'João da Silva Santos', '1985-05-15', '(11) 98765-4321'),
('222.222.222-22', 'Maria Augusta Pereira', '1970-11-20', '(21) 99887-7665'),
('333.333.333-33', 'Carlos Eduardo Lima', '1995-01-01', '(31) 97654-3210');

-- INSERÇÃO EM MÉDICO
INSERT INTO MEDICO (CRM, Nome, UF_CRM) VALUES
('CRM/SP 54321', 'Dr. Ricardo Teixeira', 'SP'),
('CRM/RJ 98765', 'Dra. Ana Paula Souza', 'RJ');

-- INSERÇÃO EM MEDICAMENTO
INSERT INTO MEDICAMENTO (Nome, Dosagem, Lista_Controle) VALUES
('Clonazepam', '2mg', 'C1'),
('Ritalina', '10mg', 'A3'),
('Fenobarbital', '100mg', 'C2');

-- INSERÇÃO EM RECEITA
INSERT INTO RECEITA (Data_Emissao, Num_Receita, Imagem_Digitalizada) VALUES
('2024-10-25', 'T1001', 'caminho/receita/joao_T1001.jpg'),
('2024-11-01', 'T1002', 'caminho/receita/maria_T1002.jpg'),
('2024-11-10', 'T1003', 'caminho/receita/carlos_T1003.jpg');


-- INSERÇÃO EM VENDA (Usa os IDs gerados automaticamente)
-- Venda 1: João (Id=1), Dr. Ricardo (Id=1), Clonazepam (Id=1), Receita T1001 (Id=1)
INSERT INTO VENDA (Data_Venda, Quantidade, Id_Cliente, Id_Medico, Id_Medicamento, Id_Receita) VALUES
('2024-10-27 10:30:00', 1, 1, 1, 1, 1);

-- Venda 2: Maria (Id=2), Dra. Ana Paula (Id=2), Ritalina (Id=2), Receita T1002 (Id=2)
INSERT INTO VENDA (Data_Venda, Quantidade, Id_Cliente, Id_Medico, Id_Medicamento, Id_Receita) VALUES
('2024-11-02 15:45:00', 2, 2, 2, 2, 2);

-- Venda 3: Carlos (Id=3), Dr. Ricardo (Id=1), Fenobarbital (Id=3), Receita T1003 (Id=3)
INSERT INTO VENDA (Data_Venda, Quantidade, Id_Cliente, Id_Medico, Id_Medicamento, Id_Receita) VALUES
('2024-11-11 09:00:00', 1, 3, 1, 3, 3);