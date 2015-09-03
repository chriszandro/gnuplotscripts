#!/bin/bash

# Current
for i in $(find . -name *.evo );
	do cp $i $1;
	done

for i in $(find . -name *.sum );
	do cp $i $1;
	done
