# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias df='df -h'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ln='ln -i'
alias ports='netstat -tulanp'
alias mkdir='mkdir -pv'
alias clrcnsl='printf "\033c"'
#alias fsize='for fol in `ls -Ad */`; do du -h $fol 2>/dev/null| tail -1 ; done'
alias fsize='du -h -d 1'
alias pacnor='pacman -Qt'
alias upaur='yay -Sau'
alias aurpackages='pacman -Qm'
alias orppac='pacman -Qdtq'
#alias make='colormake'
alias vimservd='vim --servername tmp'
alias vimserve='vim --servername tmp --remote'
alias reboot="sudo systemctl reboot"
alias poweroff="sudo systemctl poweroff"
alias i3-resurrect-save="i3-resurrect save -d ~/.i3/i3-resurrect/"
alias i3-resurrect-restore="i3-resurrect restore -d ~/.i3/i3-resurrect/"
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases.local ]; then
    . ~/.bash_aliases.local
fi
