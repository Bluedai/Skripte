#!/bin/bash

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
