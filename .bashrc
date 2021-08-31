# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
HISTSIZE=100
HISTFILESIZE=200

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Stuff for R
alias R='R --vanilla'

function rpkgc { 
  if [ -e $1/DESCRIPTION ]; then
    Rscript -e "Rcpp::compileAttributes('$1'); devtools::document('$1')" && R CMD INSTALL $1 --no-multiarch --with-keep.source
  else
    Rscript -e "Rcpp::compileAttributes('$1/..'); devtools::document('$1/..')" && R CMD INSTALL $1/.. --no-multiarch --with-keep.source
  fi
}
export -f rpkgc

function rtest { Rscript -e "devtools::test('$1')"; }
export -f rtest

function rcheck { Rscript -e "rcmdcheck::rcmdcheck('$1', args = '--as-cran')"; }
export -f rcheck

function knit { Rscript -e "rmarkdown::render('$1')"; }
export -f knit
complete -f -X '!*.Rmd' knit

# latex stuff
function btex { latexmk -pdf "$1" && latexmk -c; }
export -f btex
complete -f -X '!*.tex' btex

function mtex { latexmk -pdf -pvc "$1"; }
export -f mtex
complete -f -X '!*.tex' mtex

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# vim ignores latex auxiliary files
shopt -s extglob
complete -f -X '*.@(lot|pdf|aux|bbl|blg|fls|idx|ilg|ind|loa|lof|lot|toc|log|fdb_latexmk|o)' vim

alias pip=pip3
export R_PROGRESSR_ENABLE=TRUE
alias pullall='for i in */.git; do ( echo $i; cd $i/..; git pull; ); done'
