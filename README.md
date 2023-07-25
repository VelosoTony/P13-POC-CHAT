<p align="center">
  <img src="src\assets\logo_ycyw.png" title="Your Car Your Way - POC">
</p>

# Your Car Your Way - Proof Of Concept Chat
![MySQL](https://img.shields.io/badge/MySQL-8.0.x-orange) ![Angular](https://img.shields.io/badge/Angular-16.1.6-red)

Ce projet a été généré avec [Angular CLI](https://github.com/angular/angular-cli) version 16.1.5, Node version 18.14.0, Package Manager version npm 9.6.6.

## Prérequis

- La base de données utilise **MySQL**, télécharger [ici](https://dev.mysql.com/downloads/installer/).

## Installation

### 1. Cloner le dépôt GitHub

> git clone https://github.com/VelosoTony/P13-POC-CHAT.git

### 2. Créer la base de données MySQL

Démarrer MySQL, se connecter à l'interface MySQL (Ligne de commande ou MySQL Workbench).

Exécuter le script suivante pour créer la base nommée **db_ycyw**.

> MySQL\mysql_script_db_ycyw.sql

### Proof of Concept Chat en ligne

Le chat en ligne repose sur la plateforme de messagerie TalkJS.

Installer node_modules :

> `npm install`

Éxécuter :

> `ng serve`

Naviguer vers `http://localhost:4200/`

Vous verrez apparaitre l'interface suivante :
<img src="src\assets\demo_interface.png" title="Your Car Your Way - Chat">


