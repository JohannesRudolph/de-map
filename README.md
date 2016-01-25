de-map
======

http://www.freifunk-karte.de/

### Funktionsweise

Es wird die Freifunk-communityliste von https://raw.githubusercontent.com/freifunk/directory.api.freifunk.net/master/directory.json abgerufen.

Für jede Community wird das api-file abgerufen und nach nodeMaps - Knoten gesucht.

Nodemaps vom Typ Netmon, ffmap und openwifimap werden genutzt und jeweils per API oder bekanntem ajax-Verweis die Liste der Knoten abgerufen.

Für die Knoten werden notwendige Informationen zusammengetragen und in einer Datenstruktur abgelegt.
Diese wird in einem Dateicache abgelegt und 24 Stunden lang genutzt.

### Wie kommen bisher noch fehlende Daten in die Karte

Wenn Communities im Api-file verzeichnet sind, aber in der Karte fehlen, dann wurde keine verwendbare nodemap gefunden.

Ausweg ist das anbieten einer extra node-liste in folgendem Format: gist.github.com/StilgarBF/c21826994b775787f739
Das JSON-Schema ist in schema/nodelist-schema.json zu finden, gegen das man die eigenen Daten validieren kann. Z.B. unter http://jsonschemalint.com können Daten und Schema aufeinander validiert werden. Eine Lösung für die Kommandozeile folgt.

Für den Export dieser Liste habe ich 2 PHP-Klassen beispielhaft implementiert https://github.com/StilgarBF/nodelistexport

Die Karte wird dieses Format in Kürze auch verarbeiten.

Deployment
----------
Um eine eigene Freifunk-Karte zu betreiben brauchst du: 
  - PHP Server 
  - MySql(-kompatible) Datenbank

Die Installation ist einfach. 

  1. Eine Datenbank erstellen, Tabllen erstellen (siehe Skript unten)
  2. Den "cache" folder vom Web-Server Prozess aus schreibbar machen
  3. Eine angepasste config.php erstellen (siehe Beispiel-Datei) und eigenen "ReparseKey" festlegen
  4. Crawler manuell starten, mithilfe des selbst-gewählten "ReparseKey", z.B. per HTTP GET an `/data.php?REPARSE_KEY` 
  5. unter cache/logfile.txt findet ihr das log des crawlers
  

SQL Skript um Tabellen zu erstellen:
```
CREATE TABLE `log` (
  `ts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` int(11) NOT NULL
);
```

Bitte denkt daran euren Web-Server, DB-Server etc. richtig zu konfigurieren und zu sichern. 