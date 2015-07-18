#!/bin/bash

# Summaries 
for i in $(find . -name *.sum );
	do mv $i $1;
	done
# logs 
for i in $(find . -name *.log );
	do mv $i $1;
	done
