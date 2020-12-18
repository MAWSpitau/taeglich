#!/bin/bash
set -e

readonly NOTES_DIRECTORY="${NOTES_DIRECTORY:-"${HOME}/data/wiki/taeglich/$(date +%Y)"}"
readonly NOTES_EDITOR="${EDITOR}"

readonly NOTES_FILE="$(date +%Y-%m).md"
readonly NOTES_PATH="${NOTES_DIRECTORY}/${NOTES_FILE}"

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

vim "+ normal G$" "+ set nofoldenable " +startinsert! $NOTES_PATH
