KERNEL_DIR=$PWD
REPACK_DIR=$KERNEL_DIR/zip
OUT=$KERNEL_DIR/output
ZIP_NAME="$VERSION"-"$DATE"
VERSION="UBTouch"
DATE=$(date +%Y%m%d-%H%M)

export ARCH=arm64
export SUBARCH=arm64
export LD_LIBRARY_PATH=~/toolchains/proton_clang/lib/
export USE_CCACHE=1
export CROSS_COMPILE="$HOME/toolchains/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-"

make clean && make mrproper
PATH="$HOME/toolchains/proton_clang/bin:$HOME/toolchains/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin${PATH}"
CROSS_COMPILE="$HOME/toolchains/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-" make O=output lineage-gtaxlwifi_defconfig
CROSS_COMPILE="$HOME/toolchains/gcc-linaro-7.4.1-2019.02-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-" make O=output -j$(nproc --all)
