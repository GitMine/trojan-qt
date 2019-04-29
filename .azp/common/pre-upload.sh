#!/bin/bash -ex

export GITDATE="`git show -s --date=short --format='%ad' | sed 's/-//g'`"
export GITREV="`git show -s --format='%h'`"

mkdir -p "${BUILD_ARTIFACTSTAGINGDIRECTORY}/artifacts"
