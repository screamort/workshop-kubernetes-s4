
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$CM_VERSION = $env:CM_VERSION
if (-not $CM_VERSION) { $CM_VERSION = "v1.14.4" }

Write-Host "[cert-manager] Installing $CM_VERSION ..." -ForegroundColor Cyan
kubectl apply -f "https://github.com/cert-manager/cert-manager/releases/download/$CM_VERSION/cert-manager.yaml"

Write-Host "[cert-manager] Waiting for deployments..." -ForegroundColor Cyan
kubectl -n cert-manager rollout status deploy/cert-manager
kubectl -n cert-manager rollout status deploy/cert-manager-cainjector
kubectl -n cert-manager rollout status deploy/cert-manager-webhook

kubectl -n cert-manager get pods
