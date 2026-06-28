# dirty editor
alias e='nvim'

# navigation
zoxide init fish | source

# better defaults
alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias lt='eza --tree --icons --level=2'
alias cat='bat --style=plain'

# git
alias lg='lazygit'

# docker
alias lzd='lazydocker'

# pacman / paru
alias p='paru'
alias pi='paru -S'
alias pr='paru -Rs'
alias pu='paru -Syu'
alias pq='paru -Ss'
alias pl='paru -Qs'
