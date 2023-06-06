#!/usr/bin/env bash


./build.sh
mkdir -p slix-ld-package/rootfs/usr/bin
cp build/bin/slix-ld slix-ld-package/rootfs/usr/bin
./build/bin/archive slix-ld-package

hash=$(sha256sum -b slix-ld-package.gar | awk '{print $1}')
mv slix-ld-package.gar arch-packages/slix-ld@1.0.0-${hash}.gar