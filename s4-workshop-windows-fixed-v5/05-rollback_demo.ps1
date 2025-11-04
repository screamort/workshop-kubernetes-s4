
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "[rollback] Breaking the front deployment with a bad image tag ..." -ForegroundColor Yellow
try { kubectl -n workshop set image deployment/front front=nginx:broken | Out-Null } catch {}

Write-Host "[rollback] Watching rollout status (expect failure) ..." -ForegroundColor Yellow
try { kubectl -n workshop rollout status deploy/front } catch {}

Write-Host "[rollback] Undoing the rollout to the previous ReplicaSet ..." -ForegroundColor Cyan
kubectl -n workshop rollout undo deploy/front

Write-Host "[rollback] Checking status ..." -ForegroundColor Cyan
kubectl -n workshop rollout status deploy/front
kubectl -n workshop get rs -l app=front
