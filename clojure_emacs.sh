#!/bin/bash

# Installs: emacs24, git, clojure, clojure-contrib

# Thanks to @bretthoerner for the ubuntu mirror of emacs 24
wget -q -O - http://emacs.naquadah.org/key.gpg | sudo apt-key add -
echo "deb http://emacs.naquadah.org/ natty/" >> /etc/apt/sources.list
echo "deb-src http://emacs.naquadah.org/ natty/" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y emacs-snapshot

# clojure install instructions from http://riddell.us/ClojureOnUbuntu.html
# Worth mentioning that this will need to be altered for post 1.2.x

sudo apt-get install -y git-core
sudo apt-get install -y ant maven2 
sudo apt-get install -y rlwrap

# Install clojure
mkdir ~/src
cd ~/src
git clone git://github.com/clojure/clojure.git
cd clojure
git checkout 1.2.x
ant
mkdir ~/.clojure
cp clojure.jar ~/.clojure

# Install clojure contrib
cd ~/src
git clone git://github.com/clojure/clojure-contrib.git
cd clojure-contrib
git checkout 1.2.x
mvn install
cp target/clojure-contrib*.jar ~/.clojure/clojure-contrib.jar

# bash startup script
echo "export CLOJURE_EXT=~/.clojure" >> ~/.bash_profile
echo "PATH=$PATH:~/src/clojure-contrib/launchers/bash:$HOME/bin/" >> ~/.bash_profile
echo "alias clj=clj-env-dir" >> ~/.bash_profile

# Install Leiningen
mkdir ~/bin/
wget https://github.com/technomancy/leiningen/raw/master/bin/lein
mv lein ~/bin/
chmod +x ~/bin/lein
~/bin/lein
