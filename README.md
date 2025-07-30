# 🏨 Insight Places – Procedimentos Automatizados com MySQL

## 📘 Descrição do Projeto

Este projeto tem como objetivo configurar a base de dados inicial da empresa **Insight Places**, especializada em gestão de aluguéis de hospedagens. A proposta é implementar e automatizar, via **stored procedures** no MySQL, o processo de inclusão de novos aluguéis, otimizando o gerenciamento das reservas e evitando erros manuais.

---

## 🎯 Objetivos

- Compreender o propósito e os desafios enfrentados pela Insight Places.
- Identificar o problema principal: **gerenciar eficientemente a entrada de novos aluguéis**.
- Criar uma **stored procedure** que facilite e automatize esse processo.
- Incluir **tratamento de erros**, **condicionais** e **estrutura de controle** no MySQL.
- Trabalhar com **dados de múltiplos clientes por aluguel**, adaptando à estrutura existente.

---

## 🧱 Funcionalidades Implementadas

### 🗃️ Base de Dados
- Criação da estrutura de tabelas base para hospedagens e clientes.
- Tabela temporária para gerenciar múltiplos clientes em um mesmo aluguel.

### 🔄 Stored Procedure
- **Criação de uma procedure principal** para inserção de novos aluguéis.
- Uso de `SELECT INTO` para obter dados do cliente a partir do nome.
- Cálculo da **data final da hospedagem** com:
  - `DATEDIFF`
  - `INTERVAL`
  - Exclusão de finais de semana via `WHILE DO ... END WHILE`
- **Conversão e manipulação de identificadores**:
  - Transformação de texto para número, cálculo do próximo ID, e reconversão.
- **Subprocedures** utilizadas para modularizar tarefas específicas.

### ⚠️ Tratamento de Erros
- Verificação de duplicatas para evitar violação da **chave primária**.
- Tratamento de **clientes com nomes duplicados**.
- Lógica condicional com:
  - `IF-THEN-ELSE`
  - `IF-THEN-ELSE-IF`
  - `CASE ... END CASE` com expressões lógicas e comparações diretas.

### 👥 Múltiplos Clientes por Hospedagem
- Inclusão gerenciada por **tabela temporária**.
- Iteração com **cursor** sobre os registros dessa tabela.
- Execução da inclusão para cada cliente associado.

---

## 🛠️ Tecnologias e Recursos Utilizados

- **MySQL** 8.x
- Stored Procedures
- Cursores e tratamento de exceções
- Funções SQL (`DATEDIFF`, `SELECT INTO`, `IF`, `CASE`)
- Loops e estrutura de controle (`WHILE`, `IF`, `CASE`)

---

## 🧪 Execução e Testes

1. Execute o script de criação da base de dados.
2. Insira dados de teste nas tabelas `clientes` e `hospedagens`.
3. Use a procedure `nova_hospedagem(...)` passando os parâmetros requeridos.
4. Teste casos com:
   - Clientes com nome duplicado
   - Hospedagens em fins de semana
   - Múltiplos clientes por aluguel

---

## 📚 Conceitos Envolvidos

- **Stored Procedure**: bloco de código SQL armazenado e reutilizável.
- **SELECT INTO**: atribui o resultado de uma consulta a variáveis SQL.
- **DATEDIFF / INTERVAL**: operações para cálculo de datas.
- **IF / CASE / LOOP / WHILE**: estruturas de controle de fluxo.
- **CURSOR**: iterador para linhas de uma consulta, usado para inserções múltiplas.
- **Tratamento de erros**: validação e prevenção de falhas lógicas ou violação de integridade.

---

## 👨‍💼 Sobre a Empresa

A **Insight Places** é uma empresa que atua no ramo de gestão de hospedagens e aluguéis de curta duração. Sua principal necessidade é automatizar e escalar o processo de entrada de novos aluguéis com segurança e eficiência.


