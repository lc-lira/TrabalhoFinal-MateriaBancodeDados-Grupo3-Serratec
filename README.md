# TrabalhoFinal-MateriaBancodeDados-Grupo3-Serratec

🛒 Sistema de Mercado com Preço Dinâmico

Projeto desenvolvido para a disciplina de Banco de Dados (Serratec), com o objetivo de simular o funcionamento de um sistema de mercado com controle de estoque, vendas e histórico de preços.

📌 Funcionalidades

Cadastro de categorias e produtos

Controle de estoque (com estoque mínimo)

Histórico de preços dos produtos

Registro de vendas e itens vendidos

Consultas SQL para análise de dados

Simulação de preço dinâmico com base no estoque

🗂️ Estrutura do Banco

O sistema é composto pelas seguintes tabelas:

CATEGORIA → Tipos de produtos

PRODUTO → Informações dos produtos

ESTOQUE → Quantidade disponível

HISTORICO_PRECO → Variação de preços ao longo do tempo

VENDA → Registro das vendas

ITEM_VENDA → Produtos vendidos em cada venda

📊 Consultas Desenvolvidas

O projeto contém consultas para:

Listar produtos e categorias

Verificar estoque atual e mínimo

Consultar preços atuais e históricos

Calcular total de vendas

Identificar produtos mais vendidos

Analisar faturamento por categoria

Detectar produtos com estoque baixo

🚀 Desafio Implementado

Foi desenvolvida uma lógica de preço dinâmico, onde:

Produtos com estoque abaixo do mínimo têm seus preços aumentados

Os novos preços são registrados no histórico

👥 Integrantes do Grupo 3

Nicolas Ramos,
Thiago Souza,
Bruno Passamani,
Lucas Lira,
Douglas Mathais,
Professor:Felipe Lacerda

🛠️ Tecnologias Utilizadas

PostgreSQL

SQL (DDL, DML, DQL)

📎 Observação

Este projeto tem fins acadêmicos e foi desenvolvido como parte da formação de Residência TIC em Software pelo Serratec.
