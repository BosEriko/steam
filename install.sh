#!/bin/bash

cd ~
home-manager switch
git init
git remote add origin https://github.com/BosEriko/steam.git
git fetch
git reset --hard origin/main
chsh -s $(which zsh)
