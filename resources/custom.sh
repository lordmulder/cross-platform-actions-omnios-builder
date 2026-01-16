#!/bin/sh

set -exu

export RUSTUP_HOME=/opt/rust/rustup
export CARGO_HOME=/opt/rust/cargo

# Add your additional provisioning here for custom VM images.
pkg refresh
pkg update --no-be
pkg install build-essential git

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.92.0

echo '#!/bin/sh' > /opt/rust/cargo/env
echo 'export PATH="/opt/rust/cargo/bin:$PATH"' >> /opt/rust/cargo/env
echo 'export RUSTUP_HOME=/opt/rust/rustup' >> /opt/rust/cargo/env
