#!/bin/bash
set -x
set -e

export PATH=/yourpath/toolchain/Xuantie-900-gcc-linux-6.6.0-musl64-x86_64-V2.10.2-20240904/bin:$PATH

CC=riscv64-unknown-linux-musl-gcc
CXX=riscv64-unknown-linux-musl-g++
LD=riscv64-unknown-linux-musl-ld
STRIP=riscv64-unknown-linux-musl-strip

target=riscv64-unknown-linux-musl

export STAGING_DIR=$PWD/libgmp/usr
CONFIGURE_ARGS=\
"--without-expat \
 --without-lzma \
 --disable-unit-tests \
 --disable-ubsan \
 --disable-sim \
 --disable-werror \
 --disable-source-highlight \
 --without-mpc \
 --without-mpfr \
 --without-isl \
 --without-xxhash \
 --with-libgmp-prefix=$STAGING_DIR"

./configure --prefix=$PWD/out/ --host=$target CC=$CC CXX=$CXX LD=$LD  $CONFIGURE_ARGS 
make -j32
make install-strip
