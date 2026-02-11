

# +---------+
# | Network |
# +---------+

# nmap Network
alias mapn="nmap $1/24"

## Website info
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"

## check on open ports and status
alias port='netstat -tulanp'
#gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'}

## get current ip address
alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"
#getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';}

## Funny
kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;}
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""


# aliases to auto open certain extensions for editing
# alias -s [extension]="preferred-tool"
alias -s txt=nvim
alias -s py=code
alias -s json=nvim
alias -s yml=nvim

# discspace sorted by size
alias dspace='du -S | sort -n -r | less'
alias dust='du -sh * | sort -hr'

# autologon to servers
alias gopihole='ssh pihole@10.0.0.236'
alias gopims='ssh pims@10.0.0.234'
alias mntpims='sudo sshfs -o allow_other,default_permissions,cache=yes,auto_cache,reconnect,ServerAliveInterval=15'

# mount remote fs
alias msfs=sudo sshfs -o allow_other,default_permissions pims@10.0.0.190/opt/stacks/mserver $HOME/server/mserver

# +---------+
# | find-fd |
# +---------+
#
alias find="fd -H -i"
alias fnd="fd -H -i"
alias fd="fd -H -i"


# +--------+
# | System |
# +--------+

alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'

alias bigf= 'find / -xdev -type f -size +500M'  # display "big" files > 500M

## clear screen
cls() { cd "$1"; ls -la; }

## alias for update 20241010
alias agu='sudo apt update && sudo apt upgrade -y'

## Memory
alias meminfo='free -m -l -t'

## System info
alias cmount="mount | column -t"

sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}

## alias ps?="ps aux | grep"

## list open files
alias listen="lsof -P -i -n"


alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"


# +-----+
# | X11 |
# +-----+

alias xclass='xprop | grep WM_CLASS' # display xprop class

# +-----+
# | Zsh |
# +-----+

alias kitty='kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty'

# +----------------+
# | File/Directory |
# +----------------+

# alias ls='ls --color=auto'
# alias l='ls -l'
# alias ll='ls -lahF'
# alias lls='ls -lahFtr'
# alias la='ls -A'
# alias lc='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ls='eza -F --color=auto --group-directories-first'
alias lsa='eza -a --color=auto --group-directories-first'
alias lsal='eza -la --color=auto --group-directories-first'
alias lst='eza -T --color=auto --group-directories-first | less'
alias lstl='eza -Tal --color=auto --group-directories-first | less'
alias tree="ls -R | rg ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

#backup
backup() { cd "$1"{,.bak}; }    # create a .bak fil, leave original

# See stack
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index} > /dev/null"; unset index # directory stack

# Make directory and change into it
mcd() {
  mkdir -p "$1" && cd "$1"
}

# +------+
# | wget |
# +------+

alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"''

# +----+
# | cp |
# +----+

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias la='ls -alh'

# +------+
# | grep |
# +------+

alias grep="rg -P -i --color=auto"

# +------+
# | xlip |
# +------+

alias cb='xclip -sel clip'

# +------+
# | dust |
# +------+


# +------+
# | ping |
# +------+

alias pg='ping 8.8.8.8'

# +------+
# | time |
# +------+

alias time='/usr/bin/time'

# +----+
# | bc |
# +----+

alias calc="noglob calcul"

# +-----+
# | bat |
# +-----+

alias batl='bat --paging=never -l log'

# +-------+
# | fonts |
# +-------+

alias fonts='fc-cache -f -v'

# +--------+
# | netctl |
# +--------+

alias wifi='sudo wifi-menu -o'

# +--------+
# | Golang |
# +--------+

alias gob="go build"
alias gor="go run"
alias goc="go clean -i"
alias gta="go test ./..."       # go test all
alias gia="go install ./..."    # go install all

# +--------+
# | Neovim |
# +--------+

alias vim='nvim'
alias vi='nvim'

# +-----+
# | Git |
# +-----+

alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gp='git push'
alias gpraise='git blame'
alias gpo='git push origin'
alias gpof='git push origin --force-with-lease'
alias gpofn='git push origin --force-with-lease --no-verify'
alias gpt='git push --tag'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias grb='git branch -r'                                                                           # display remote branch
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gca='git commit --amend'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log --oneline'
alias gr='git remote'
alias grs='git remote show'
alias glol='git log --graph --abbrev-commit --oneline --decorate'
alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"                                                             # git log for each branches
alias gsub="git submodule update --remote"                                                        # pull submodules
alias gj="git-jump"                                                                               # Open in vim quickfix list files of interest (git diff, merged...)

alias dif="git diff --no-index"                                                                   # Diff two files even if not in git repo! Can add -w (don't diff whitespaces)

# +------+
# | tmux |
# +------+

alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'
alias tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf"


# +------+
# | lynx |
# +------+

alias lynx='lynx -vikeys -accept_all_cookies'


# +--------+
# | docker |
# +--------+
alias dockls="docker container ls | awk 'NR > 1 {print \$NF}'"                  # display names of running containers
alias dockRr='docker rm $(docker ps -a -q)'                                     # delete every containers / images
alias dockRr='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'   # delete every containers / images
alias dockstats='docker stats $(docker ps -q)'                                  # stats on images
alias dockimg='docker ls images'                                                   # list images installed
alias dockprune='docker system prune -a'                                        # prune everything

# +----------------+
# | docker-compose |
# +----------------+

alias docker-compose-dev='docker-compose -f docker-compose-dev.yml' # run a different config file than the default one
alias dockup='docker compose up -d'
alias dockd='docker compose down'
alias dockceu='docker-compose run --rm -u $(id -u):$(id -g)'                    # run as the host user
alias dockce='docker-compose run --rm'


# +----------+
# | Personal |
# +----------+

alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

# Folders
alias work="$HOME/workspace"
alias doc="$HOME/Documents"
alias dow="$HOME/Downloads"
alias dot="$HOME/.dotfiles"
alias proj="$HOME/projects"

# +--------+
# | Custom |
# +--------+

alias mke='mkextract'
alias ex='extract'

# +---------+
# | scripts |
# +---------+

# +---------+
# |  Debug  |
# +---------+

## Tail a log
alias tailf="tail -f journalctl | bat --paging=never -l log"

## trace a call
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"


#backup
backup() { cd "$1"{,.bak}; }

# checksum
md5check() { md5sum "$1" | grep "$2";}


alias makescript="fc -rnl | head -1 >"

# Generate a random password
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

histg() { history | rg "$1" }

# Copy cmdline to clipboard
cclip() {
  echo -n $BUFFER | xclip -selection clipboard
}
zle -N copy-line-to-clipboard

# Extract various compressed files
extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}


