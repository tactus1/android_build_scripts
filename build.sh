#!/bin/bash

set -e

# Initialize repo with specified manifest
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs --depth=1

# Run inside foss.crave.io devspace, in the project folder
# Remove existing local_manifests
crave run --clean --no-patch -- "rm -rf .repo/local_manifests && \
# Initialize repo with specified manifest
repo init -u https://github.com/ProjectMatrixx/android.git -b 14.0 ;\

# Clone local_manifests repository
git clone https://github.com/SOVIET-ANDROID/local_manifests.git .repo/local_manifests ;\

# Sync the repositories
/opt/crave/resync.sh && \  

# Set up build environment
. build/envsetup.sh && \

croot ;\

# Lunch configuration
brunch raphael ;\
