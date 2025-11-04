# TP S5 — Persistance & Workloads avec état (Kubernetes)

## 🎯 Objectifs
Ce TP a pour but de :
- Comprendre les concepts **PV / PVC / StorageClass** et le provisioning dynamique.
- Déployer **PostgreSQL** sous forme de **StatefulSet** avec volumes persistants dynamiques.
- Mettre en place un **runbook de backup / restore** via `pg_dump` (optionnel : Velero).

---

## 🧩 Architecture du déploiement

### Composants
| Fichier | Description |
|----------|--------------|
| `00-namespace.yaml` | Namespace `s5` pour isoler le TP |
| `10-secret.yaml` | Secret contenant le mot de passe PostgreSQL |
| `20-service-headless.yaml` | Service headless (`clusterIP: None`) pour la résolution DNS interne |
| `30-statefulset.yaml` | StatefulSet PostgreSQL (1 réplique, PVC dynamique) |
| `runbook-backup-restore.ps1` | Script PowerShell de sauvegarde et restauration logique |

### Schéma logique

