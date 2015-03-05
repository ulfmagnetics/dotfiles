# path customizations
export PATH=$PATH:$HOME/bin

# rbenv / ruby-build
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# bundler
alias bx="bundle exec"

# postgres
export PGHOST=localhost

# Load in the git branch prompt script.
source ~/.git-prompt.sh
PS1="\[$GREEN\]\t\[$RED\] \[$BLUE\]\u\[$YELLOW\]\[$YELLOW\] \w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\] \$ "

# set iterm tab title to current dir
# https://gist.github.com/phette23/5270658
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi
