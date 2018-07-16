# Workspace install script
# https://github.com/HyeonuPark/workspace
#
# You can configure workspace by modify exported variables below

export WORKSPACE_GIT_REPO='https://github.com/HyeonuPark/workspace.git'
export WORKSPACE_DIR='~/.workspace'

export GIT_USER_NAME='Hyeonu Park'
export GIT_USER_EMAIL='nemo1275@gmail.com'

git clone "$WORKSPACE_GIT_REPO" "$WORKSPACE_DIR" &&
bash "$WORKSPACE_DIR/init.bash"

echo "Installation finished. Please type $ . ~/.bashrc"
