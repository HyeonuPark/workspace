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

echo "Install rustup"
curl https://sh.rustup.rs -sSf | sh

# run bashrc
source ~/.bashrc

echo "Configure rust devtools"
rustup toolchain install nightly
rustup component add --toolchain nightly rls-preview
cargo install exa ripgrep loc cargo-binutils cargo-fuzz
cargo +nightly install clippy
