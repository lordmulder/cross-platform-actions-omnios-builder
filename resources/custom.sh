#!/bin/sh

set -exu

export RUSTUP_HOME=/opt/rust/rustup
export CARGO_HOME=/opt/rust/cargo

# Add your additional provisioning here for custom VM images.
pkg refresh
pkg install build-essential git

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.93.1

tee /opt/rust/cargo/env <<'EOF'
#!/bin/sh
export PATH="/opt/rust/cargo/bin:$PATH"
export RUSTUP_HOME=/opt/rust/rustup
EOF

chmod 555 /opt/rust/cargo/env
