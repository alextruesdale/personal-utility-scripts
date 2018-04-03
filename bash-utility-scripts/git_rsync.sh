#!/usr/bin/env bash

echo "... syncing: text_operations_xml_strip"

rsync -av --exclude='*.log' --exclude='*.ipynb' /Users/alextruesdale/Documents/moodys_code/WIP/text_dictionaries/text_operations_xml_strip/codebase/ /Users/alextruesdale/Documents/moodys-image-processing/text_dictionaries/text_operations_xml_strip/codebase/

echo
echo "update complete: text_operations_xml_strip"
echo "... syncing: text_operations_caps_search"
echo

rsync -av --exclude='working_directory' /Users/alextruesdale/Documents/moodys_code/WIP/text_dictionaries/text_operations_caps_search/codebase/ /Users/alextruesdale/Documents/moodys-image-processing/text_dictionaries/text_operations_caps_search/codebase/

echo
echo "update complete: text_operations_caps_search"
echo "... syncing: text_operations_caps_search"
echo
