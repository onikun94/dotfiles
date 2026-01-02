#documents
alias cdd='cd ~/Documents'
#home
alias cdh='cd ~'
#cd previous
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
#フォルダ作成
alias m='mkdir'
#削除(ファイル)
alias r='rm -i'
#クリア
alias cl='clear'
#ls
alias ls='eza'
alias ll='eza -l'
alias la='eza -a'
alias lf='eza --only-files'
alias ld='eza --only-dirs'

#zshrc
alias zss='source ~/.zshrc'

#grep高速化
alias grep='rg'

#diff to delta
alias diff='delta'

# claude
alias cc='claude'
alias ccs='claude --dangerously-skip-permissions'

# tmux
alias tmux-panes="tmux split-window -h \\; split-window -v \\; select-pane -t 0 \\; split-window -v \\; select-pane -t 2 \\; split-window -v \\; select-pane -t 4 \\; split-window -v \\; select-pane -t 0"
alias tmux-list="tmux list-panes -F \"#{pane_index}: #{pane_id} #{pane_current_command} #{pane_active}\""

# Local aliases (machine-specific) are in ~/.zshrc.d/alias.local.zsh
