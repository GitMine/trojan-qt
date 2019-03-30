#!/bin/bash -ex
function download_qt() {
  echo 'Downloading prebuilt Qt 5...'
  curl -L -o "qt-$1.7z" "https://github.com/citra-emu/ext-windows-bin/raw/master/qt/qt-$1.7z"
  echo 'Extracting prebuilt Qt 5...'
  7z x "qt-$1.7z"
}

mkdir build && cd build
export QT_VER="5.10.0-msvc2017_64"
download_qt "${QT_VER}"
export Qt5_DIR="$(readlink -f qt-${QT_VER}/)"

cmake .. -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR='C:/Program Files/OpenSSL-Win64' -DOPENSSL_USE_STATIC_LIBS=ON -DBoost_USE_STATIC_LIBS=ON -G "Visual Studio 15 2017 Win64"
cmake --build . --config Release -- -m
