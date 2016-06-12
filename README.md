# Lemo
Entstanden im Rahmen von [Jugend Hackt Nord](http://jugendhackt.de/events/nord/) ist dieses Repo die gesammelte Codebase von Lemo, einer privaten Wetterstation in cool.

## Warum?
- Weil es cool ist
- Weil es Spaß macht
- Weil man so unverfälschte Werte sowohl einlesen als auch verarbeiten und auslesen kann

## Was?
- Ein [Raspberry Pi](https://www.raspberrypi.org) mit [irgendeinem Modul]() erstellt die Werte
- Werte werden an einen [Django](https://www.djangoproject.com)-basierten Webserver weitergegeben, der von einer [SQLite](https://www.sqlite.org) Datenbank gebackt wird
- Mittels [HTTP GET](https://de.wikipedia.org/wiki/Hypertext_Transfer_Protocol#HTTP_GET) werden die Daten als [JSON](http://www.json.org) ausgelesen
- und auf der [Website](http://nochkeineurl.de) und [App](http://welcheurlsollhierhin?.de) angezeigt

## Wer?
Hardware        -> Andre Soltau
RasPi scripts   -> Moritz Neltner
Backend         -> Sebastian Schröder
iOS App         -> [Finn Gaida](https://finngaida.de)

## 2Do
- Präsentation vorbereiten
- Stationsliste 
- Screenshots zur Repo
- Mehr 2Dos schreiben

## Lizenz
[MIT](LICENSE). TL;DR: Mach, was du willst, solange du uns Credits gibst.
