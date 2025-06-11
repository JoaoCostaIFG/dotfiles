#!/bin/bash

song_info=$(playerctl metadata --format '{{title}} 🎵 {{artist}}' 2>/dev/null || printf '🎵 Nothing playing')

echo "$song_info"
