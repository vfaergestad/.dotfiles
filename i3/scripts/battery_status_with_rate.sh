#!/bin/bash

# Get upower information for the battery
upower_output=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0)

# Extract relevant information
state=$(echo "$upower_output" | grep -E 'state:' | awk '{print $2}')
time_remaining=$(echo "$upower_output" | grep -E 'time to empty:|time to full:' | awk '{print $4 " " $5}')
percentage=$(echo "$upower_output" | grep -E 'percentage:' | awk '{print $2}')
energy_rate=$(echo "$upower_output" | grep -E 'energy-rate:' | awk '{print $2 " " $3}')

# Combine extracted information into a single line
echo "BAT: $state, Time: $time_remaining, $percentage, Rate: $energy_rate"

