
#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/yaap/manifest.git -b fifteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b yaap-a15-libperf https://github.com/Yaap-stone-devs/local_manifests.git .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"


# Export
export BUILD_USERNAME=KhnomexMayuresh
export BUILD_HOSTNAME=crave
# export BUILD_BROKEN_DISABLE_BAZEL_SANDBOXING=1
export TZ="Europe/Vilnius"
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch yaap_stone-ap4a-userdebug
echo "============="



# Build rom
m yaap
