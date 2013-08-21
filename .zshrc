HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -U compinit
compinit

case ${OSTYPE} in
darwin*)
	export PATH=/usr/local/texlive/2012/bin/x86_64-darwin:$PATH
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH
	export PATH=/Users/sumimau/bin:$PATH
	alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
	alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
	export MY_DEPENDENCE="/Users/sumimau/Dropbox/Dependence/"
	;;
esac

export EDITOR=vim
export SVN_EDITOR=vim
export LANG=ja_JP.UTF-8

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

case ${OSTYPE} in
darwin*)
	alias ls="ls -GwFh"
	alias glcc="gcc -m32 -framework Foundation -framework OpenGL -framework GLUT"
	alias ldd="otool -L"
	;;
linux*)
	alias ls="ls --color --block-size=M"
	;;
esac

alias la="ls -la"
alias ll="ls -l"
alias reload="source ~/.zshrc"
alias findgrep="find . | grep"

alias javac="javac -encoding utf-8 -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"
alias clang++11="clang++ -std=gnu++11 -stdlib=libc++"

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
[[ -s $HOME/"/.rvm/scripts/rvm" ]] && source $HOME"/.rvm/scripts/rvm"  # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#=============================
# source zsh-syntax-highlighting
#=============================
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
