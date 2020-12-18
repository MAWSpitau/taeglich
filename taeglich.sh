#!/bin/bash

# This script is influenced ba the idea of Nick Janetakis.
# https://github.com/nickjj/notes
# But it works in a complete other way. :)

# Hier auskommentieren für debugging.
# DEBUG="=====>>>- DEBUGGING:"
# USAGE:
# [[ $DEBUG ]] && echo ${DEBUG} "Nachricht"

set -e

# In welchem Verzeichnis sollen die Einträge gespeichert werden?
readonly NOTES_DIRECTORY="${HOME}/data/wiki/taeglich/$(date +%Y)" 

# Wie sollen die Dateien heißen? 
readonly NOTES_FILE="$(date +%Y-%m).md"

# Das ist der Pfad inkl. Dateinamen für die gesamte Datei. 
readonly NOTES_PATH="${NOTES_DIRECTORY}/${NOTES_FILE}"

# Das Verzeichnis wird für ein neues Jahr angelegt. 
# Könnte auch automatisch laufen, da es nur einmal im Jahr läuft.
if [ ! -d "${NOTES_DIRECTORY}" ]; then
    while true; do
        read -rp "${NOTES_DIRECTORY} does not exist, do you want to create it? (y/n) " yn
        case "${yn}" in
            [Yy]* ) mkdir -p "${NOTES_DIRECTORY}"; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer y or n";;
        esac
    done
fi

# Überschrift in Markdown der ersten bene definieren.
HEADER="# $(date +%Y-%m-%d)"
[[ $DEBUG ]] && echo ${DEBUG} "HEADER: " ${HEADER}

# Wenn die Datei noch nicht existiert, dann wird sie mit dem entsprechenden header geöffnet.
[[ -f ${NOTES_PATH} ]] || printf "${HEADER}\n\n- " >> "${NOTES_PATH}"

# Wenn der Header für heute noch nicht gesetzt ist, dann erledige ich das für dich und starte mit einem Spiegelstrich
[[ `grep "${HEADER}" ${NOTES_PATH}` == ""  ]] && printf "\n\n\n${HEADER}\n\n- " >> "${NOTES_PATH}"

# vim startet mit einigen parametern.
# "+ normal G$" 	- startet im normalen Modus und sprint ans Dateiende und an die letzte Stelle der Zeile
# + set nofoldenable "  - entfaltet alles. 
# +startinsert! 	- startet im append Modus. 
vim "+ normal G$" "+ set nofoldenable " +startinsert! $NOTES_PATH
