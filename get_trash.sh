#!/bin/bash

# Current
for i in $(find . -name *.sum );
	do mv $i $1;
	done
