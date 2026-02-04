#!/bin/bash

set -e

echo "Installing JBang bootstrapper"
curl -fsSL https://sh.jbang.dev | JBANG_DEFAULT_JAVA_VERSION=21 bash -s - app setup --quiet
export PATH="$HOME/.jbang/bin:$PATH"

echo "Installing Brokk CLI"
jbang trust add https://github.com/BrokkAi/brokk-releases
jbang app install brokk@brokkai/brokk-releases

brokk login $userkey
brokk install

echo "Brokk is installed and on your PATH but you will need to open a new shell for it to take effect."
