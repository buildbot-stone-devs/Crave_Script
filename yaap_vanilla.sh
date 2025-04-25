#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b a15-libperf-vanilla https://github.com/Yaap-stone-devs/local_manifests.git .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

git clone https://github.com/buildbot-stone-devs/vendor_priv-keys_keys.git vendor/priv-keys/keys

# Export
export BUILD_USERNAME=MayureshXKhnome
export BUILD_HOSTNAME=crave
export TZ="Europe/Vilnius"
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch yaap_stone-eng
echo "============="

make clean

# Build rom
m yaap
