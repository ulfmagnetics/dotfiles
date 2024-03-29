# Silence zsh warning on Catalina
export BASH_SILENCE_DEPRECATION_WARNING=1

# path customizations
export PATH=$PATH:$HOME/bin
export EDITOR=/usr/local/bin/vim

# rbenv / ruby-build
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# bundler
alias bx="bundle exec"
alias frg="foreman run bundle exec guard"
alias frc="foreman run bundle exec rails c"

# rails
# spring is hanging a ton - see https://github.com/rails/spring/issues/396
export DISABLE_SPRING=1
alias cdm="cd $HOME/src/MethodologyDev/Methodology"
alias cdc="cd $HOME/src/MethodologyDev/methodology-client"
dc()  { docker compose -f docker-compose.yml -f docker-compose-dev.yml $@; }
dcu() { docker compose -f docker-compose.yml -f docker-compose-dev.yml up; }
dcr() { dc run --rm --name oneoff-`date +%s` web $@; }
dcx() { dcr bundle exec $@; }
methvim() {  cdm && mvim -S ~/.vim/sessions/"${1:-meth}".vim .; }
gemvim() { ( cdm && cd `bundle info $1 --path`; mvim .; ) }

# coursera
alias cdp="cd $HOME/src/coursera/progfun2"

# seedbox
alias ssk="ssh -i ~/.ssh/kimsufi_rsa -p 22546 seeder@ns331450.ip-37-187-121.eu"
alias ssdt="ssh -fNL 127.0.0.2:58846:localhost:58846 -i ~/.ssh/kimsufi_rsa -p 22546 seeder@ns331450.ip-37-187-121.eu"

# postgres
export PGHOST=localhost
alias dbsizes="echo 'SELECT pg_database.datname as \"database_name\", pg_database_size(pg_database.datname)/1024/1024 AS size_in_mb FROM pg_database ORDER by size_in_mb DESC;' | psql"
alias dbnames="echo 'SELECT pg_database.datname as \"database_name\" FROM pg_database ORDER by database_name ASC;' | psql -t"

# set up prompt
. ~/.bash_prompt

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

## python development (using pyenv and pipenv)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
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
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

## java development
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="$PATH:$HOME/src/apache-maven-3.6.0/bin"

# AWS Glue development
export SPARK_HOME="$HOME/src/spark-2.4.3-bin-spark-2.4.3-bin-hadoop2.8"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/john/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/john/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/john/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/john/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

