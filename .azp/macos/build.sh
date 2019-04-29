#!/bin/bash
set -o pipefail

export MACOSX_DEPLOYMENT_TARGET=10.13
export Qt5_DIR=$(brew --prefix)/opt/qt5

mkdir build && cd build
cmake .. -DCMAKE_OSX_ARCHITECTURES="x86_64;x86_64h" -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl@1.1/ -DOPENSSL_LIBRARIES=/usr/local/opt/openssl@1.1/lib
make -j4
