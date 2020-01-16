# Silence zsh warning on Catalina
export BASH_SILENCE_DEPRECATION_WARNING=1

# path customizations
export PATH=$PATH:$HOME/bin
export EDITOR=/usr/local/bin/vim

# rbenv / ruby-build
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# bundler
alias bx="bundle exec"
alias frg="foreman run bundle exec guard"
alias frc="foreman run bundle exec rails c"

# rails
# spring is hanging a ton - see https://github.com/rails/spring/issues/396
export DISABLE_SPRING=1
alias cdm="cd $HOME/src/MethodologyDev/Methodology"
alias cdc="cd $HOME/src/MethodologyDev/methodology-client"
methvim() {  cdm && mvim -S ~/.vim/sessions/"${1:-meth}".vim .; }

# coursera
alias cdp="cd $HOME/src/coursera/progfun2"

# seedbox
alias ssk="ssh -i ~/.ssh/kimsufi_rsa -p 22546 seeder@ns331450.ip-37-187-121.eu"
alias ssdt="ssh -fNL 127.0.0.2:58846:localhost:58846 -i ~/.ssh/kimsufi_rsa -p 22546 seeder@ns331450.ip-37-187-121.eu"

# postgres
export PGHOST=localhost
alias dbsizes="echo 'SELECT pg_database.datname as \"database_name\", pg_database_size(pg_database.datname)/1024/1024 AS size_in_mb FROM pg_database ORDER by size_in_mb DESC;' | psql"
alias dbnames="echo 'SELECT pg_database.datname as \"database_name\" FROM pg_database ORDER by database_name ASC;' | psql -t"

# Load in the git branch prompt script.
source ~/.git-prompt.sh
PS1="\[$GREEN\]\t\[$RED\] \[$BLUE\]\u\[$YELLOW\]\[$YELLOW\] \w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\] \$ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# torch
export PATH=$PATH:/Users/john/torch/install/bin
export LD_LIBRARY_PATH=/Users/john/torch/install/lib:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=/Users/john/torch/install/lib:$DYLD_LIBRARY_PATH

# nvidia CUDA toolkit
export PATH=/Developer/NVIDIA/CUDA-6.5/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH

# set iterm tab title to current dir
# https://gist.github.com/phette23/5270658
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

## python development (using virtualenv and virtualenvwrapper)
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export PATH=$PATH:`python3 -m site --user-base`/bin
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/src
  source /usr/local/bin/virtualenvwrapper.sh
fi

## rust development
# racer
export PATH=$PATH:/Users/john/.cargo/bin
export RUST_SRC_PATH=/Users/john/src/rust/rustc/src
# rust-bindgen (see https://github.com/crabtw/rust-bindgen)
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/

## javascript development
export NODE_VERSION=8.11.1
export NVM_DIR="/Users/john/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

## go development
export GOPATH="Users/john/src/go"
