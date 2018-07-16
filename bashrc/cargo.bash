
alias c='cargo'

alias cb='cargo build'
alias cbb='cargo build --bin'
alias cr='cargo run'
alias crb='cargo run --bin'

alias ck='cargo check --tests'
alias cka='ck --all'
alias ckr='ck --release'
alias ckar='ck --all --release'

alias ct='RUST_BACKTRACE=1 cargo test'
alias cta='ct --all'
alias ctr='ct --release'
alias ctar='ct --all --release'

alias cexp='cargo +nightly rustc -- -Zunstable-options --pretty=expanded'

if is-init {
  export PATH="$PATH:$HOME/.cargo/bin"
}
