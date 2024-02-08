#!/bin/bash

set -e

# Initialize repo with specified manifest
 repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs

# Run inside foss.crave.io devspace, in the project folder
# Remove existing local_manifests
crave run --no-patch -- "rm -rf .repo/local_manifests && \
# Initialize repo with specified manifest
repo init -u https://github.com/Evolution-X/manifest -b udc ;\

# Clone local_manifests repository
git clone https://github.com/Lafactorial/local_manifest --depth 1 -b Evo-14 .repo/local_manifests ;\

# Removals
rm -rf device/xiaomi/msm8953-common && \

# Sync the repositories
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags && \ 

# Set up build environment
source build/envsetup.sh && \

# Lunch configuration
lunch evolution_tissot-userdebug ;\

croot ;\
mka evolution ; \
