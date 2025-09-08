# streamyard_scraping

Cross-platform local scraper for StreamYard chat messages with Excel export (.xlsx).

## Features
- Collects Message, Nickname, session Start Time, and End Time
- Works on Windows and macOS
- Uses Playwright (Chromium) and exports to Excel via openpyxl
- Allows custom CSS selectors if StreamYard DOM changes
   
## Prerequisites
- Python 3.10+
- Windows or macOS

## Installation
```bash
python -m venv .venv
. .venv/bin/activate     # macOS/Linux
# or
.\.venv\Scripts\activate # Windows PowerShell

pip install -r requirements.txt
python -m playwright install chromium --with-deps
```

## Usage
```bash
python streamyard_scraper.py --url "https://streamyard.studio/?v=UnchainedPodcasts" --output output/streamyard_chat.xlsx
```

The scraper opens a browser window. Log in to StreamYard if needed. Leave it running while the podcast is live. Press Ctrl+C to stop; the Excel file will be saved with columns:

- Message
- Nickname
- Start Time
- End Time

### Optional per-message timestamp
Add a timestamp for each message (extra column) by using:
```bash
python streamyard_scraper.py --url "https://streamyard.studio/?v=UnchainedPodcasts" --output output/streamyard_chat.xlsx --with-message-time
```

### Also export CSV (optional)
Write a CSV next to the Excel by adding `--csv`:
```bash
python streamyard_scraper.py --url "https://streamyard.studio/?v=UnchainedPodcasts" --output output/streamyard_chat.xlsx --with-message-time --csv
```

### Custom CSS selectors (optional)
If StreamYard changes its HTML, you can pass your own selectors:
```bash
python streamyard_scraper.py \
  --url "https://streamyard.studio/?v=UnchainedPodcasts" \
  --container "[data-testid=chat-pane]" \
  --each "[data-testid=chat-message]" \
  --nick "[data-testid=chat-message-author]" \
  --text "[data-testid=chat-message-content]"
```

## Notes
- Data is stored locally. No cloud dependencies.
- The entire session shares a Start Time; End Time is set when you stop the run.

## Quick start scripts

### Windows (PowerShell)
```powershell
PowerShell -ExecutionPolicy Bypass -File .\run_windows.ps1
```

### macOS/Linux (bash)
```bash
chmod +x run_macos.sh
./run_macos.sh
```

## Reference
- StreamYard: https://streamyard.studio/?v=UnchainedPodcasts