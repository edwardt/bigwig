#!/bin/bash

make_cowboy(){
	echo "Compiling cowboy"
	local CWD=`pwd`
	local COWBOYDEPS=${CWD}/deps/cowboy
	cd ${COWBOYDEPS}
	make
	cp ${CWD}
	rm -rf deps/ranch
	mv -f ${COWBOYDEPS}/ranch deps
}



