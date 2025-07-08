# Anforderungsdefinition Systemstatus-Automation mit E-Mail-Benachrichtigung

## Ziel
Automatisiertes Bash-Skript, das Systeminformationen (CPU, RAM, Speicher, Wetterdaten) sammelt, prüft und bei kritischer Auslastung eine E-Mail mit Anhang versendet. Kein Benutzereingriff erforderlich. Konfigurierbar via `.cfg`.

## Anforderungen
- Keine Interaktion → 100 % automatisiert
- Konfigurierbar via systeminfo.cfg
- Erzeugung von Statusbericht als Textdatei
- Bei Überschreitung eines Schwellwerts ZIP + Mail
- E-Mail-Anhang via msmtp, MIME korrekt gesetzt

## Systemdesign
→ siehe UML-Aktivitätsdiagramm (drawiopng)
