# PowerShell Script to Safely Refactor Packages
# Removes "phase1" from package hierarchy
# Usage: .\refactor-packages.ps1

$ErrorActionPreference = "Stop"
$basePath = "d:\SHRI1\github\PSMRI AMRIT\AMRIT-DB"

Write-Host "===== Package Refactoring Script =====" -ForegroundColor Cyan
Write-Host "Removing phase1 package hierarchy..." -ForegroundColor Yellow

# Verify we're in a git repository
Set-Location $basePath
$gitStatus = git status 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error "Not a git repository or git not available"
    exit 1
}

Write-Host "`n[1/6] Checking current state..." -ForegroundColor Green
$phase1Path = "src\main\java\com\db\piramalswasthya\anonymization\phase1"
if (-not (Test-Path $phase1Path)) {
    Write-Host "phase1 directory not found - may already be refactored" -ForegroundColor Yellow
    exit 0
}

# Create backup branch
Write-Host "`n[2/6] Creating backup branch..." -ForegroundColor Green
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupBranch = "backup-before-refactor-$timestamp"
git branch $backupBranch
Write-Host "Backup branch created: $backupBranch" -ForegroundColor Cyan

# Move executor packages first
Write-Host "`n[3/6] Moving executor packages..." -ForegroundColor Green

$executorPackages = @('executor')
foreach ($pkg in $executorPackages) {
    $source = "src\main\java\com\db\piramalswasthya\anonymization\phase1\$pkg"
    $dest = "src\main\java\com\db\piramalswasthya\anonymization\$pkg"
    
    if (Test-Path $source) {
        Write-Host "  Moving $pkg..." -ForegroundColor Gray
        git mv $source $dest 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) {
            Write-Host "  Warning: git mv failed for $pkg, trying manual move" -ForegroundColor Yellow
            if (-not (Test-Path (Split-Path $dest))) {
                New-Item -ItemType Directory -Path (Split-Path $dest) -Force | Out-Null
            }
            Copy-Item -Path $source -Destination $dest -Recurse -Force
            Remove-Item -Path $source -Recurse -Force
        }
    }
}

# Move other packages
$packages = @('model', 'scan', 'detect', 'registry', 'export', 'cli', 'exception')
foreach ($pkg in $packages) {
    $source = "src\main\java\com\db\piramalswasthya\anonymization\phase1\$pkg"
    $dest = "src\main\java\com\db\piramalswasthya\anonymization\$pkg"
    
    if (Test-Path $source) {
        Write-Host "  Moving $pkg..." -ForegroundColor Gray
        git mv $source $dest 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) {
            Write-Host "  Warning: git mv failed for $pkg, trying manual move" -ForegroundColor Yellow
            if (-not (Test-Path (Split-Path $dest))) {
                New-Item -ItemType Directory -Path (Split-Path $dest) -Force | Out-Null
            }
            Copy-Item -Path $source -Destination $dest -Recurse -Force
            Remove-Item -Path $source -Recurse -Force
        }
    }
}

# Move test packages
Write-Host "`n[4/6] Moving test packages..." -ForegroundColor Green
$testPackages = @('detect', 'registry')
foreach ($pkg in $testPackages) {
    $source = "src\test\java\com\db\piramalswasthya\anonymization\phase1\$pkg"
    $dest = "src\test\java\com\db\piramalswasthya\anonymization\$pkg"
    
    if (Test-Path $source) {
        Write-Host "  Moving test $pkg..." -ForegroundColor Gray
        git mv $source $dest 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) {
            Write-Host "  Warning: git mv failed, trying manual move" -ForegroundColor Yellow
            if (-not (Test-Path (Split-Path $dest))) {
                New-Item -ItemType Directory -Path (Split-Path $dest) -Force | Out-Null
            }
            Copy-Item -Path $source -Destination $dest -Recurse -Force
            Remove-Item -Path $source -Recurse -Force
        }
    }
}

# Remove empty phase1 directories
Write-Host "  Cleaning up empty phase1 directories..." -ForegroundColor Gray
if (Test-Path "src\main\java\com\db\piramalswasthya\anonymization\phase1") {
    Remove-Item "src\main\java\com\db\piramalswasthya\anonymization\phase1" -Recurse -Force -ErrorAction SilentlyContinue
}
if (Test-Path "src\test\java\com\db\piramalswasthya\anonymization\phase1") {
    Remove-Item "src\test\java\com\db\piramalswasthya\anonymization\phase1" -Recurse -Force -ErrorAction SilentlyContinue
}

# Update package declarations and imports
Write-Host "`n[5/6] Updating package declarations and imports..." -ForegroundColor Green

$javaFiles = Get-ChildItem -Path "src" -Recurse -Filter "*.java"
$updatedCount = 0

foreach ($file in $javaFiles) {
    $content = Get-Content $file.FullName -Raw
    $originalContent = $content
    
    # Update package declarations
    $content = $content -replace 'package com\.db\.piramalswasthya\.anonymization\.phase1\.', 'package com.db.piramalswasthya.anonymization.'
    
    # Update imports
    $content = $content -replace 'import com\.db\.piramalswasthya\.anonymization\.phase1\.', 'import com.db.piramalswasthya.anonymization.'
    
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -NoNewline
        $updatedCount++
        Write-Host "  Updated: $($file.Name)" -ForegroundColor Gray
    }
}

Write-Host "  Updated $updatedCount Java files" -ForegroundColor Cyan

# Verify no phase1 references remain
Write-Host "`n[6/6] Verifying refactoring..." -ForegroundColor Green

$remainingRefs = Select-String -Path "src\**\*.java" -Pattern "\.phase1\." -ErrorAction SilentlyContinue
if ($remainingRefs) {
    Write-Host "  WARNING: Found remaining phase1 references:" -ForegroundColor Yellow
    $remainingRefs | ForEach-Object { Write-Host "    $($_.Path):$($_.LineNumber)" -ForegroundColor Yellow }
} else {
    Write-Host "  No phase1 references found" -ForegroundColor Green
}

Write-Host "`n===== Refactoring Complete =====" -ForegroundColor Green
Write-Host "Changes applied. Verify with: git status" -ForegroundColor Cyan
Write-Host "To restore if needed: git checkout $backupBranch" -ForegroundColor Yellow
