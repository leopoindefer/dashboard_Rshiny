# 📊 H&M Sales Dashboard – RShiny

<img width="1914" height="981" alt="image" src="https://github.com/user-attachments/assets/0d1457d8-12fa-4b47-b72e-f64acfcad21f" />


## 🚀 Description

Ce projet est une application interactive développée avec RShiny permettant d’analyser les ventes de la marque H&M à travers différents axes (temps, catégorie de produits, régions, modes de livraison…).

L’objectif est de mettre en place un outil simple, visuel et personnalisable pour explorer les données de ventes et faciliter la prise de décision.

## ⚙️ Fonctionnalités

Filtres interactifs :

- Sélection de la période d’analyse

- Choix de la catégorie de produits

Différents types de visualisations :

- Ventes par mois

- Ventes par sous-catégorie

- Ventes par État

- Répartition par mode de livraison

Indicateurs clés (KPI) dynamiques :

💵 Total des ventes

🛒 Nombre de commandes

👤 Nombre de clients

📦 Nombre de produits vendus

Visualisations dynamiques avec ggplot2 :

- Courbes temporelles avec tendance
- Graphiques en barres
- Graphiques en secteurs (répartition)
- Téléchargement des graphiques au format image (jpeg)

## 🛠️ Technologies & Packages utilisés

Framework : Shiny
 & shinydashboard

Visualisation : ggplot2
, rAmCharts

Manipulation de données : dplyr
, stringr

Autres : colourpicker

## 📂 Structure du projet

📁 dashboard-HM-Sales

│── ui.R        # Interface utilisateur (Shiny Dashboard)

│── server.R    # Logique serveur (filtres, calculs, graphiques)

│── HM_Sales.csv (ou .rds) # Dataset des ventes

│── README.md   # Documentation du projet

## ▶️ Lancer l’application

Cloner le repo :

git clone https://github.com/leopoindefer/dashboard_Rshiny.git

Installer les packages nécessaires dans R :

install.packages(c("shiny","shinydashboard","ggplot2","dplyr","rAmCharts","stringr","colourpicker"))


Lancer l’application :

library(shiny)

runApp()

## 📊 Exemple d’analyse

Filtrer les ventes par catégorie "Footwear"

Visualiser la tendance mensuelle des ventes

Obtenir instantanément :

- le chiffre d’affaires total

- le nombre de commandes

- le nombre de clients

- le nombre de produits vendus

## 💡 Améliorations possibles

Intégration d’une base de données externe (SQL)

Ajout de prévisions (forecasting) avec des modèles statistiques

Déploiement en ligne avec ShinyApps.io ou Docker

Tableau de bord multilingue (FR/EN)

## 👤 Auteur

Projet réalisé par Léo Poindefer
🔗 https://github.com/leopoindefer
