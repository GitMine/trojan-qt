#!/bin/sh -ex
# OpenSSL
export OSSL_VER="1_1_1b"
export OSSL_FILE="Win64OpenSSL-${OSSL_VER}.exe"
echo "Downloading OpenSSL..."
curl -o "${OSSL_FILE}" "https://slproweb.com/download/${OSSL_FILE}"
echo "Installing OpenSSL..."
powershell ".\\${OSSL_FILE} /silent /sp- /suppressmsgboxes /DIR='C:\Program Files\OpenSSL-Win64'"
echo 'Install 7-Zip...'
choco install -y 7zip
