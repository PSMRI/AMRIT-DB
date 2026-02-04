#!/bin/bash

# AMRIT Database Anonymization - Shell Script
# Linux/Mac automation script for anonymizing production SQL dumps

set -e

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

function print_success {
    echo -e "${GREEN}$1${NC}"
}

function print_info {
    echo -e "${CYAN}$1${NC}"
}

function print_warning {
    echo -e "${YELLOW}$1${NC}"
}

function print_error {
    echo -e "${RED}$1${NC}"
}

function print_banner {
    echo ""
    echo -e "${YELLOW}===============================================${NC}"
    echo -e "${YELLOW} AMRIT Database Anonymization Tool - Linux${NC}"
    echo -e "${YELLOW}===============================================${NC}"
    echo ""
}

function show_usage {
    cat << EOF
Usage: $0 [OPTIONS]

Required:
  -i, --input FILE       Input SQL dump file
  -o, --output FILE      Output anonymized SQL file

Optional:
  -r, --registry FILE    Custom registry YAML file
  -l, --lookup PATH      H2 lookup database path (default: ./lookup-cache)
  -s, --salt STRING      Custom salt for hashing
  --dry-run              Validate without processing
  -v, --verbose          Verbose output
  -h, --help             Show this help message

Examples:
  $0 -i production.sql -o anonymized.sql
  $0 -i prod.sql -o uat.sql --verbose
  $0 -i backup.sql -o clean.sql --dry-run

EOF
    exit 0
}

# Parse arguments
INPUT_DUMP=""
OUTPUT_DUMP=""
REGISTRY_FILE=""
LOOKUP_PATH="./lookup-cache"
SALT="AMRIT_2024_SECURE_SALT"
DRY_RUN=false
VERBOSE=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -i|--input)
            INPUT_DUMP="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT_DUMP="$2"
            shift 2
            ;;
        -r|--registry)
            REGISTRY_FILE="$2"
            shift 2
            ;;
        -l|--lookup)
            LOOKUP_PATH="$2"
            shift 2
            ;;
        -s|--salt)
            SALT="$2"
            shift 2
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -h|--help)
            show_usage
            ;;
        *)
            print_error "Unknown option: $1"
            show_usage
            ;;
    esac
done

# Validate required arguments
if [[ -z "$INPUT_DUMP" ]] || [[ -z "$OUTPUT_DUMP" ]]; then
    print_error "ERROR: Input and output files are required"
    show_usage
fi

print_banner

# Configuration
JAR_PATH="target/Amrit-DB-1.0.0.war"
LOG_DIR="logs"

# Create logs directory
mkdir -p "$LOG_DIR"
print_info "Created logs directory: $LOG_DIR"

# Generate log filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="$LOG_DIR/anonymization_$TIMESTAMP.log"

print_info "Configuration:"
echo "  Input:  $INPUT_DUMP"
echo "  Output: $OUTPUT_DUMP"
echo "  Lookup: $LOOKUP_PATH"
echo "  Log:    $LOG_FILE"
if [[ -n "$REGISTRY_FILE" ]]; then
    echo "  Registry: $REGISTRY_FILE"
fi
echo ""

# Validate JAR exists
if [[ ! -f "$JAR_PATH" ]]; then
    print_error "ERROR: JAR file not found: $JAR_PATH"
    echo "Please build the project first using: mvn clean package -DENV_VAR=local"
    exit 1
fi

# Validate input file
if [[ ! -f "$INPUT_DUMP" ]]; then
    print_error "ERROR: Input file not found: $INPUT_DUMP"
    exit 1
fi

# Get input file size
INPUT_SIZE=$(du -h "$INPUT_DUMP" | cut -f1)
print_info "Input file size: $INPUT_SIZE"
echo ""

# Build Java command
JAVA_CMD=(
    java
    -Xmx4g
    -Xms1g
    -jar "$JAR_PATH"
    anonymize
    --input "$INPUT_DUMP"
    --output "$OUTPUT_DUMP"
    --lookup "$LOOKUP_PATH"
    --salt "$SALT"
)

if [[ -n "$REGISTRY_FILE" ]]; then
    JAVA_CMD+=(--registry "$REGISTRY_FILE")
fi

if [[ "$DRY_RUN" == true ]]; then
    JAVA_CMD+=(--dry-run)
fi

if [[ "$VERBOSE" == true ]]; then
    JAVA_CMD+=(--verbose)
fi

print_info "Starting anonymization..."
echo ""

# Run the command
START_TIME=$(date +%s)

if "${JAVA_CMD[@]}" 2>&1 | tee "$LOG_FILE"; then
    END_TIME=$(date +%s)
    DURATION=$((END_TIME - START_TIME))
    DURATION_FORMAT=$(printf '%02d:%02d:%02d' $((DURATION/3600)) $((DURATION%3600/60)) $((DURATION%60)))
    
    echo ""
    print_success "==============================================="
    print_success " Anonymization Completed Successfully!"
    print_success "==============================================="
    echo "Duration: $DURATION_FORMAT"
    
    if [[ -f "$OUTPUT_DUMP" ]]; then
        OUTPUT_SIZE=$(du -h "$OUTPUT_DUMP" | cut -f1)
        echo "Output size: $OUTPUT_SIZE"
    fi
    
    echo "Log file: $LOG_FILE"
    echo ""
    
    exit 0
else
    EXIT_CODE=$?
    print_error "Anonymization failed with exit code: $EXIT_CODE"
    echo "Check log file for details: $LOG_FILE"
    exit $EXIT_CODE
fi
