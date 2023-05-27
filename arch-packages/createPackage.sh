#!/usr/bin/env bash


pkg=${1}
target=${1}
root=${target}/rootfs
mkdir -p ${root}


pacman -Ql ${pkg} | awk '{ print $2; }' | (
    while IFS='$\n' read -r line; do
        if [ -d $line ] && [ ! -h $line ]; then
            mkdir ${root}/${line}
        elif [ -e $line ]; then
            cp -a ${line} ${root}/${line}
        fi
    done
)
version=$(pacman -Qi ${pkg} \
    | grep -P "^Version" \
    | tr '\n' ' ' \
    | awk '{print $3}')

pacman -Qi ${pkg} \
    | grep "Depends On" \
    | cut -d ':' -f 2 \
    | tr ' ' '\n' \
    | grep -v None \
    | grep . \
    | sort -u \
    | xargs -n 1 ./translateName.sh \
    | sort -u \
    > ${target}/dependencies.txt
../archive ${target}
hash=$(sha256sum ${target}.gar | awk '{print $1}')
mv ${target}.gar ${target}@${version}-$hash.gar
echo "dependencies:"
cat ${target}/dependencies.txt
rm -rf ${target}
