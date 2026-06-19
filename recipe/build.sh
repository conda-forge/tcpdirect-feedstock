#!/bin/bash

ln -sf $(which $CC) $BUILD_PREFIX/bin/gcc
export CFLAGS="$CFLAGS -Wno-error"

export ONLOAD_TREE=${SRC_DIR}/onload
cd tcpdirect

make -j${CPU_COUNT} NDEBUG=1 lib tools

mkdir -p $PWD/release
ln -sf $PWD/build/gnu_x86_64/bin $PWD/release/bin
ln -sf $PWD/build/gnu_x86_64/lib $PWD/release/lib
cp doc/LICENSE . 2>/dev/null || true

./scripts/zf_install --dest-dir $PREFIX
