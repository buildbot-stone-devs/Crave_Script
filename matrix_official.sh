#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/ProjectMatrixx/android.git -b 15.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
#git clone -b matrix-a15-official https://github.com/Yaap-stone-devs/local_manifests.git .repo/local_manifests
#echo "============================"
#echo "Local manifest clone success"
#echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export BUILD_USERNAME=mayureshxKhnome
export BUILD_HOSTNAME=nobody
export TZ="Europe/Vilnius"
echo "======= Export Done ======"

# Sign
cd vendor/lineage-priv/keys
chmod +x ./syslink.sh
././syslink.sh
cd ../../..
echo "Signing success"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

brunch stone
