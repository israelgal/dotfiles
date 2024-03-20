#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# No me acuerdo para que son estos comandos 
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Pacman commands
alias p='sudo pacman'

# Vim commands
alias v='nvim'
alias nvc='cd ~/.config/nvim/'

# Bare repository 
alias bare="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias bs='bare status'
alias ba='bare add'
alias bc='bare commit -m'

# Bash aliases and config files
alias b='v ~/.bashrc'
alias t='tmux -u'
alias qc='cd ~/.config/qtile/'
alias venv='source ~/data_science/.venv/bin/activate'
alias jn='jupyter notebook'
alias sb='source ~/.bashrc'
alias d='deactivate'

# Miscelaneous
alias pdf='nohup zathura'
alias wk='cd ~/Documents/2024/'
alias notes='cd ~/Documents/2024/notes/ && v'
alias s='cd ~/scripting/'
alias ds='cd ~/data_science/ && venv'
alias c='clear'

#Git aliases 
alias ga='git add'
alias gm='git commit -m'
alias gp='git push'
alias gs='git status'
alias gl='git pull'

# Latex notes sync
alias ns='cd ~/Documents/2024/notes/ && git pull'

PS1='[\u@\h \W]\$ '



