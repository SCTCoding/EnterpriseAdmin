#! /bin/bash

function parseCompoundInput {
	fieldSeperator="$2"
	selectedParameter="$3"
	echo "$1" | cut -d "$fieldSeperator" -f "$selectedParameter"
}


var1=$(echo "var1: $(parseCompoundInput "ducks-cats-rats-dogs" "-" 1)")
var4=$(echo "var4: $(parseCompoundInput "ducks-cats-rats-dogs" "-" 4)")

echo $var1
echo $var4