# AMRIT Database Anonymization - PowerShell Script
# Windows automation script for anonymizing production SQL dumps

param(
    [Parameter(Mandatory=$true)]
    [string]$InputDump,
    
    [Parameter(Mandatory=$true)]
    [string]$OutputDump,
    
    [string]$RegistryFile = "",
    [string]$LookupPath = "./lookup-cache",
    [string]$Salt = "AMRIT_2024_SECURE_SALT",
    [switch]$DryRun,
    [switch]$Verbose
)

# Color output functions
function Write-Success {
    param([string]$Message)
    Write-Host $Message -ForegroundColor Green
}

function Write-Info {
    param([string]$Message)
    Write-Host $Message -ForegroundColor Cyan
}

function Write-Error-Custom {
    param([string]$Message)
    Write-Host $Message -ForegroundColor Red
}

# Display banner
Write-Host ""
Write-Host "===============================================" -ForegroundColor Yellow
Write-Host " AMRIT Database Anonymization Tool - Windows" -ForegroundColor Yellow
Write-Host "===============================================" -ForegroundColor Yellow
Write-Host ""

# Configuration
$JAR_PATH = "target\Amrit-DB-1.0.0.war"
$LOG_DIR = "logs"

# Create logs directory if it doesn't exist
if (-not (Test-Path $LOG_DIR)) {
    New-Item -ItemType Directory -Path $LOG_DIR | Out-Null
    Write-Info "Created logs directory: $LOG_DIR"
}

# Generate log filename
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$LOG_FILE = "$LOG_DIR\anonymization_$timestamp.log"

Write-Info "Configuration:"
Write-Host "  Input:  $InputDump"
Write-Host "  Output: $OutputDump"
Write-Host "  Lookup: $LookupPath"
Write-Host "  Log:    $LOG_FILE"
if ($RegistryFile) {
    Write-Host "  Registry: $RegistryFile"
}
Write-Host ""

# Validate JAR exists
if (-not (Test-Path $JAR_PATH)) {
    Write-Error-Custom "ERROR: JAR file not found: $JAR_PATH"
    Write-Host "Please build the project first using: mvn clean package -DENV_VAR=local"
    exit 1
}

# Validate input file
if (-not (Test-Path $InputDump)) {
    Write-Error-Custom "ERROR: Input file not found: $InputDump"
    exit 1
}

# Get input file size
$inputSize = (Get-Item $InputDump).Length / 1MB
Write-Info "Input file size: $([Math]::Round($inputSize, 2)) MB"
Write-Host ""

# Build Java command
$javaCmd = @(
    "java"
    "-Xmx4g"
    "-Xms1g"
    "-jar"
    $JAR_PATH
    "anonymize"
    "--input"
    $InputDump
    "--output"
    $OutputDump
    "--lookup"
    $LookupPath
    "--salt"
    $Salt
)

if ($RegistryFile) {
    $javaCmd += @("--registry", $RegistryFile)
}

if ($DryRun) {
    $javaCmd += "--dry-run"
}

if ($Verbose) {
    $javaCmd += "--verbose"
}

Write-Info "Starting anonymization..."
Write-Host ""

# Run the command and capture output
$startTime = Get-Date

try {
    & $javaCmd[0] $javaCmd[1..$javaCmd.Length] 2>&1 | Tee-Object -FilePath $LOG_FILE
    
    if ($LASTEXITCODE -eq 0) {
        $endTime = Get-Date
        $duration = $endTime - $startTime
        
        Write-Host ""
        Write-Success "==============================================="
        Write-Success " Anonymization Completed Successfully!"
        Write-Success "==============================================="
        Write-Host "Duration: $($duration.ToString('hh\:mm\:ss'))"
        
        if (Test-Path $OutputDump) {
            $outputSize = (Get-Item $OutputDump).Length / 1MB
            Write-Host "Output size: $([Math]::Round($outputSize, 2)) MB"
        }
        
        Write-Host "Log file: $LOG_FILE"
        Write-Host ""
        
        exit 0
    } else {
        Write-Error-Custom "Anonymization failed with exit code: $LASTEXITCODE"
        Write-Host "Check log file for details: $LOG_FILE"
        exit $LASTEXITCODE
    }
    
} catch {
    Write-Error-Custom "ERROR: Failed to execute anonymization"
    Write-Host $_.Exception.Message
    exit 2
}
