source /usr/share/cachyos-fish-config/cachyos-config.fish

set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gcr/ssh

fish_add_path -g ~/.local/bin
