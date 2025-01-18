# Posto-de-Saude 🏥

Este projeto acadêmico é um banco de dados para gerenciar as operações de um posto de saúde fictício. Ele inclui tabelas para pacientes, médicos, consultas, medicamentos, receitas médicas e exames, permitindo rastrear informações e melhorar a organização do atendimento.

## Tecnologias Utilizadas
  - Banco de Dados: MySQL
  - Linguagem: SQL
  - Ferramentas de Gerenciamento: MySQL Workbench

## Funcionalidades
  - Gerenciamento de Pacientes: Cadastro de informações pessoais, como nome, CPF, endereço e telefone.
Gerenciamento de Médicos: Registro de médicos, com CRM, especialidade e telefone.
  - Controle de Consultas: Registro de consultas realizadas, vinculando pacientes e médicos.
Prescrição de Medicamentos: Cadastro de receitas médicas, vinculando medicamentos às consultas.
  - Solicitação de Exames: Registro de exames solicitados durante consultas, com resultados e datas relevantes.
  - Rastreio de Medicamentos: Informações sobre lotes, validade e fabricantes de medicamentos.

## Estrutura do Banco de Dados
O projeto inclui as seguintes tabelas principais:

  - `Pacientes`: Gerencia os dados dos pacientes.
  - `Médicos`: Registra os médicos e suas especialidades.
  - `Consultas`: Liga médicos e pacientes, com dados sobre o atendimento.
  - `Medicamentos`: Contém informações de medicamentos, como princípio ativo e validade.
  - `Receitas Médicas`: Relaciona consultas e medicamentos, incluindo a posologia.
  - `Exames`: Cadastro de exames disponíveis no posto de saúde.
  - `Consultas_Exames`: Tabela intermediária para relacionar exames e consultas.
