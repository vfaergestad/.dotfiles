# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
#

# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Autostart
exec --no-startup-id dex --autostart --environment i3

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

for_window [floating] move position center

# start a terminal
bindsym $mod+Return exec gnome-terminal

# kill focused window
bindsym $mod+Shift+q kill

# Lock screen
bindsym $mod+l exec i3lock -c 000000 --ignore-empty-password

# start dmenu (a program launcher)
#bindsym $mod+d exec --no-startup-id dmenu_run
# A more modern dmenu replacement is rofi:
bindsym $mod+d exec "rofi -modi drun,filebrowser,run -show-icons -show drun"
# There also is i3-dmenu-desktop which only displays applications shipping a
# .desktop file. It is a wrapper around dmenu, so you need that installed.
# bindcode $mod+40 exec --no-startup-id i3-dmenu-desktop

# Rofi window switcher
bindsym $mod+Tab exec "rofi -modi windowcd,window -show windowcd"

# change focus
#bindsym $mod+j focus left
#bindsym $mod+k focus down
#bindsym $mod+l focus up
#bindsym $mod+oslash focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+oslash move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

#workspace_layout tabbed

# Assign workspaces to primary monitor
workspace 1 output primary
workspace 2 output primary
workspace 3 output primary
workspace 4 output primary
workspace 5 output primary

# Assign workspaces to secondary monitor
workspace 6 output HDMI-A-0 primary
workspace 7 output HDMI-A-0 primary
workspace 8 output HDMI-A-0 primary
workspace 9 output HDMI-A-0 primary
workspace 10 output HDMI-A-0 primary

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym oslash resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
# panel
bar {
    colors {
    background #2f343f
#    statusline #2f343f
    separator #4b5262

    # colour of border, background, and text
    focused_workspace   #2f343f #bf616a #d8dee8
    active_workspace    #2f343f #2f343f #d8dee8
    inactive_workspace  #2f343f #2f343f #d8dee8
    urgent_workspace    #2f343f #ebcb8b #2f343f
    }
    status_command i3status
}

# PERSONAL KEYBINDINGS
bindsym $mod+n exec nemo
bindsym $mod+b exec vivaldi

# colour of border, background, text, indicator, and child_border
client.focused          #bf616a #2f343f #d8dee8 #bf616a #d8dee8
client.focused_inactive #2f343f #2f343f #d8dee8 #2f343f #2f343f
client.unfocused        #2f343f #2f343f #d8dee8 #2f343f #2f343f
client.urgent           #2f343f #2f343f #d8dee8 #2f343f #2f343f
client.placeholder      #2f343f #2f343f #d8dee8 #2f343f #2f343f
client.background       #2f343f
for_window [class=".*"] border pixel 0

# Function keys
bindsym XF86MonBrightnessUp exec brightnessctl set +10 # increase screen brightness
bindsym XF86MonBrightnessDown exec brightnessctl set 10- # decrease screen brightness

# Gaps
default_border pixel 0
gaps inner 8
gaps outer 3
smart_gaps on

# Background image
exec_always --no-startup-id feh --bg-scale /home/vegard/.config/i3/background_images/firewatch.jpg

# Theme
exec --no-startup-id /usr/lib/gsd-xsettings

## Clipboard Screenshots
#bindsym Ctrl+Print exec --no-startup-id maim | xclip -selection clipboard -t image/png
#bindsym Ctrl+$mod+Print exec --no-startup-id maim --window $(xdotool getactivewindow) | xclip -selection clipboard -t image/png
#bindsym Ctrl+Shift+Print exec --no-startup-id maim --select | xclip -selection clipboard -t image/png
bindsym Print exec flameshot gui

# Assign applications to workspaces
assign [class="Signal"] $ws3
assign [class="discord"] $ws3

# Sticky
bindsym $mod+Shift+s sticky toggle

## Start PICOM
exec --no-startup-id picom

## Start 1password
exec --no-startup-id 1password
