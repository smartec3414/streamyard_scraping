$ErrorActionPreference = "Stop"

# Create venv if missing
if (-Not (Test-Path .\.venv)) {
    python -m venv .venv
}

# Activate venv
. .\.venv\Scripts\Activate.ps1
  
# Install deps
pip install -r requirements.txt

# Install browser (idempotent)
python -m playwright install chromium --with-deps

# Run scraper with defaults
python streamyard_scraper.py --url "https://streamyard.studio/?v=UnchainedPodcasts" --output output/streamyard_chat.xlsx --with-message-time

