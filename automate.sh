#!/bin/bash

CONFIG_FILE="systeminfo.cfg"
LOG_FILE="systemreport.log"
OUTPUT_DIR="output"
TIMESTAMP=$(date "+%Y%m%d-%H%M%S")
RAW_FILE="$OUTPUT_DIR/data_${TIMESTAMP}.raw"
FMT_FILE="$OUTPUT_DIR/status_${TIMESTAMP}.txt"
ZIP_FILE="$OUTPUT_DIR/data_${TIMESTAMP}.zip"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# === Konfiguration laden ===
if [[ ! -f "$CONFIG_FILE" ]]; then
    log "❌ Konfigurationsdatei fehlt!"
    exit 1
fi

source "$CONFIG_FILE"
mkdir -p "$OUTPUT_DIR"

# ✅ KEIN CURL MEHR!
log "⚠️ Kein curl – Dummy-Daten schreiben"
echo '{ "weather": "sunny", "temp": 22.5 }' > "$RAW_FILE"

# === Bericht erzeugen ===
{
    echo "===== Bericht vom $TIMESTAMP ====="
    echo "--- Hostname: $(hostname)"
    echo "--- Uptime: $(uptime -p)"
    echo
    echo ">> CPU:"
    top -bn1 | grep "Cpu(s)"
    echo
    echo ">> RAM:"
    free -h
    echo
    echo ">> Speicher:"
    df -h /
    echo
    echo ">> Dummy-Wetterdaten:"
    cat "$RAW_FILE"
} > "$FMT_FILE"

log "✅ Bericht gespeichert: $FMT_FILE"

# === CPU checken ===
CPU_USAGE=99
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_LIMIT_REACHED=$(echo "$CPU_USAGE > $CPU_LIMIT" | bc)

if [[ "$CPU_LIMIT_REACHED" -eq 1 ]]; then
    log "⚠️ CPU zu hoch: $CPU_USAGE%"

# === ZIP-Datei vorher erzeugen ===
ZIP_FILE="output/data_${TIMESTAMP}.zip"
zip -q "$ZIP_FILE" "$FMT_FILE" "$RAW_FILE"
log "📦 ZIP erstellt: $ZIP_FILE"

echo "CPU zu hoch (${CPU_USAGE}%) – siehe Anhang." | \

echo "📬 Zieladresse: $EMAIL"

cat <<EOF | msmtp "$EMAIL"
From: Systemüberwachung <milosevic-andrija@gmx.ch>
To: $EMAIL
Subject: ✅ Systemstatusbericht von $(hostname)
Content-Type: text/plain; charset="UTF-8"

Hallo andrija,

dies ist dein täglicher Systembericht vom Host: $(hostname)

🕓 Zeitpunkt: $(date)
💻 CPU-Auslastung: ${CPU_USAGE}%
⚠️  Grenzwert laut Konfiguration: ${CPU_LIMIT}%

Bericht und Logs siehe Anhang.

Viele Grüsse vom Bash-Skript 🚀

EOF
fi

# === ZIP-Datei erzeugen ===
ZIP_FILE="output/data_${TIMESTAMP}.zip"
zip -q "$ZIP_FILE" "$FMT_FILE" "$RAW_FILE"
log "📦 ZIP erstellt: $ZIP_FILE"

send_mail_with_attachment() {
  {
    echo "From: Systemüberwachung <milosevic-andrija@gmx.ch>"
    echo "To: $EMAIL"
    echo "Subject: ⚠️ CPU-Warnung auf $(hostname)"
    echo "MIME-Version: 1.0"
    echo "Content-Type: multipart/mixed; boundary=\"MAILPART\""
    echo
    echo "--MAILPART"
    echo "Content-Type: text/plain; charset=\"utf-8\""
    echo
    echo "Hallo andrija,"
    echo
    echo "CPU-Auslastung: ${CPU_USAGE}%"
    echo "Grenze laut Konfiguration: ${CPU_LIMIT}%"
    echo "Zeit: $(date)"
    echo
    echo "--MAILPART"
    echo "Content-Type: application/zip; name=\"$(basename "$ZIP_FILE")\""
    echo "Content-Transfer-Encoding: base64"
    echo "Content-Disposition: attachment; filename=\"$(basename "$ZIP_FILE")\""
    echo
    base64 "$ZIP_FILE"
    echo "--MAILPART--"
  } | msmtp "$EMAIL"
}

# === Funktion ausführen ===
send_mail_with_attachment
log "📨 Sende Mail an $EMAIL mit Anhang: $ZIP_FILE"

exit 0

