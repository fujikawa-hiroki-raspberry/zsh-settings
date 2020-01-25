alias zshedit="vim ~/.zshrc"
alias source="source ~/.zshrc"

# setopt
setopt ignoreeof
setopt correct
setopt auto_cd
setopt prompt_subst

# export
export LANG=ja_JP.UTF-8

# zstyle
zstyle ':vcs_info:git:*' formats '%b'

# autoload
autoload -Uz colors
autoload -Uz vcs_info
autoload -Uz compinit
autoload predict-on

colors
compinit
predict-on

# git設定
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats '%b'

# cd後にディレクトリの中を表示
function chpwd() { ls -laG }

PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color} %~ ``
%# "
RPROMPT="[\$vcs_info_msg_0_]"

# finder -> terminal
cdf () {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [ "$target" != "" ]
        then
                cd "$target"
                pwd
        else
                echo 'No Finder window found' >&2
        fi
}

# terminal -> finder
alias f="open ."
