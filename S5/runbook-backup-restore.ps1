# ===============================
#  Runbook Backup / Restore PostgreSQL
#  Namespace : s6
#  Auteur : toi :)
# ===============================

# --- Variables ---
$Namespace = "s6"
$DateStr = (Get-Date -Format 'yyyy-MM-dd')
$BackupFile = ".\backup-$DateStr.sql"

# --- Trouver le Pod Postgres ---
$POD = kubectl -n $Namespace get po -l app=postgres -o jsonpath='{.items[0].metadata.name}'
Write-Host "Pod PostgreSQL détecté : $POD"

# --- Backup logique (pg_dumpall) ---
Write-Host "Démarrage du backup..."
kubectl -n $Namespace exec $POD -- bash -lc "pg_dumpall -U postgres" `
  | Out-File -FilePath $BackupFile -Encoding utf8
Write-Host "✅ Backup terminé : $BackupFile"

# --- Pour restaurer ---
# Remplace YYYY-MM-DD par la date du backup à restaurer
# $BackupFile = ".\backup-YYYY-MM-DD.sql"
# Get-Content $BackupFile -Raw | kubectl -n $Namespace exec -i $POD -- bash -lc "psql -U postgres"
# Write-Host "✅ Restauration effectuée depuis $BackupFile"
