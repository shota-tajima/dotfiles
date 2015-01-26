#for rbenv
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH=/usr/local/sbin:$PATH

# git settings
source /usr/local/Cellar/git/2.2.2/etc/bash_completion.d/git-prompt.sh
source /usr/local/Cellar/git/2.2.2/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

#.bashrcの読み込み
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
