#!/bin/bash
# Starts up conky instances in quiet mode
#
# By Stella Liu

sleep 3
/usr/bin/conky -q -c ~/.config/conky/sysinfo_conkyrc
#/usr/bin/conky -q -c ~/.config/conky/kernlog_conkyrc
#/usr/bin/conky -q -c ~/.config/conky/covid_conkyrc
#/usr/bin/conky -q -c ~/.config/conky/gkeep_conkyrc
#/usr/bin/conky -q -c ~/.config/conky/aliases_conkyrc
#/usr/bin/conky -q -c ~/.config/conky/vinyl_music_conkyrc
/usr/bin/conky -q -c ~/.config/conky/open_weather_map_conkyrc
#/usr/bin/conky -q -c ~/.config/conky/vinyl_music_conkyrc
