!/bin/bash

# Population 
for i in $(find . -name *.p1 );
	do cp $i $1;
	done

for i in $(find . -name *.p0 );
	do cp $i $1;
	done
