name=wayland
deps="glibc libffi expat libxml2 default-cursors"
for d in $deps; do
    bash pkg-$d.sh
done
./createPackage.sh ${name} slix-ld ${deps}
