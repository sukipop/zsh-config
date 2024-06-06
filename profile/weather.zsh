weather_json="${STORAGE}/Tasker/cache/weather.json"

# Check if the weather JSON file exists
if [[ -f "$weather_json" ]]; then
    # Extract sunrise and sunset times using jq
    export SUNRISE=$(jq -r '.current.sunrise' "$weather_json")
    export SUNSET=$(jq -r '.current.sunset' "$weather_json")
fi
