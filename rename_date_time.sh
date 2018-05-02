#!/bin/bash
for i in *.ext; do
	export FILENAME=${i%%.*}
        export CREATEDATE=`stat -c %y $i | sed 's/-//g' | sed 's/://g' | awk '{print $1}'`
	export CREATETIME=`stat -c %y $i | sed 's/-//g' | sed 's/://g' | awk '{print $2}' | awk -F. '{print $1}'`
	NEWNAME+=$FILENAME
	NEWNAME+="_"
	NEWNAME+=$CREATEDATE
	NEWNAME+="_"
	NEWNAME+=$CREATETIME
	#echo "i is $i and FILENAME is $FILENAME and CREATEDATE is $CREATEDATE and CREATETIME is $CREATETIME"
	mv "$i" $NEWNAME.ext
	NEWNAME=""
done
