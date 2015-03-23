#
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# git settings
source /usr/local/Cellar/git/2.3.3/etc/bash_completion.d/git-prompt.sh
source /usr/local/Cellar/git/2.3.3/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# Dockerクライアントの接続先をboot2docker上のDockerサーバへ
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/tajimashouta/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Dockerのコマンド補完
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#.bashrcの読み込み
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
