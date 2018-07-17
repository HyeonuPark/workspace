# System initialization script
# This script will be executed automatically by `install.sh`

# copy dotfiles to home dir
for dotfile in "$WORKSPACE_DIR/dotfiles/*"; do
  cat "$dotfile" |
  sed -e "s/VAR_WORKSPACE_DIR/$WORKSPACE_DIR/g" >
  "~/$(basename $dotfile)"
done

echo "Configure git setting as $GIT_USER_NAME - $GIT_USER_EMAIL"
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"

echo "===== SUDO REQUIRED ====="
echo "This section contains system level configuration/installation scripts"
echo ""

# deactivate annoying legacy X VirtualTerminal feature
echo $'Section "ServerFlags"\n\tOption "DontVTSwitch" "true"\nEndSection' |
  sudo tee -a /etc/X11/xorg.conf > /dev/null

# install apt packages
sudo apt-get install apt-transport-https

alias autocurl='curl -sfSL'

autocurl https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
autocurl https://packagecloud.io/AtomEditor/atom/gpgkey        | sudo apt-key add -
autocurl https://apt.llvm.org/llvm-snapshot.gpg.key            | sudo apt-key add -

# disable chrome install hook
sudo touch /etc/default/google-chrome

sudo cp - /etc/apt/sources.list.d/workspace.list <<EOF
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main
deb [arch=amd64] http://apt.llvm.org/bionic/ llvm-toolchain-bionic main
deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic main
EOF

sudo add-apt-repository ppa:linuxprising/java

sudo apt-get update
sudo apt-get install google-chrome-stable atom ccache cmake xdg-utils xdotool \
fonts-hack-ttf fonts-nanum-coding oracle-java10-installer \
clang-6.0 clang-tools-6.0 clang-6.0-doc libclang-common-6.0-dev libclang-6.0-dev libclang1-6.0 \
libllvm-6.0-ocaml-dev libllvm6.0 lldb-6.0 llvm-6.0 llvm-6.0-dev llvm-6.0-doc llvm-6.0-examples \
llvm-6.0-runtime clang-format-6.0 python-clang-6.0 lldb-6.0-dev lld-6.0 libfuzzer-6.0-dev

# drop sudo previlege
sudo -k
echo "sudo previlege dropped"

echo "Install rustup"
curl https://sh.rustup.rs -sSf | sh

# run bashrc
source ~/.bashrc

echo "Configure rust devtools"
rustup toolchain install nightly
rustup component add llvm-tools
rustup component add --toolchain nightly rls-preview clippy-preview
cargo install exa ripgrep loc cargo-binutils cargo-fuzz
