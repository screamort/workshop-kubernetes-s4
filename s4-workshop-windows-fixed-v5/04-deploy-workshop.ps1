
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "[workshop] Applying manifests ..." -ForegroundColor Cyan
kubectl apply -f ".\manifests\00-namespace.yaml"
kubectl apply -f ".\manifests\10-configmap-secret.yaml"
kubectl apply -f ".\manifests\20-front-deploy-svc.yaml"
kubectl apply -f ".\manifests\30-api-deploy-svc.yaml"
kubectl apply -f ".\manifests\40-clusterissuer-selfsigned.yaml"
kubectl apply -f ".\manifests\50-ingress.yaml"

Write-Host "[workshop] Waiting for deployments to be ready ..." -ForegroundColor Cyan
kubectl -n workshop rollout status deploy/front
kubectl -n workshop rollout status deploy/api

Write-Host "[workshop] Ingress:" -ForegroundColor Yellow
kubectl -n workshop get ingress web -o wide

Write-Host "`n>>> Ajoutez '127.0.0.1 workshop.local' dans C:\Windows\System32\drivers\etc\hosts (ou lancez 06-add-hosts-entry.ps1)" -ForegroundColor Green
Write-Host "Puis testez :" -ForegroundColor Green
Write-Host "curl -k https://workshop.local/front"
Write-Host "curl -k https://workshop.local/api/get"
