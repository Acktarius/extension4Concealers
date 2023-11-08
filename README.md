# extension4Concealers
Top bar extensions useful to monitor node and miner activity + gpu pulse, dedicated for CCX-BOX users 

## Acknoledgment
Huge thanks to [Bitbar](https://github.com/matryer/bitbar) and [@p-e-w](https://github.com/p-e-w/argos) for creating the argos repositories

## For who ?
Ubuntu users, running a [Conceal](https://conceal.network) node service and a miner service on the same computer, and in particular [CCX-BOX](https://nodesandbits.com) user.

## Prerequisite
node service to be named : *ccx-guardian.service*  
mining service to be named : *ccx-mining.service*

# Install option 1 "manually"

## Dependencies and application requirements
need to be able to toggle the argos extention :  
`sudo apt-get -y install gnome-shell-extension-prefs`

### Argos extension :
from [@p-e-w](https://github.com/p-e-w/argos) repository  
copy the argos folder in your extensions folder  
`cp argos@pew-worldwidemann.com ~/.local/share/gnome-shell/extensions/`  
  
logout , log back in, open Extension and toggle Argos  

## Download the 2 scripts *.sh and copy in the .config/argos folder
first create the folder  
`cd ~/.config`  
`mkdir argos`  
then copy the scripts:  
`cp gpu.2r.5m+.sh ~/.config/argos/gpu.2r.5m+.sh`  
`cp assistant.1r.1m+.sh ~/.config/argos/assistant.1r.1m+.sh`  
make sure the scripts are executable  
`chmod 755 gpu.2r.5m+.sh`  
`chmod 755 assistant.1r.1m+.sh`  

# Install option 2 "automatically"
download the deb file and its signature file,  
you are encouraged to verify signature :  
`gpg --keyserver hkp://keyserver.ubuntu.com --search-key acktarius@protonmail.com`  
and within the folder where the 2 files are located :  
`gpg --verify extension4Concealers_v0.0.1.deb.sig`  

- :warning: in terminal :
`sudo apt-get -y install gnome-tweaks`  
`sudo apt-get -y install gnome-shell-extension-prefs`  
and then  
- right click on the deb file select
"Open with other Application"
select "Software Installer"  
or within the terminal:  
`sudo dpkg -i extension4Concealers_v0.0.1.deb`  
 you 'll still have to toggle the Argos switch in Extensions 9after loggin out and log back in):
 ![Screenshot from 2023-10-21 11-50-29](https://github.com/Acktarius/extension4Concealers/assets/94026250/eec18719-9dc6-4804-a056-ba4430ede89f)

# License
Copyright © 2023 Acktarius
Released under the terms of the BDS-3-clause
