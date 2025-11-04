
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ClusterName = $env:CLUSTER_NAME
if (-not $ClusterName) { $ClusterName = "workshop" }

Write-Host "[cleanup] Deleting k3d cluster '$ClusterName' ..." -ForegroundColor Cyan
try { k3d cluster delete $ClusterName } catch {}
Write-Host "[cleanup] Done." -ForegroundColor Green
