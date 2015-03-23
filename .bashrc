#lsのオプション設定
alias ls='ls -G'
alias lsa='ls -AG'
alias lsl='ls -Galt'

#ls -Gのカラー設定
export LSCOLORS=gxfxcxdxbxegedabagacad

# show dot-files
alias dfon="defaults write com.apple.finder AppleShowAllFiles true|killall Finder"
# hidden dot-files
alias dfoff="defaults write com.apple.finder AppleShowAllFiles false|killall Finder"
