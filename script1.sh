#!/bin/bash


FILE="helloworld.sh"
echo "setting basic permissions"
chmod 600 $FILE


if [[ -e $FILE ]]; then
    echo "The Hello World file exists"
    ./$FILE
else
    echo "The Hello World file does not exist"
fi


if [[ -e $FILE && -x $FILE ]]; then
    echo "The Hello World file exists and is executable"
    ./$FILE
else
    echo "The Hello World file may not exist or have the right permissions"
fi

if [[ -x $FILE  ]]; then
    echo "Permissions are fine"
else
    chmod +x $FILE
    ls -la $FILE | awk '{print $1, $NF}'
    echo "updated and $FILE is now executable"
fi


####### neater version #######

FILE="helloworld.sh"
echo "resetting"
chmod 600 $FILE

if [[ -e $FILE ]]; then
    echo "The Hello World file exists"

    if [[ -x $FILE ]]; then
        echo "The file is executable"
        ./$FILE
    
    else
        echo "The file exists but is not executable. Updating permissions..."
        chmod +x $FILE
        ls -la $FILE | awk '{print "permissions:", $1 "\nfile-name:", $NF}'
        echo "$FILE now has the right permissions set"
    fi

    ./$FILE
else
    echo "$FILE does not exist in this directory"
fi

