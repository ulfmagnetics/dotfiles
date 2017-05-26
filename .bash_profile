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
alias cdm="cd src/MethodologyDev/docker-services/monolith/"

# postgres
export PGHOST=localhost

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
export NODE_VERSION=6.9.1
export NVM_DIR="/Users/john/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm]
