conky.config={

    -- General configuration
    background           = true, -- Fork Conky to background when started
    double_buffer        = true, -- Enable double buffering (do not set to false)
    total_run_times      = 0,    -- Total number of times for Conky to update before quitting. Zero makes Conky run forever 
    update_interval      = 1,    -- Update interval in seconds

    -- Fonts
    override_utf8_locale = true, -- Force utf-8
    use_xft              = true, -- Use Xft (anti-aliased font and stuff) 
    xftalpha             = 0,    -- Alpha of Xft font. Must be a value at or between 1 and 0. 

    -- Own Window
    own_window_class = 'conky-semi',
    own_window_hints = 'undecorated,below,skip_taskbar,skip_pager,sticky',
    own_window = true,
    own_window_argb_visual = true,
    own_window_argb_value = 255, -- When ARGB visuals are enabled, this use this to modify the alpha value used. Valid range is 0-255, where 0 is 0% opacity, and 255 is 100% opacity.  
    own_window_colour = '000000',
    own_window_transparent = true,

    -- Colors
    default_color = 'white', -- Text color

    -- Position
    alignment = 'top_right', -- Text alignment on screen, {top,bottom,middle}_{left,right,middle} or none. 
    gap_x = 100,             -- Gap, in pixels, between right or left border of screen
    gap_y = 80,              -- Gap, in pixels, between top or bottom border of screen
};

conky.text = [[
${voffset 80}${font ADELE:size=22}${exec date +'%A, %_d %B, %H:%I %p' | sed -e "s/\b\(.\)/\u\1/g"}
\
# --- Weather --- #
###################
\
# --- WOEID (Location id) --- #
${execi 300 curl -s "http://api.openweathermap.org/data/2.5/weather?zip=44640,fr&units=metric&APPID=$(cat ~/.config/conky/flair-weather.json | jq -r .openweathermap.appid)" -o ~/.cache/weather.json}\
\
# --- Temperature --- #
#######################
\
${font ADELE :size=30}${voffset 10}${execi 300 cat ~/.cache/weather.json | jq -r .main.temp | sed -E 's/([0-9]+).[0-9]+/\1/'}°${font ADELE :size=15}C${font ADELE :size=30}${voffset -20}  |
\
# --- Weather icon --- #
########################
\
${execi 300 cp -f assets/images/white/$(cat ~/.cache/weather.json | jq -r .weather[0].icon).png ~/.cache/weather-1.png}${image ~/.cache/weather-1.png -p 0,0 -s 80x80}
\
# --- Textual condition (e.g. Partly cloudy) --- #
##################################################
\
${font Roboto Light:size=18}${offset 80}${voffset -85}${execi 300 cat ~/.cache/weather.json | jq -r .weather[0].description | sed -e "s/\b\(.\)/\u\1/g"}
\
# --- Icon - high temperature --- #
###################################
\
${image assets/images/arrow-up.png -p 0,167 -s 12x12}
\
# --- High temperature --- #
############################
\
${font Roboto Light :size=12}${offset 20}${voffset -25}${execi 300 cat ~/.cache/weather.json | jq -r .main.temp_max | sed -E 's/([0-9]+).[0-9]+/\1/'}°
\
# --- Icon - low temperature icon --- #
#######################################
\
${image assets/images/arrow-down.png -p 50,167 -s 12x12}
\
# --- Low temperature --- #
###########################
\
${font Roboto Light :size=12}${offset 70}${voffset -39}${execi 300 cat ~/.cache/weather.json | jq -r .main.temp_min | sed -E 's/([0-9]+).[0-9]+/\1/'}°
\
# --- Icon - map marker --- #
#############################
\
${image assets/images/map-marker.png -p 100,165 -s 20x16}
\
# --- Location name (city and country) --- #
############################################
\
${font Roboto Light :size=12}${offset 125}${voffset -37}${execi 300 cat ~/.cache/weather.json | jq -r .name}, ${execi 300 cat ~/.cache/weather.json | jq -r .sys.country}

]];
