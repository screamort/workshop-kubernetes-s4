<#
  run.ps1 — Orchestrateur pas-à-pas (Windows / PowerShell) — v3 safe
#>
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

function Write-Step($msg) { Write-Host ''; Write-Host ('==== ' + $msg + ' ====') -ForegroundColor Cyan }
function Write-Info($msg) { Write-Host ('[INFO] ' + $msg) -ForegroundColor Yellow }
function Write-Ok($msg)   { Write-Host ('[OK] ' + $msg)   -ForegroundColor Green }
function Pause-Step([string]$msg='Appuyez sur Entrée pour continuer...') { [void](Read-Host -Prompt $msg) }
function Test-Command($name) { try { Get-Command $name -ErrorAction Stop | Out-Null; $true } catch { $false } }
function Ensure-Tool($name, $url) { if (-not (Test-Command $name)) { throw ('Outil manquant: ' + $name + '. Installez: ' + $url) } else { Write-Ok ($name + ' détecté') } }

Write-Step 'Initialisation'
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
Write-Ok 'Policy d''exécution ajustée (Scope=Process, Bypass)'

Write-Step 'Vérification des prérequis'
Ensure-Tool 'docker' 'https://www.docker.com/products/docker-desktop/'
Ensure-Tool 'k3d'    'https://k3d.io/#installation'
Ensure-Tool 'kubectl' 'https://kubernetes.io/docs/tasks/tools/'
Write-Ok 'Préreq OK'
Pause-Step

Write-Step 'Etape 1 — Création du cluster k3d'
& '.\01-create-k3d-cluster.ps1'
Write-Ok 'Cluster créé'
Pause-Step

Write-Step 'Etape 2 — Installation Ingress-NGINX'
& '.\02-install-ingress-nginx.ps1'
Write-Ok 'Ingress-NGINX prêt'
Pause-Step

Write-Step 'Etape 3 — Installation cert-manager'
& '.\03-install-cert-manager.ps1'
Write-Ok 'cert-manager prêt'
Pause-Step

Write-Step 'Etape 4 — Déploiement du workshop (image front corrigée)'
& '.\04-deploy-workshop.ps1'
Write-Ok 'Workshop déployé'

Write-Step 'Etape 5 — Configuration DNS locale (hosts)'
$answer = Read-Host 'Ajouter 127.0.0.1 workshop.local dans hosts maintenant ? (Y/n)'
if ([string]::IsNullOrWhiteSpace($answer) -or $answer.Trim().ToLower() -eq 'y') {
  $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')
  if ($isAdmin) {
    & '.\06-add-hosts-entry.ps1'
    Write-Ok 'Entrée hosts ajoutée'
  } else {
    Write-Info 'Cette étape nécessite PowerShell en Administrateur.'
    Write-Info 'Ouvrez une nouvelle fenêtre PowerShell en Administrateur et exécutez :'
    Write-Host '    .\06-add-hosts-entry.ps1' -ForegroundColor Cyan
  }
}

Write-Step 'Terminé 🎉'
Write-Info 'Testez:'
Write-Host '  curl -k https://workshop.local/front' -ForegroundColor Cyan
Write-Host '  curl -k https://workshop.local/api/get' -ForegroundColor Cyan
Write-Info 'Rollback (optionnel) :'
Write-Host '  .\05-rollback_demo.ps1' -ForegroundColor Cyan
Write-Info 'Nettoyage :'
Write-Host '  .\99-cleanup.ps1' -ForegroundColor Cyan
