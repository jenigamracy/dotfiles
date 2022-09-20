# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

PATH=~/sfdx/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set terminal title
termtitle() { printf "\033]0;$*\007"; }

# SFDX
eval 
SFDX_AC_BASH_SETUP_PATH=/home/jeni/.cache/sfdx/autocomplete/bash_setup && test -f $SFDX_AC_BASH_SETUP_PATH && source $SFDX_AC_BASH_SETUP_PATH; # sfdx autocomplete setup
