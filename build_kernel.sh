#!/bin/bash
make clean
make mrproper
clear

export ARCH=arm64
export BUILD_CROSS_COMPILE=/home/vigus/gcc4.9arm64/bin/aarch64-linux-android-
export REAL_CC=$(BUILD_CROSS_COMPILE)gcc
export ANDROID_MAJOR_VERSION=p
export PLATFORM_VERSION=9.0.0

mkdir out 
chmod -R 777 out

make -C $(pwd) O=$(pwd)/out -j$(nproc) ARCH=$ARCH CROSS_COMPILE=$BUILD_CROSS_COMPILE KCFLAGS=-mno-android  greatqlte_slm_defconfig
make -s -C $(pwd) O=$(pwd)/out -j$(nproc) ARCH=$ARCH CROSS_COMPILE=$BUILD_CROSS_COMPILE KCFLAGS=" -mno-android -w"
