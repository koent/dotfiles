__git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/[\\\\\1]/`'

parse_git() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

create_ps1() {
        user=`whoami`@`uname -n`
        dollar="$"
        if [ $(whoami) == "root" ] ; then
                dollar="#"
        fi
        if git rev-parse 2>/dev/null ; then
                rel=`git rev-parse --show-prefix`
                if [[ $rel != "" ]] ; then
                        rel="/${rel::-1}"
                fi
		wd="$(git rev-parse --show-toplevel)\001\033[00m\002\001\033[01;36m\002[$(git branch --show-current)]\001\033[00m\002\001\033[01;34m\002$rel"
        else
                wd=`dirs +0`
        fi


        echo -e "\001\033[01;32m\002$user\001\033[00m\002:\001\033[01;34m\002$wd\001\033[00m\002$dollar "
}

if [ -n "$BASH_VERSION" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
    if [ "$color_prompt" = yes ]; then
    #    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;36m\]\$(parse_git)\[\033[00m\]\$ "
        PS1="\$(create_ps1)"
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
fi

alias nautilus="p=\`pwd\`; nautilus \"$p\""
#alias gmail="mutt -F /home/koen/.mutt/gmrc"
#alias rumail="mutt -F /home/koen/.mutt/rurc"
#alias uni="ssh -Y ktimmermans@lilo.science.ru.nl"
#alias uu="ssh -Y koti6457@siegbahn.it.uu.se"
alias stubru="cvlc http://icecast.vrtcdn.be/stubru-high.mp3"
alias p="python3 -i -c \"from math import *\""
alias tra="rlwrap trans --shell"
#alias vpn="sudo openvpn ~/.config/openvpn-ca-science.ovpn"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias please="sudo"
filesize(){ stat "$@" -c %s | numfmt --to=iec; }
cd(){ builtin cd "$@" && ls; }
#alias get_idf='. $HOME/Documenten/esp/esp-idf/export.sh'
alias sl="ls"





