#!/bin/bash -ex

. .azp/common/pre-upload.sh

REV_NAME="trojan-qt-osx-${GITDATE}-${GITREV}"
ARCHIVE_NAME="${REV_NAME}.tar.gz"
COMPRESSION_FLAGS="-czvf"

mkdir "$REV_NAME"
cp -rv build/src/trojan-qt.app "$REV_NAME"
$(brew --prefix)/opt/qt5/bin/macdeployqt "$REV_NAME"/trojan-qt.app -executable="${REV_NAME}/trojan-qt.app/Contents/MacOS/trojan-qt"
macpack "${REV_NAME}/trojan-qt.app/Contents/MacOS/trojan-qt" -d "../Frameworks"

. .azp/common/post-upload.sh
