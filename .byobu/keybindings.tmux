# remove all key bindings
unbind-key -a
unbind-key -n -a

# set prefix
set -g prefix F12
unbind-key -n C-a

# window create/navigate commands
bind-key -n F2 new-window -c "#{pane_current_path}"
bind-key -n F3 previous-window
bind-key -n F4 next-window
bind-key -n M-C new-window -c "#{pane_current_path}"
bind-key -n C-PageUp previous-window
bind-key -n C-PageDown next-window

bind-key : command-prompt
bind-key -n F6 detach
bind-key -n F7 copy-mode
