# Set permissions
#sudo chown -R $USER:$(id -gn $USER) $HOME/.config

### Install node via nvm to keep it sane###
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install --lts=Dubnium
nvm use default

# Install commonly used clis
npm i -g fkill-cli
npm i -g http-server
npm i -g np
npm i -g npm-check
npm i -g standard
npm i -g svgo
npm i -g trash-cli
