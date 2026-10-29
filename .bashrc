# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'

PS1='\[\e[33m\]FILTH\[\e[0m\]:\[\e[31m\]VBVDONNED\[\e[33m\]\$\[\e[0m\] '
# PS1='\[\e[32m\]\h\[\e[0m\]:\[\e[31m\][\[\e[34m\]\u\[\e[31m\]]:\w\[\e[33m\]\$\[\e[0m\] '
# PS1='\[\e[32m\]\h \[\e[0m\]: \[\e[31m\]\][ \[\e[34m\]\]\]\u \[\e[31m\]\]\]]:\w \[\e[33m\]\]\$ '
#PS1= '[\u@\h \W]\$ '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH:/usr/lib/jvm/java-24-openjdk/bin/"


alias settings='~/dwm/scripts/settingsMenu.sh'
export EDITOR=nvim

gh() {
    historyString=$(tac ~/.bash_history | grep "${@: -1}")
    countFound=$(echo -e "$historyString" | wc -l)
    
    readarray -t lines <<< "$historyString"
    for ((i=1; i<=($countFound) && i<=9; i++)); do 
        echo $i ${lines[$i-1]};
    done
    
    echo -en "\n>>>"
    read input
    
    for ((i=-1; i<=($countFound) && i<=9; i++)); do
        tput cuu1;
        tput el;
    done
    
    echo "${lines[$input-1]}"
    eval "${lines[$input-1]}"
}
