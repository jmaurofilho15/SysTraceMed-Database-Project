-- ------------------------------
-- 1. CLIENTE
-- ------------------------------
CREATE TABLE CLIENTE (
    -- CORREÇÃO: Usando INTEGER PRIMARY KEY AUTOINCREMENT para SQLite
    Id_Cliente INTEGER PRIMARY KEY AUTOINCREMENT, 
    CPF VARCHAR(14) NOT NULL UNIQUE,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    Telefone VARCHAR(20)
);

-- ------------------------------
-- 2. MÉDICO
-- ------------------------------
CREATE TABLE MEDICO (
    -- CORREÇÃO: Usando INTEGER PRIMARY KEY AUTOINCREMENT
    Id_Medico INTEGER PRIMARY KEY AUTOINCREMENT, 
    CRM VARCHAR(15) NOT NULL UNIQUE,
    Nome VARCHAR(100) NOT NULL,
    UF_CRM VARCHAR(2)
);

-- ------------------------------
-- 3. MEDICAMENTO
-- ------------------------------
CREATE TABLE MEDICAMENTO (
    -- CORREÇÃO: Usando INTEGER PRIMARY KEY AUTOINCREMENT
    Id_Medicamento INTEGER PRIMARY KEY AUTOINCREMENT, 
    Nome VARCHAR(100) NOT NULL,
    Dosagem VARCHAR(50),
    Lista_Controle VARCHAR(10) -- Ex: A3, C1
);

-- ------------------------------
-- 4. RECEITA (Prescrição)
-- ------------------------------
CREATE TABLE RECEITA (
    -- CORREÇÃO: Usando INTEGER PRIMARY KEY AUTOINCREMENT
    Id_Receita INTEGER PRIMARY KEY AUTOINCREMENT,
    Data_Emissao DATE NOT NULL,
    Num_Receita VARCHAR(50) UNIQUE,
    Imagem_Digitalizada TEXT -- SQLite usa TEXT para strings longas/caminhos
);

-- ------------------------------
-- 5. VENDA (Dispensação) - Tabela de Fatos
-- ------------------------------
CREATE TABLE VENDA (
    -- CORREÇÃO: Usando INTEGER PRIMARY KEY AUTOINCREMENT
    Id_Venda INTEGER PRIMARY KEY AUTOINCREMENT,
    Data_Venda DATETIME NOT NULL,
    Quantidade INTEGER NOT NULL,

    -- CHAVES ESTRANGEIRAS
    Id_Cliente INTEGER NOT NULL,
    Id_Medico INTEGER NOT NULL,
    Id_Medicamento INTEGER NOT NULL,
    Id_Receita INTEGER NOT NULL,

    -- Restrições de Chaves Estrangeiras
    FOREIGN KEY (Id_Cliente) REFERENCES CLIENTE(Id_Cliente) ON DELETE RESTRICT,
    FOREIGN KEY (Id_Medico) REFERENCES MEDICO(Id_Medico) ON DELETE RESTRICT,
    FOREIGN KEY (Id_Medicamento) REFERENCES MEDICAMENTO(Id_Medicamento) ON DELETE RESTRICT,
    FOREIGN KEY (Id_Receita) REFERENCES RECEITA(Id_Receita) ON DELETE RESTRICT,

    -- CORREÇÃO (Linhas 67/68): Garante o Relacionamento 1:1
    UNIQUE (Id_Receita)
);