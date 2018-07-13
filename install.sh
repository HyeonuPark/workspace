# Workspace install script
# https://github.com/HyeonuPark/workspace

## Configuration

export WORKSPACE_GIT_REPO='https://github.com/HyeonuPark/workspace.git'
export WORKSPACE_DIR='~/.workspace'

export GIT_USER_NAME='Hyeonu Park'
export GIT_USER_EMAIL='nemo1275@gmail.com'

git clone "$WORKSPACE_GIT_REPO" "$WORKSPACE_DIR" &&
sudo bash "$WORKSPACE_DIR/init.bash"
