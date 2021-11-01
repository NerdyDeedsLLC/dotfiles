#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
# brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2


# Install other useful binaries.
brew install ack
brew install csvkit
brew install fzf
brew install git
brew install gh
brew install imagemagick --with-webp
brew install libsass
brew install netcat
brew install netdata
brew install node
brew install pstree
brew install px
brew install python@3.9
brew install rename
brew install rlwrap
brew install so
brew install ssh-copy-id
brew install svgo
brew install tree
brew install vbindiff
brew install whois
brew install yarn
brew install yarn-completion
brew install zopfli

# Install applications from cask (where applicable)
brew install --cask charles
brew install --cask firefox
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask lulu
brew install --cask onyx
brew install --cask rectangle
brew install --cask sketch
brew install --cask sketchup
brew install --cask slack
brew install --cask snappy
brew install --cask suspicious-package
brew install --cask typeface
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask zoho-mail
brew install --cask zoom

# Remove outdated versions from the cellar.
brew cleanup
