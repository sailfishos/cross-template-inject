#!/bin/sh
for x in glibc glibc-devel glibc-headers kernel-headers libxcrypt libxcrypt-devel; do
	sed "s/ExclusiveArch: none//g" cross-template-inject.spec > cross-$x-inject.spec
	sed -i "s/@PACKAGENAME@/$x/g" cross-$x-inject.spec
done
