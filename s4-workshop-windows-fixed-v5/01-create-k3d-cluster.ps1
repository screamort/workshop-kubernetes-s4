
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ClusterName = $env:CLUSTER_NAME
if (-not $ClusterName) { $ClusterName = "workshop" }

Write-Host "[k3d] Creating cluster '$ClusterName' with LB ports 80/443 exposed..." -ForegroundColor Cyan
k3d cluster create $ClusterName --api-port 6550 -p "80:80@loadbalancer" -p "443:443@loadbalancer" --agents 2

Write-Host "`n[k3d] Contexts:" -ForegroundColor Yellow
kubectl config get-contexts
Write-Host "`n[k3d] Current context:" -ForegroundColor Yellow
kubectl config current-context
