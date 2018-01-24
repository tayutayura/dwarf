#!/bin/bash

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

sudo ln -s /usr/bin/sha1sum /usr/bin/shasum

# Imports Node.js release team's OpenPGP keys to the keyring
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

asdf install nodejs 9.4.0
asdf global nodejs 9.4.0
