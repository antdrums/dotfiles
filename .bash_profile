
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

alias ls='ls -G'
alias grep='grep --color=auto'
alias ll='ls -alh'

# Git aliases
alias gl='git log --oneline --decorate --graph --all'
alias gs='git status'
alias gcam='git commit -am'
alias gpom='git push origin master'
alias gpob='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gpub='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gull='git pull'
alias gush='git push'
alias gb='git checkout -b'
alias gco='git checkout'
alias grh='git reset --hard'
alias gclean='git branch | grep -ve " master$" | xargs git branch -D'

# Folder aliases
alias code='cd /Volumes/Data/Code'
alias exp-devops='code && cd exp-devops'
alias docker-ecs='code && cd docker-ecs'
alias ecs='code && cd docker-ecs/cluster-management' 
alias ecs-old='code && cd exp-devops/chef-repo/aws/bin/ecs'
alias lappy='code && cd provisioning-local'
alias packer='cd /Volumes/Data/Code/ewe-packer'
alias comics='cd /Volumes/Data/Comics'
alias ecstests='ecs && cd tests/acceptance'

# SSH aliases
alias volumio='ssh volumio'
alias readynas='ssh readynas'

# General useful commands

alias wgetter='wget --content-disposition -c --progress=dot:giga -i'
alias lines='pbpaste | wc -l'

alias rsyncer='rsync -rv --size-only'

# SSH without asking pesky signature questions
alias sshc='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'

# Homebrew casks location
export HOMEBREW_CASK_OPTS=""

source /Volumes/Data/Code/docker-ecs/ecs_functions.sh

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

ssh-make-rsakey() {
  ssh-keygen -t rsa -b 4096 -o -a 100 -f ~/.ssh/$1 -N ""
}
alias runjack='jackd -d coreaudio'

ebook-cover() {
	convert $1 -resize 1400x2100^ -gravity center -extent 1400x2100 cover.jpg
	cp $1 cover.source.jpg
}

export PATH=$PATH:/Volumes/Data/Code/Binaries/aws_key_gen:/Volumes/Data/Code/Binaries/phantomjs-2.1.1-macosx/bin:~/bin

export PS1="\[\033[34m\]\u\[\033[36m\]@\h \[\033[1;30m\]\$(date +%H:%M:%S)\]  \n\[\033[0;32m\]\w\[\033[33m\] \$(parse_git_branch)\[\033[00m\] \n$ "
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

export PATH="/Users/aranganathan/.rvm/gems/ruby-1.9.3-p551/bin:$PATH"

# For Golang
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="/Volumes/Data/Code/golang"
export PATH="/Volumes/Data/Code/golang/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
