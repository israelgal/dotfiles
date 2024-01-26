#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Aliases made for me 
alias p='sudo pacman'
alias v='nvim'
alias bare="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias pdf='nohup zathura'
alias nvc='cd ~/.config/nvim/'
alias wk='cd ~/Documents/2023/'
alias notes='cd ~/Documents/2023/notes/ && v'
alias b='v ~/.bashrc'
alias s='cd ~/scripting/'
alias qc='cd ~/.config/qtile/'
alias t='tmux -u'
alias venv='source ~/data_science/.venv/bin/activate'
alias jn='jupyter notebook'
alias sb='source ~/.bashrc'
alias d='deactivate'

PS1='[\u@\h \W]\$ '



