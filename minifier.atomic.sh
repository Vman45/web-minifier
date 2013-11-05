#!/bin/bash

YUI_DIR="./yuicompressor/"
CSS_DIR="./res/css"
JS_DIR="./res/js"
EXCLUDED_DIR="httperror"

if [ "$1" == "js" ]
then
	echo "Ignoring CSS";
else
## Process CSS
CUR_DIR=`pwd`
for d in `find $CSS_DIR -type d -mindepth 1 | grep -v $EXCLUDED_DIR | grep $2`;
do
	cd $CUR_DIR"/"$d;
	rm all.css
	for f in `ls | grep -v all.css | grep -v all.min.css`;
	do
		cat $f >> all.css;
		echo $'\n' >> all.css
	done;
done;
cd $CUR_DIR
	
for i in `ls $CSS_DIR/$2/all.css`; 
do 
	echo 'compressing '$i; 
	java -jar $YUI_DIR/yui*.jar --type css --charset utf-8 -o .css$:.min.css $i;
done;

fi


if [ "$1" == "css" ]
then
        echo "Ignoring JS";
else
## Process JS
CUR_DIR=`pwd`
for d in `find $JS_DIR -type d -mindepth 1 | grep -v $EXCLUDED_DIR | grep $2`;
do
        cd $CUR_DIR"/"$d;
	rm all.js
        for f in `ls *.js | grep -v all.js | grep -v all.min.js`;
        do
                cat $f >> all.js;
		echo $'\n' >> all.js
        done;
done;
cd $CUR_DIR

for i in `ls $JS_DIR/$2/all.js`;
do
        echo 'compressing '$i;
        java -jar $YUI_DIR/yui*.jar --type js --charset utf-8 -o .js$:.min.js $i;
done;

fi
