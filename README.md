# data_engineer_azure_insurance
# le Besoin Métier 
## Contexte
Les compagnies d'assurance doivent analyser en profondeur les sinistres, les contrats et les profils des clients pour optimiser la gestion des risques, ajuster les stratégies de tarification et prédire les tendances futures. Cela permet de mieux évaluer les risques liés aux différents types de contrats, de réduire les fraudes, d'améliorer la rentabilité globale et de proposer des offres personnalisées, adaptées aux besoins spécifiques de chaque client. En outre, une analyse précise de ces données contribue à renforcer la satisfaction et la fidélité des clients en offrant une expérience plus réactive, anticipant leurs besoins et réclamations de manière proactive.

 ## Objectifs du Projet
 . Centralisation et stockage des données des clients, des contrats, des sinistres et des données externes (météo, sinistres FEMA) dans Azure Data Lake Storage (ADLS).  
 
. Automatisation du processus ETL avec Azure Data Factory (ADF) pour transférer les données brutes vers une base de données SQL après transformation.
.
Traitement des données avec Azure Databricks pour effectuer des transformations avancées (nettoyage, enrichissement, agrégation).
.
Stockage structuré des données dans Azure SQL Database pour permettre des analyses SQL avancées et la création de rapports.

.Visualisation des résultats avec Power BI (si nécessaire, même si ce n'est pas mentionné dans ta stack).


## Données Disponibles

.clients.csv : Informations sur les clients (nom, âge, email).
.contrats.csv : Détails des contrats d’assurance (type, dates, montants).
.sinistres.csv : Données sur les sinistres (type, montant, date).
.weather.csv : Données météorologiques (température, conditions).
.fema_disasters.csv : Données sur les catastrophes naturelles aux USA.

## Stack Technique
.Stockage : Azure Data Lake Storage (ADLS)
.Orchestration : Azure Data Factory (ADF)
.Traitement : Azure Databricks (PySpark)
.Base de Données : Azure SQL Database
.Visualisation : Power BI
