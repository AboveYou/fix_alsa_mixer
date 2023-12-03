#!/bin/bash

config_file="/usr/share/alsa-card-profile/mixer/paths/analog-output.conf.common"
target_section="[Element PCM]"

# lines to insert
lines_to_insert="[Element Master]\nswitch = mute\nvolume = ignore\n"

# check if lines already exist
if grep -qF "[Element Master]" "$config_file"; then
    echo "Lines already exist. Exiting."
    exit 0
fi

# find the line number of the target section
line_number=$(grep -nF "$target_section" "$config_file" | cut -d: -f1)

# insert the lines before the target section
sed -i "${line_number}i $lines_to_insert" "$config_file"

