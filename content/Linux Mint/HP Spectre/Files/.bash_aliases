# ls
# alias ll='ls -halF --group-directories-first --time-style=long-iso'
# alias la='ls -A --group-directories-first'
# alias l='ls -CF --group-directories-first'

# ls (exa)
alias l='exa --classify --group-directories-first --time-style=long-iso'
alias ll='l --long --header'
alias la='ll --all'

# Source commmon files
alias sbash="source ~/.bashrc"
alias salias="source ~/.bash_aliases"
alias snnn=". ~/.nnnrc"

# Directory jumps
alias cdbin="cd ~/bin"

# Networking
alias netup="curl -Is www.google.com | head -n 1"
alias netip="ip -c address"
alias netlisten="sudo netstat -tulpn | grep LISTEN"
alias netlisten2="sudo lsof -i -P -n | grep LISTEN"

# Misc
alias doseols="grep -IUrl --color --exclude-dir=node_modules --exclude-dir=.git \"\""
alias fixdoseols="grep -IUrlZ --color --exclude-dir=node_modules --exclude-dir=.git \"\" | xargs -0 -n 1 -P 4 dos2unix"
# alias echopath="echo \$PATH | sed -E -e 's/:/\n/g' | sort"
alias echopath="echo \$PATH | tr ':' '\n' | sort"

#
# vim
#

# Edit common files
alias ebash="vim ~/.bashrc"
alias ealias="vim ~/.bash_aliases"
alias epaths="vim ~/.bash_paths"
alias ennn="vim ~/.nnnrc"
alias eod="vim ~/.config/onedrive/config"
alias eods="vim ~/.config/onedrive/sync_list"

#
# git
#

# Common aliases
#   gs  : git status
#   gl  : git log (showing only first-parent, that is, with no merged branches)
#   gla : git log (showing oll, including merged branches)
#   ga  : git log ancestry
#   gsb : git show branch
alias gs="git status"
alias gl="git log --first-parent -n 15"
alias gla="git log -n 15"
alias ga="~/bin/git-ancestry.sh"
alias gsb="~/bin/git-showbranch.sh"

#
# Services
#

#
# onedrive
#
alias od.start="systemctl --user start onedrive.service"
alias od.restart="systemctl --user restart onedrive.service"
alias od.stop="systemctl --user stop onedrive.service"
alias od.status="systemctl --user status onedrive.service"
alias od.cfg="vim ~/.config/onedrive/config"
alias od.sl="vim ~/.config/onedrive/sync_list"
alias od.log="~/bin/onedrive_log"
alias od.log2="vim /var/log/onedrive/demian.onedrive.log"

#
# node / npm
#

alias nlsg="npm list -g --depth=0 2>/dev/null"
alias nls="npm list --depth=0 2>/dev/null"
alias nib="node --inspect-brk=9678"

#
# quartz
#

# Tech Vault
alias q.tech.meld="meld ~/OneDrive/Documents/Demian/Obsidian/'Tech Vault'/ ~/quartz/tech/content/ &"
alias q.tech.rsync="rsync --verbose --delete --recursive --exclude='.git*' --exclude='.obsidian' ~/OneDrive/Documents/Demian/Obsidian/'Tech Vault'/* ~/quartz/tech/content/"
alias q.tech.build="cd ~/quartz/tech/; npx quartz build"
alias q.tech.sync="cd ~/quartz/tech/; npx quartz sync"
alias q.tech.all="q.tech.rsync; q.tech.build; q.tech.sync"

# Rosella Vault
alias q.rosella.meld="meld ~/OneDrive/Documents/Demian/Obsidian/'Rosella Vault'/ ~/quartz/rosella/content/ &"
alias q.rosella.rsync="rsync --verbose --delete --recursive --exclude='.git*' --exclude='.obsidian' ~/OneDrive/Documents/Demian/Obsidian/'Rosella Vault'/* ~/quartz/rosella/content/"
alias q.rosella.build="cd ~/quartz/rosella/; npx quartz build"
alias q.rosella.sync="cd ~/quartz/rosella/; npx quartz sync"
alias q.rosella.all="q.rosella.rsync; q.rosella.build; q.rosella.sync"
