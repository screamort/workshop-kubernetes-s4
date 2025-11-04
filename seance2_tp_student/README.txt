TP S2 — Version Étudiante (Front + API + DB) — Minimal
=====================================================

Objectif (simple) : démarrer 3 services avec Docker Compose :
- DB Postgres
- API Node.js (Hello + /health)
- Front statique (NGINX)

Prérequis
---------
- Docker + Docker Compose v2 installés
- Port 8080 (front), 3000 (API) et 5432 (DB) libres sur votre machine

Fichiers fournis
----------------
- compose.yaml                -> décrit les 3 services (db, api, front)
- .env.example                -> modèle d'environnement (à copier en .env)
- api/Dockerfile, api/package.json, api/server.js
- front/dist/index.html

Étapes (5 minutes)
------------------
1) Copier le fichier d'environnement et définir le mot de passe DB :
   cp .env.example .env
   # éditez .env et mettez un mot de passe fort pour POSTGRES_PASSWORD

2) Démarrer les services :
   docker compose up -d

3) Vérifier que tout est en marche :
   docker compose ps
   docker compose logs -f   # Ctrl+C pour quitter

4) Tester rapidement
   - Front : ouvrir http://localhost:8080  (page statique)
   - API   : ouvrir http://localhost:3000  (réponse JSON), /health renvoie OK
   - DB    : exécuter dans le conteneur : 
       docker compose exec db pg_isready -U postgres -d app
     (option) créer une table de test :
       docker compose exec db psql -U postgres -d app -c "CREATE TABLE IF NOT EXISTS t(x int);"

5) Arrêter / nettoyer (si besoin)
   docker compose down

Objectifs pédagogiques (version minimale)
-----------------------------------------
- Lancer 3 conteneurs simples avec Compose
- Comprendre l'exposition de ports (8080, 3000, 5432)
- Voir la résolution par nom de service : l'API parle à la DB via le nom 'db'
- Produire une preuve de fonctionnement (captures d'écran ou commandes)

Livrables (proposés)
--------------------
- 3 captures d'écran : front OK, API OK, pg_isready OK
- Fichier .env (sans mot de passe en clair dans le rendu) + compose.yaml

Astuces / Dépannage
-------------------
- Un port est déjà pris ? Ouvrez compose.yaml et changez la partie avant les deux points, par ex. "8081:80".
- Logs utiles : docker compose logs -f
- Voir les conteneurs : docker compose ps
- Exécuter une commande dans un conteneur : docker compose exec <service> <commande>

Bon TP !
