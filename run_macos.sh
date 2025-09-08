#!/usr/bin/env bash
set -euo pipefail

# Create venv if missing
if [ ! -d ".venv" ]; then
  python3 -m venv .venv
fi

# Activate venv
# shellcheck disable=SC1091
source .venv/bin/activate

# Install deps
pip install -r requirements.txt

# Install browser (idempotent)
python -m playwright install chromium --with-deps

# Run scraper with defaults
python streamyard_scraper.py --url "https://streamyard.studio/?v=UnchainedPodcasts" --output output/streamyard_chat.xlsx --with-message-time

