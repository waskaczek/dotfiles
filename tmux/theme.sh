######################################
#   File: Tmux theme.                #
#   __    __          _              #
#  / / /\ \ \__ _ ___| | ___   _     # 
#  \ \/  \/ / _` / __| |/ | | | |    #
#   \  /\  | (_| \__ |   <| |_| |    #
#    \/  \/ \__,_|___|_|\_\\__, |    #
#                          |___/     #
#   https://github.com/waskaczek     #
######################################

###################################################
#   Colors
###################################################
color_green="colour076"
color_blue="#0087d7"
color_yellow="colour220"
color_red="colour160"
color_black="colour232"
color_white="white"

color_basic="color_blue"
color_active_pane_border="#008888"
color_dark="$color_black"
color_light="$color_white"
color_session_text="$color_blue"
color_status_text="$color_blue,bold"
color_main="$color_blue"
color_secondary="$color_white"
color_level_ok="$color_green"
color_level_warn="$color_yellow"
color_level_stress="$color_red"
color_window_off_indicator="colour088"
color_window_off_status_bg="colour238"
color_window_off_status_current_bg="colour254"

###################################################
#   Apperance
###################################################

set -g mode-style "fg=default,bg=$color_main"

# command line style
set -g message-style "fg=$color_main,bg=$color_dark"

# status line style
set -g status-style "fg=$color_status_text,bg=$color_dark"

# window segments in status line
set -g window-status-separator "|"
status_separator_left="▶"
status_separator_right="◀"

setw -g window-status-format " #I:#W "
setw -g window-status-current-style "fg=$color_light,bold,bg=$color_main"
setw -g window-status-current-format "#[fg=$color_dark,bg=$color_main]$status_separator_left#[default] #I:#W# #[fg=$color_dark,bg=$color_main]$status_separator_right#[default]"

# when window has monitoring notification
setw -g window-status-activity-style "fg=$color_main"

# outline for active pane
setw -g pane-active-border-style "fg=$color_active_pane_border,bold"
setw -g pane-border-fg "$color_blue"

# general status bar settings
set -g status on
set -g status-interval 5
set -g status-position bottom
set -g status-justify left
set -g status-right-length 100

set -g @cpu_low_fg_color "#[fg=$color_level_ok]"
set -g @cpu_medium_fg_color "#[fg=$color_level_warn]"
set -g @cpu_high_fg_color "#[fg=$color_level_stress]"

# define widgets we're going to use in status bar
# note, that this is not the complete list, some of them are loaded from plugins
wg_session="#[fg=$color_session_text] #S #[default]"
wg_battery="#{battery_status_fg} #{battery_icon} #{battery_percentage}"
wg_date="#[fg=$color_secondary]%h %d %H:%M#[default]"
wg_user_host="#[fg=$color_secondary]#(whoami)#[default]@#H"
wg_is_zoomed="#[fg=$color_dark,bg=$color_secondary]#{?window_zoomed_flag,[Z],}#[default]"
wg_is_keys_off="#[fg=$color_light,bg=$color_window_off_indicator]#([ $(tmux show-option -qv key-table) = 'off' ] && echo 'OFF')#[default]"

cpu_status="CPU: #{cpu_icon} #{cpu_fg_color}#{cpu_percentage}#[default]"

set -g status-left "$wg_session"

set -g status-right "#{prefix_highlight} $wg_is_keys_off $wg_is_zoomed | ${cpu_status} | #{sysstat_mem} | $wg_user_host | $wg_date $wg_battery #{online_status}"

# online and offline icon for tmux-online-status
set -g @online_icon "#[fg=$color_level_ok]●#[default]"
set -g @offline_icon "#[fg=$color_level_stress]●#[default]"

# Configure view templates for tmux-plugin-sysstat "MEM" and "CPU" widget
set -g @sysstat_mem_view_tmpl 'MEM:#[fg=#{mem.color}]#{mem.pused}#[default] ❯ #{mem.used}/#{mem.total}'
set -g @sysstat_cpu_view_tmpl 'CPU:#{cpu.pused}'

# Configure colors for tmux-plugin-sysstat "MEM" and "CPU" widget

set -g @sysstat_mem_color_low "$color_level_ok"
set -g @sysstat_mem_color_medium "$color_level_warn"
set -g @sysstat_mem_color_stress "$color_level_stress"

set -g @sysstat_swap_color_low "$color_level_ok"
set -g @sysstat_swap_color_medium "$color_level_warn"
set -g @sysstat_swap_color_stress "$color_level_stress"


# Configure tmux-battery widget colors
set -g @batt_color_full_charge "#[fg=$color_level_ok]"
set -g @batt_color_high_charge "#[fg=$color_level_ok]"
set -g @batt_color_medium_charge "#[fg=$color_level_warn]"
set -g @batt_color_low_charge "#[fg=$color_level_stress]"

# Configure tmux-prefix-highlight colors
set -g @prefix_highlight_output_prefix '['
set -g @prefix_highlight_output_suffix ']'
set -g @prefix_highlight_fg "$color_light"
set -g @prefix_highlight_bg "$color_basic"
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_copy_mode_attr "fg=$color_dark,bg=$color_secondary"