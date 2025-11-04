# S4 — Ingress, TLS, Config & Secrets (k3s + Traefik, sans Helm)

## Objectif
- `/front` → Service **front**
- `/api` → Service **api**
- TLS via **cert-manager** (ClusterIssuer `selfsigned`)
- ConfigMap non sensible, Secret pour credentials
- Démontrer un **rollback** rapide

## Prérequis
- Windows + PowerShell
- Docker Desktop
- k3d (k3s dans Docker) — création du cluster :
  ```powershell
  k3d cluster create workshop `
    --servers 1 --agents 2 `
    -p "80:80@loadbalancer" -p "443:443@loadbalancer"
