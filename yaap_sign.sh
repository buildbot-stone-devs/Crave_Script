#!/bin/bash

# Export
export BUILD_USERNAME=MayureshXKhnome
export BUILD_HOSTNAME=crave
export TZ="Europe/Vilnius"
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch yaap_stone-user
echo "============="

# Build rom
m yaap
