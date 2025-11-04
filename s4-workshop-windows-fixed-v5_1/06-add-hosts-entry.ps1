
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$hostsPath = "$env:SystemRoot\System32\drivers\etc\hosts"
$entry = "127.0.0.1`tworkshop.local"

$exists = Select-String -Path $hostsPath -Pattern "workshop\.local" -SimpleMatch -Quiet
if (-not $exists) {
    Write-Host "[hosts] Adding '127.0.0.1 workshop.local' to $hostsPath ..." -ForegroundColor Cyan
    Add-Content -Path $hostsPath -Value $entry
} else {
    Write-Host "[hosts] Entry already present." -ForegroundColor Yellow
}
Write-Host "[hosts] Done." -ForegroundColor Green
