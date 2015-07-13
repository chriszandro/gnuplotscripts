#!/bin/bash

# Current
for i in $(find . -name *.cum );
	do cp $i $1;
	done

#Position	
for i in $(find . -name *.pom );
	do cp $i $1;
	done

#Energy
for i in $(find . -name *.enm );
	do cp $i $1;
	done
