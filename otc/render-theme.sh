#!/bin/bash

# Specify the icons directory
ICONS_DIR="/Users/A200343638/Documents/GitHub/dlopes/structurizr-themes/otc/icons"

THEME_TMPL_FILE="theme-template.json"
THEME_FILE="theme.json"

# Ensure the directory exists
if [ ! -d "$ICONS_DIR" ]; then
    echo "Directory $ICONS_DIR does not exist."
    exit 1
fi

rm $THEME_FILE

THEME_FILE_CONTENT=""

# Iterate over each file in the directory
for FILE in "$ICONS_DIR"/*; {
    # Extract the filename
    FILENAME=$(basename "$FILE")
    
    # Strip everything after the opening parenthesis
    ABBREVIATION="${FILENAME%%(*}"
    ABBREVIATION=$(echo "$ABBREVIATION" | sed 's/[[:space:]]*$//')

    ENTRY="""\n\t{ \n\t\t\"tag\" : \"Open Telekom Cloud - ${ABBREVIATION}\", \n\t\t\"stroke\" : \"#ea0a8e\", \n\t\t\"color\" : \"#ea0a8e\", \n\t\t\"icon\" : \"icons/${FILENAME}\" \n\t},"""

    # Render the entry
    THEME_FILE_CONTENT+=$ENTRY
}

cp $THEME_TMPL_FILE $THEME_FILE
sed -i '' "s|// INCLUDE_RENDERED_THEME_DATA_HERE|${THEME_FILE_CONTENT}|" $THEME_FILE