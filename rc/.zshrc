# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
#export PROMPT="${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)"
#virtualenv ~/.homeenv
#source ~/.homeenv/bin/activate
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="eastwood"
# make sure ssh agent exists and all my ssh keys are added
eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa ~/.ssh/id_rsa_github ~/.ssh/infradev-id_rsa
#cd ~/envs

export PATH="$HOME/.cargo/bin:$PATH"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias ls="ls -lt"
alias ag="ag -i"
alias salias="source ~/.zshrc"
alias dev="source ~/envs/dev/bin/activate; cd ~/envs/dev/infinilab/"
export DISABLE_AUTO_TITLE="true"
alias j='jobs'
alias grep='grep -i'
alias gv='grep -v'
alias gr='grep -r'
#alias diff='colordiff'
#alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
# ssh connections
alias itzik="/home/archhome/.infinidat/itzik"
alias db="ssh ilab-sivan-db"
alias dmns="ssh ilab-sivan-dmns"
alias serv="ssh ilab-sivan"
alias inf="ssh infinilab"
alias infdb="ssh infinilab-db"
alias infdmns="ssh infinilab-daemons"
alias unloadDNS="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist"
alias loadDNS="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist"
alias getMaster="gc git@git.infinidat.com:infradev/infinilab.git"
alias envs="cd ~/envs"
alias pipf="pip freeze"
alias start="source ~/configuration/tmux_env/.env3/bin/activate ; /home/archhome/configuration/tmux_env/start.py"
# git shit
alias gd="git diff"
alias gs="git status"
alias gc="git clone"
alias gco="git checkout"

# sivan private
export PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:$HOME/envs/itzik/:/usr/local/go/bin:$PATH"
alias v="vim"
alias crontab="export EDITOR=/usr/bin/vim;crontab"

# new iterm default venv ( python 3.5 )
#envs
#source .default_env_3/bin/activate
enter_tmux_for_new_term () {
if [ -z ${TMUX} ]; then
	echo ">>> ALREADY IN TMUX SESSION";
	start newterm;
fi
}

enter_tmux_for_new_term

p3 () {
envs
source .default_env_3/bin/activate
}

p2() {
envs
source .default_env_2/bin/activate

}

tma () {
tmux attach -t $1
}	

tml () {
tmux ls
}

activate () {
source $1/bin/activate
}

# nmv = New Master Env macro 
# will create a new venv ,activate and clone master into it.
nmv () {
cd ~/envs
echo ">>>>> CREATING VIRTUALENV.."
virtualenv $1
cd $1
source bin/activate
echo ">>>>> CLONING INFINILAB MASTER BRANCH INCLUDING SUBMODULES.."
git clone --recursive git@git.infinidat.com:infradev/infinilab.git
cd infinilab
echo ">>>>> INSTALLING DEPENDENCIES.."
#pip install -r ~/Scripts/new_master_env_requirments.txt
pip install -r ~/Scripts/frz_new.txt
echo ">>>>> INSTALLING IPYTHON"
pip install ipython
echo ">>>>> INSTALLING ANSIBLE"
pip install ansible
echo ">>>>> GOOD TO GO -->"
pwd 
}

add_alias () {
vim ~/.zshrc
echo ">>>>> SOURCING ZSHRC FILE.."
salias
} 

get_v () {
ls -l ~/envs | awk '{print $9}'
}

workon () {
cd ~/envs/$1/infinilab
source ~/envs/$1/bin/activate
}

leave () {
deactivate
cd
}

mac () {
wget "https://labs.infinidat.com/_/api/json/objs/?mac=$1" >& /dev/null
cat index.html*
rm index.html?mac=*
}

infip () {
wget "https://labs.infinidat.com/_/api/json/objs/?ipv4_address=$1" >& /dev/null
cat index.html*
rm index.html?ipv4_address=*
}

wwpn (){
wget "https://labs.infinidat.com/_/api/json/objs/?wwpn=$1" >& /dev/null
cat index.html*
rm index.html?wwpn=*
}
    
title () {

echo -ne "\e]1;$1\a"
}

# move to scripts using python2 env
scr2 () {
cd ~/Scripts
source ~/envs/.default_env_2/bin/activate

}

# scripts env with python 3
scr3 () {
cd ~/Scripts
source ~/envs/.default_env_3/bin/activate

}

# history search
hist () {
if [ $2 ne ""]; then
       history | ag $1 | tail -n$2
fi
if [ $2 = ""]; then
	history | ag $1 |tail -n5
fi
}

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
