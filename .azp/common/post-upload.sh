#!/bin/bash -ex

# Copy documentation
cp LICENSE "$REV_NAME"
cp README.md "$REV_NAME"

if [ ! -z "$USE_ZIP" ]; then
  7z a -tzip "$ARCHIVE_NAME" "$REV_NAME"
else
  tar $COMPRESSION_FLAGS "$ARCHIVE_NAME" "$REV_NAME"
fi

# move the compiled archive into the artifacts directory to be uploaded by azure pipelines
# BUILD_ARTIFACTSTAGINGDIRECTORY is defined by az-pipeline agent
mv "$ARCHIVE_NAME" "${BUILD_ARTIFACTSTAGINGDIRECTORY}/artifacts/"
