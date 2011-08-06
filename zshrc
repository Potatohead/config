# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="juanghurtado"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(command-not-found git cpanm deb dirpersist extract git perl ruby rvm ssh-agent svn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source $HOME/perl5/perlbrew/etc/bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export EDITOR=/usr/bin/vim
export PERL_AUTOINSTALL=--alldeps

# This line makes emacs launch the client instead. The alternate-editor bit is a
# bit of magic that makes the client launch an emacs daemon if one isn't
# running. Just remember that daemon stays running
alias emacs='TERM=rxvt-256color emacsclient --alternate-editor="" -nw'
#
# This alias is a convenience to access plain emacs
alias emacs-ns='TERM=rxvt-256color /usr/bin/emacs -nw'
