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
