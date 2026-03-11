#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
RUNS_DIR="$ROOT_DIR/runs"
DRY_RUN=false
CONTINUE_ON_ERROR=false

usage() {
  cat <<'EOF'
Usage: ./setupd.sh [--dry-run] [--continue-on-error]

Options:
  --dry-run             Print scripts that would run, but do not execute them.
  --continue-on-error   Keep running remaining scripts if one fails.
EOF
}

log() {
  printf '[%s] %s\n' "$(date '+%H:%M:%S')" "$*"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=true
      ;;
    --continue-on-error)
      CONTINUE_ON_ERROR=true
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

if [[ ! -d "$RUNS_DIR" ]]; then
  echo "Runs directory not found: $RUNS_DIR" >&2
  exit 1
fi

scripts=(
  "$RUNS_DIR/packages.sh"
  "$RUNS_DIR/applications.sh"
  "$RUNS_DIR/devApplications.sh"
  "$RUNS_DIR/startServices.sh"
)

if [[ ${#scripts[@]} -eq 0 ]]; then
  log "No scripts configured in static scripts array"
  exit 0
fi

failed=0
for script in "${scripts[@]}"; do
  log "Running $(basename "$script")"

  if [[ "$DRY_RUN" == true ]]; then
    continue
  fi

  if ! bash "$script"; then
    ((failed+=1))
    log "Failed $(basename "$script")"
    if [[ "$CONTINUE_ON_ERROR" != true ]]; then
      exit 1
    fi
    continue
  fi

  log "Finished $(basename "$script")"
done

if [[ $failed -gt 0 ]]; then
  log "Completed with $failed failure(s)."
  exit 1
fi

log "All scripts completed successfully."
