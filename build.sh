#!/bin/bash

set -e

# Initialize repo with specified manifest
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs --depth=1

# Run inside foss.crave.io devspace, in the project folder
# Remove existing local_manifests
crave run --clean --no-patch -- "rm -rf .repo/local_manifests && \
# Initialize repo with specified manifest
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 ;\

# Clone local_manifests repository
git clone https://github.com/tactus1/local_manifest --depth 1 -b lineage-21-raphael .repo/local_manifests ;\

# Removals
rm -rf prebuilts/rust && \

# Sync the repositories
/opt/crave/resync.sh && \  


# Set up build environment
. build/envsetup.sh && \

croot ;\

# Lunch configuration
brunch raphael ;\

make bacon ; \
# echo "Date and time:" ; \

# Print out/build_date.txt
# cat out/build_date.txt; \

# Print SHA256
# sha256sum out/target/product/*/*.zip"

# Clean up
# rm -rf tissot/*



# Pull generated zip files
# crave pull out/target/product/*/*.zip

# Pull generated img files
# crave pull out/target/product/*/*.img

# Upload zips to Telegram
# telegram-upload --to sdreleases tissot/*.zip

#Upload to Github Releases
#curl -sf https://raw.githubusercontent.com/Meghthedev/Releases/main/headless.sh | sh
