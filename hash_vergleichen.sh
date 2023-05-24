#!/bin/bash

# Testumgebung erstellen 
# Dateien anlegen die Zufälligen Inhalt haben
# for i in {1..90}; do dd if=/dev/urandom of=Versuch-A-$(printf "%02d" $i) bs=1M count=10; done
# Hastliste erzeugen
# for i in {1..90}; do sha256sum Versuch-A-$(printf "%02d" $i) >> Hashliste.txt; done

# Hashliste.txt einlesen
while read hash datei; do
    # Hashwert der Datei berechnen
    computed_hash=$(sha256sum "$datei" | cut -d " " -f 1)

    # Hashwerte vergleichen und Ergebnis ausgeben
    if [ "$hash" == "$computed_hash" ]; then
        echo "Der Hashwert von $datei stimmt überein."
    else
        echo "Achtung: Der Hashwert von $datei stimmt nicht überein!"
    fi
done < Hashliste.txt
