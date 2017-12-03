#! /usr/bin/env bash

set -e

# spacemacs is special
echo "installing emacs for eventually installing spacemacs"
brew tap d12frosted/emacs-plus
echo "emacs tapped"
# "already installed" should not appear if emacs was not upgraded, so the
# check we have should be ok.
brew install emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon 2>&1 | grep "just not linked" || brew upgrade emacs-plus --with-cocoa --with-gnutls --with-librsvg --with-imagemagick --with-spacemacs-icon 2>&1 | grep "already installed"
echo "emacs-plus installed"
brew link --overwrite emacs-plus
echo "linked emacs-plus"

echo "installing spacemacs"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d || true

echo "linking elisp dir"
rm ~/.emacs.d/private/local/dotfiles || true
ln -s -n -f $PWD/lisp ~/.emacs.d/private/local/dotfiles
rm -rf ~/.emacs.d/private/snippets
ln -s -n -f $PWD/yasnippets ~/.emacs.d/private/snippets
ln -s -n -f $PWD/emacs-config.org ~/.emacs.d/emacs-config.org

echo "This directory managed by dotfiles" > ~/.emacs.d/private/local/dotfiles/README.org

# we can preload the packages with this:
# emacs --batch --load=~/.emacs.d/init.el
# OR:
emacs --batch --load=~/.spacemacs

echo "emacs installation complete!"
