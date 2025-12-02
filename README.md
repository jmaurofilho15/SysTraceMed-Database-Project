# SysTraceMed-Database-Project
Sistema de Rastreamento de Medicamentos Controlados - Projeto de Modelagem e SQL

# 💊 SysTraceMed - Sistema de Rastreamento de Medicamentos Controlados

> Projeto de Modelagem de Banco de Dados e SQL para gestão de farmácias de manipulação e drogarias.

## 📌 Visão Geral
O **SysTraceMed** é um sistema projetado para garantir a rastreabilidade na dispensação de medicamentos sujeitos a controle especial (tarja preta/vermelha). O foco principal é vincular a venda obrigatoriamente a um **Cliente**, um **Médico Prescritor** e uma **Receita Médica**, atendendo às normas regulatórias e garantindo a integridade dos dados.

## 🛠️ Tecnologias Utilizadas
* **Modelagem de Dados:** Modelo Relacional (Normalização até 3FN).
* **SQL (Structured Query Language):** DDL e DML.
* **Banco de Dados:** Compatível com **SQLite** (Testado no SQL Studio Lite) e adaptável para MySQL/MariaDB.
* **Ferramentas:** Banco: SQLite Studio (3.4.17), Diagramas: Mermaid (Readme) e Draw.IO (Entregas).

## :pencil: Os Scripts
O projeto está organizado nos seguintes scripts SQL:

**01_ddl_criacao_tabelas.sql**: Criação do banco de dados, tabelas e relacionamentos (Foreign Keys).

**02_dml_insercao_dados.sql**: Povoamento inicial das tabelas com dados fictícios para testes.

**03_dml_consultas.sql**: Queries complexas utilizando JOIN, filtros WHERE e ordenação ORDER BY.

**04_dml_atualizacao_exclusao.sql**: Exemplos de manipulação de dados com UPDATE e DELETE seguros.

## 📊 Diagrama Entidade-Relacionamento (DER)
O modelo lógico abaixo representa a estrutura do banco de dados, totalmente normalizado.

```mermaid
erDiagram
    CLIENTE ||--o{ VENDA : possui
    MEDICO ||--o{ VENDA : prescreve
    MEDICAMENTO ||--o{ VENDA : esta_na
    RECEITA ||--|| VENDA : autoriza

    CLIENTE {
        INTEGER Id_Cliente PK
        VARCHAR(14) CPF
        VARCHAR(100) Nome
        DATE Data_Nascimento
        VARCHAR(20) Telefone
    }
    MEDICO {
        INTEGER Id_Medico PK
        VARCHAR(15) CRM
        VARCHAR(100) Nome
        VARCHAR(2) UF_CRM
    }
    MEDICAMENTO {
        INTEGER Id_Medicamento PK
        VARCHAR(100) Nome
        VARCHAR(50) Dosagem
        VARCHAR(10) Lista_Controle
    }
    RECEITA {
        INTEGER Id_Receita PK
        DATE Data_Emissao
        VARCHAR(50) Num_Receita
        TEXT Imagem_Digitalizada
    }
    VENDA {
        INTEGER Id_Venda PK
        DATETIME Data_Venda
        INTEGER Quantidade
        INTEGER Id_Cliente FK
        INTEGER Id_Medico FK
        INTEGER Id_Medicamento FK
        INTEGER Id_Receita FK
    }
