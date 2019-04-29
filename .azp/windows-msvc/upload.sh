#!/bin/bash -ex

source .azp/common/pre-upload.sh

REV_NAME="trojan-qt-windows-msvc-${GITDATE}-${GITREV}"
ARCHIVE_NAME="${REV_NAME}.zip"
USE_ZIP='1'

mkdir "$REV_NAME"
cp -rv build/src/Release/* "$REV_NAME"

source .azp/common/post-upload.sh
