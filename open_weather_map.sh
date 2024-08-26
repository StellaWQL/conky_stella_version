#!/bin/bash

# Define API URL
API_URL="https://api.openweathermap.org/data/3.0/onecall?lat=31.17&lon=121.56&exclude=minutely,hourly,alerts&appid=747b3c90487ed333cc175edd987192dd"

# Fetch data from API
response=$(curl -s "$API_URL")

# Extract data using jq
current_temp=$(echo $response | jq -r '.current.temp - 273.15 | round')
today_min=$(echo $response | jq -r '.daily[0].temp.min - 273.15 | round')
today_max=$(echo $response | jq -r '.daily[0].temp.max - 273.15 | round')
today_pop=$(echo $response | jq -r '.daily[0].pop * 100 | round')
today_moon_phase=$(echo $response | jq -r '.daily[0].moon_phase')
tomorrow_min=$(echo $response | jq -r '.daily[1].temp.min - 273.15 | round')
tomorrow_max=$(echo $response | jq -r '.daily[1].temp.max - 273.15 | round')
tomorrow_pop=$(echo $response | jq -r '.daily[1].pop * 100 | round')
tomorrow_moon_phase=$(echo $response | jq -r '.daily[1].moon_phase')

# Print outputs for Conky to use
echo "$current_temp"
echo "$today_min-$today_max"
echo "$today_pop"
echo "$today_moon_phase"
echo "$tomorrow_min-$tomorrow_max"
echo "$tomorrow_pop"
echo "$tomorrow_moon_phase"

