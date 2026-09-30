param([string]$Message = 'Update portfolio')

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot
if (-not (Test-Path -LiteralPath 'index.html')) { throw 'index.html is missing.' }
$branch = git branch --show-current
if ($LASTEXITCODE -ne 0 -or $branch -ne 'main') { throw 'Run from the main branch.' }
$origin = git remote get-url origin
if ($LASTEXITCODE -ne 0 -or $origin -ne 'https://github.com/wootaegyeoung/developer-portfolio.git') { throw 'Unexpected GitHub origin.' }
git add -- index.html .nojekyll README.md deploy.ps1
if ($LASTEXITCODE -ne 0) { throw 'git add failed.' }
git diff --cached --quiet
if ($LASTEXITCODE -eq 1) {
    git commit -m $Message
    if ($LASTEXITCODE -ne 0) { throw 'git commit failed.' }
} elseif ($LASTEXITCODE -ne 0) { throw 'Could not inspect changes.' }
git push origin main
if ($LASTEXITCODE -ne 0) { throw 'Push failed. Check GitHub login or remote changes before retrying.' }
Write-Host 'Uploaded. Once Pages is enabled for main / (root), GitHub deploys automatically.'
Write-Host 'Website: https://wootaegyeoung.github.io/developer-portfolio/'
Write-Host 'Build status: https://github.com/wootaegyeoung/developer-portfolio/actions'
