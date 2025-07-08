# 📊 Systemstatus-Überwachung & Mailversand (Bash | M122-Projekt)

## 🎯 Projektziel

Dieses Bash-Projekt dient zur automatisierten Überwachung eines Linux-Systems. Es sammelt regelmäßig Systeminformationen wie CPU-Auslastung, RAM-Nutzung, Speicherbelegung und aktive Prozesse. Die Ergebnisse werden in einem Bericht festgehalten und bei Bedarf an eine definierte E-Mail-Adresse gesendet.

Das Projekt erfüllt alle Vorgaben des Moduls M122:

- ✅ Vollständige Automatisierung ohne Benutzereingaben
- ⚙️ Konfigurierbar über `.cfg`-Datei
- 🛠️ Fehlerbehandlung & Logging
- 📩 Mailversand bei kritischen Zuständen
- 📂 GitLab-Dokumentation & UML-Diagramm
- 🤖 Einsatz von KI (markiert & erklärt)

---

## 📁 Projektstruktur

```plaintext
/systemstatus-projekt/
├── automate.sh               # Hauptscript (automatisiert)
├── systeminfo.cfg            # Konfigurationsdatei
├── output/                   # Generierte Statusberichte
│   ├── status_YYYYMMDD.txt
│   ├── systemreport.log      # Logdatei mit Ablaufprotokoll
│   └── crontab.txt           # Beispiel-Cronjob für Automatisierung
├── README.md                 # Diese Projektbeschreibung
├── UML/
│   └── systemstatus.drawio / .png
└── doc/
    ├── Projektsbeschreibung.md
    ├── Testprotokoll.md
```

---

## 🧪 Kurzüberblick Funktionalität

- Systemdaten erfassen (CPU, RAM, Speicher)
- Schwellenwert prüfen (z. B. CPU > 80 %)
- E-Mail mit Anhang (ZIP-Datei) versenden
- Alles vollständig automatisiert & konfigurierbar

---

## 👨‍🎓 Autor

**Andrija**  
TBZ Zürich – Modul 122 Abschlussprojekt (Shell- und Automationsscripting)
