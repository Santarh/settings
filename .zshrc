HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -U compinit
compinit

export PATH=/usr/local/texlive/2012/bin/x86_64-darwin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/Users/sumimau/bin:$PATH

alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
export EDITOR=vim
export SVN_EDITOR=vim
export LANG=ja_JP.UTF-8

export MY_DEPENDENCE="/Users/sumimau/Dropbox/Dependence/"

autoload colors
colors

case ${UID} in
0) ## Root
	PROMPT="%{${fg[green]}%}[%~]%n@%m%{${reset_color}%}# "
	PROMPT2="%_%% "
	SPROMPT="%r is correct? [n,y,a,e]: "
	;;
*) ## User
	PROMPT="%{${fg[yellow]}%}[%m:%~]
%{${fg[cyan]}%}%n%{${reset_color}%}$ "
	RPROMPT="[%D %*]"
	PROMPT2="%_%# "
	SPROMPT="%r is correct? [n,y,a,e]: "
	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]&&
		PROMPT="%{${fg[red]}%}[%m:%~]
%{${fg[green]}%}%n$ %{${reset_color}%}"
	;;
esac

export LSCOLORS=exFxCxdxBxegedabagacad

alias ls="ls -GwFh"
alias la="ls -la"
alias ll="ls -l"
alias javac="javac -encoding utf-8 -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"
alias glcc="gcc -m32 -framework Foundation -framework OpenGL -framework GLUT"
alias clang++11="clang++ -std=gnu++11 -stdlib=libc++"
alias ldd="otool -L"
alias reload="source ~/.zshrc"

setopt auto_list
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt prompt_subst
## setopt nobeep

unsetopt promptcr

## auto ls
##function chpwd() { ll }

## rvm
[[ -s "/Users/sumimau/.rvm/scripts/rvm" ]] && source "/Users/sumimau/.rvm/scripts/rvm"  # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#=============================
# source zsh-syntax-highlighting
#=============================
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
