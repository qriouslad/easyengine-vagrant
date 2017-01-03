#!/bin/bash

function printSpacer()
{
    echo =========================================================
}

# Set git username/e-mail used in EE
sudo echo -e "[user]\n\tname = $1\n\temail = $2" > ~/.gitconfig

printSpacer

echo "Installing EasyEngine"

if [ ! -f /usr/local/bin/ee ]; then
  wget -qO ee rt.cx/ee && sudo bash ee  || exit 1
  echo "Installing ee completion"
  sudo -H . /etc/bash_completion.d/ee_auto.rc #source X TODO: This is not working atm for the root user.
  printSpacer
  echo "Installing stack"
  ee stack install || exit 1
  printSpacer
  echo "All done! Take not of your credentials above, you can use these credentials to reach phpMyAdmin and similar tools at http://box.ee:22222";
else
    echo "EasyEngine is already installed, skipping. If you want to reinstall EasyEngine, please run \"vagrant destroy && vagrant up\""
fi

printSpacer