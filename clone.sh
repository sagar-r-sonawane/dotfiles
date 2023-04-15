# Clone reposities into the projects folder
function clone () {
	# CD to folder where git repos are kept
	# Change this value to your location
	cd $HOME/workspace

  # Products
  git clone git@gitlab.com:turtlemint/MintproV2
  git clone git@gitlab.com:turtlemint/agent-pro
  git clone git@gitlab.com:turtlemint/form-config
  git clone git@gitlab.com:turtlemint/integrations-framework
  git clone git@gitlab.com:turtlemint/lead-service
  git clone git@gitlab.com:turtlemint/life-service
  git clone git@gitlab.com:turtlemint/platform-service
  git clone git@gitlab.com:turtlemint/playapi
  git clone git@gitlab.com:turtlemint/pmp-motor
  git clone git@gitlab.com:turtlemint/turtlemint-admin 
}

clone
unset clone
