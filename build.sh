#!/bin/bash

set -e

# Initialize repo with specified manifest
repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs --depth=1

# Run inside foss.crave.io devspace, in the project folder
# Remove existing local_manifests
crave run --no-patch -- "rm -rf .repo/local_manifests .repo/manifest* && \
# Initialize repo with specified manifest
repo init -u https://github.com/alphadroid-project/manifest -b alpha-14-wip --git-lfs --depth=1 ;\

# Clone local_manifests repository
git clone https://github.com/tactus1/local_manifest --depth 1 -b alphadroid-14-raphael .repo/local_manifests ;\

# Removals
rm -rf device/xiaomi/tissot vendor/lineage && \
rm -rf packages/apps/Trebuchet && \

# Sync the repositories
/opt/crave/resync.sh && \


# Set up build environment
. build/envsetup.sh && \

# Lunch configuration
lunch lineage_raphael-ap1a-userdebug ;\

croot ;\
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
