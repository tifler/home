#/bin/sh

PRJ=`grep -i "\<PROJECT\>" $1`
EXE=`grep -i "ADD_EXECUTABLE" $1`
LIB=`grep -i "ADD_LIBRARY" $1`

if [ ".$EXE.$LIB" == ".." ]; then
    exit 0
fi

echo -e "\e[0;92m[$1 Project $PRJ]\e[m"

if [ ".$EXE" != "." ]; then
    echo -e "\e[0;93m[Executable]\e[m"
    echo $EXE
    echo ""
fi

if [ ".$LIB" != "." ]; then
    echo -e "\e[0;94m[Library]\e[m"
    echo $LIB
    echo ""
fi
