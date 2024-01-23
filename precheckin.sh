#!/bin/sh
for x in glibc glibc-devel glibc-headers kernel-headers libxcrypt libxcrypt-devel; do
	sed "s/ExclusiveArch: none//g" cross-template-inject.spec > cross-$x-inject.spec
	sed -i "s/@PACKAGENAME@/$x/g" cross-$x-inject.spec
	if [ "$x" = "kernel-headers" ]; then
		sed -i "s/@REALPACKAGENAME@/linux-glibc-devel/g" cross-$x-inject.spec
	else
		sed -i "s/@REALPACKAGENAME@/$x/g" cross-$x-inject.spec
	fi
done
