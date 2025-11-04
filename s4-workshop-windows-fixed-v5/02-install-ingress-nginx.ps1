
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "[ingress-nginx] Installing (cloud provider manifest)..." -ForegroundColor Cyan
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

Write-Host "[ingress-nginx] Waiting for controller to be ready..." -ForegroundColor Cyan
kubectl -n ingress-nginx rollout status deploy/ingress-nginx-controller

kubectl -n ingress-nginx get all
