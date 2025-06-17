# 📁 M122 – Abläufe mit einer Scriptsprache automatisieren

## 🎯 Projektziel

Ziel dieses Projekts ist es, ein praxisnahes Bash-Script zu entwickeln, das vollständig automatisiert abläuft und reale Aufgabenstellungen löst. Dabei wird auf die robuste Ausführung, sinnvolle Fehlerbehandlung sowie saubere Dokumentation auf GitLab Wert gelegt.

## 💡 Inhalt

Dieses Projekt dient zur **Vertiefung der Bash-Grundlagen** und zur **Anwendung in einem praxisnahen Automatisierungsszenario**.

Das Script erfüllt folgende Anforderungen:

- Verwendung von Konfigurationsdateien und/oder Übergabeparametern
- Vollständig automatisierter Ablauf (keine Benutzereingaben zur Laufzeit)
- Fehlerüberprüfung und -behandlung mit Logging
- Optional: Automatisierung via Cronjob
- Optional: Versand von Informationen per Mail

## 🛠️ Projektstruktur
```bash
/
├── automate.sh              # Hauptscript
├── mein_projekt.cfg         # Konfigurationsdatei 
├── mein_projekt.log         # Beispielhafte Logdatei 
├── crontab.txt              # Beispiel für CronJob
├── README.md                # Dieses Dokument
├── UML/
│   └── projektablauf.drawio/.png
├── doc/
│   ├── Projektbeschreibung.md
│   ├── Testprotokoll.md
│   └── Anforderungen.md
├── KI-Markierung/
│   └── KI_Quellenvermerk.md
└── testdaten/
    └── Beispieldaten.txt
