# Setup ZSH


# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cp ./Brewfile ~/Brewfile

brew bundle ~/Brewfile

# Install RVM
gpg --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable

# Create required rubies
rvm install 2.4.2
rvm use 2.4.2
rvm gemset create looper
rvm gemset create gauge
rvm gemset create awsutils

# More stuff here
