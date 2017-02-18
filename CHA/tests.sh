#!/usr/bin/env bash

# Komplexnejsie testy CHA

TASK=cha
 INTERPRETER="php -d open_basedir=\"\""
 EXTENSION=php
#INTERPRETER="python3"
#EXTENSION=py

# test01: Test parametru --help (nekontroluje sa vystup na stdout)
$INTERPRETER $TASK.$EXTENSION --help > ./Results/test01.out 2> ./Results/test01.err
echo -n $? > ./Results/test01.!!!

# test02: Test parametru --help s inym parametrom
$INTERPRETER $TASK.$EXTENSION --help --output=Tests/nonexistent/file > ./Results/test02.out 2> ./Results/test02.err
echo -n $? > ./Results/test02.!!!

# test03: Test parametru --help s inym parametrom
$INTERPRETER $TASK.$EXTENSION --pretty-xml --help > ./Results/test03.out 2> ./Results/test03.err
echo -n $? > ./Results/test03.!!!

# test04: Test parametru --help (kontroluje sa vypis na stdout)
$INTERPRETER $TASK.$EXTENSION --help > ./Results/test04.out 2> ./Results/test04.err
echo -n $? > ./Results/test04.!!!

# test05: Test na empty file
$INTERPRETER $TASK.$EXTENSION --input=./Tests/empty.h > ./Results/test05.out 2> ./Results/test05.err
echo -n $? > ./Results/test05.!!!

# test06: Missing output parameter (output goes to stdout)
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/subsubdir/trivial.h > ./Results/test06.out 2> ./Results/test06.err
echo -n $? > ./Results/test06.!!!

# test07: Trivial file with a single function and nothing else
$INTERPRETER $TASK.$EXTENSION --input=./Tests/single.h > ./Results/test07.out 2> ./Results/test07.err
echo -n $? > ./Results/test07.!!!

# test08: File with comments containing diacritic
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/subsubdir/trivial.h > ./Results/test08.out 2> ./Results/test08.err
echo -n $? > ./Results/test08.!!!

# test09: Function name contains underscores
$INTERPRETER $TASK.$EXTENSION --input=./Tests/underscore.h > ./Results/test09.out 2> ./Results/test09.err
echo -n $? > ./Results/test09.!!!

# test10: Input is a directory
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/subsubdir > ./Results/test10.out 2> ./Results/test10.err
echo -n $? > ./Results/test10.!!!

# test11: Output is a directory
$INTERPRETER $TASK.$EXTENSION --output=./Tests/subdir/subsubdir > ./Results/test11.out 2> ./Results/test11.err
echo -n $? > ./Results/test11.!!!

# test12: --pretty-xml without k
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/subsubdir/trivial.h --pretty-xml > ./Results/test12.out 2> ./Results/test12.err
echo -n $? > ./Results/test12.!!!

# test13: --pretty-xml=0
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/subsubdir/trivial.h --pretty-xml=0 > ./Results/test13.out 2> ./Results/test13.err
echo -n $? > ./Results/test13.!!!

# test14: --pretty-xml=10
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/subsubdir/trivial.h --pretty-xml=10 > ./Results/test14.out 2> ./Results/test14.err
echo -n $? > ./Results/test14.!!!

# test15: --no-inline
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/whitespace.h --no-inline > ./Results/test15.out 2> ./Results/test15.err
echo -n $? > ./Results/test15.!!!

# test16: --no-inline and --max-par=1
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/whitespace.h --no-inline --max-par=1 > ./Results/test16.out 2> ./Results/test16.err
echo -n $? > ./Results/test16.!!!

# test17: --max-par=0
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/subsubdir/trivial.h --max-par=0 > ./Results/test17.out 2> ./Results/test17.err
echo -n $? > ./Results/test17.!!!

# test18: --max-par=2
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/subsubdir/trivial.h --max-par=2 > ./Results/test18.out 2> ./Results/test18.err
echo -n $? > ./Results/test18.!!!

# test19: --no-duplicates
$INTERPRETER $TASK.$EXTENSION --input=./Tests/more.h --no-duplicates > ./Results/test19.out 2> ./Results/test19.err
echo -n $? > ./Results/test19.!!!

# test20: --no-duplicates and --max-par=1 and --no-inline
$INTERPRETER $TASK.$EXTENSION --input=./Tests/more.h --no-duplicates --max-par=1 --no-inline > ./Results/test20.out 2> ./Results/test20.err
echo -n $? > ./Results/test20.!!!

# test21: Preserve whitespace between types
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/whitespace.h > ./Results/test21.out 2> ./Results/test21.err
echo -n $? > ./Results/test21.!!!

# test22: --remove-whitespace
$INTERPRETER $TASK.$EXTENSION --input=./Tests/subdir/whitespace.h --remove-whitespace > ./Results/test22.out 2> ./Results/test22.err
echo -n $? > ./Results/test22.!!!

# test23: Ignore function declarations in comments
$INTERPRETER $TASK.$EXTENSION --input=./Tests/comments.h > ./Results/test23.out 2> ./Results/test23.err
echo -n $? > ./Results/test23.!!!

# test24: Comments in strings and strings in comments
$INTERPRETER $TASK.$EXTENSION --input=./Tests/str_comm.h > ./Results/test24.out 2> ./Results/test24.err
echo -n $? > ./Results/test24.!!!

# test25: Ignore function declarations in strings
$INTERPRETER $TASK.$EXTENSION --input=./Tests/strings.h.c > ./Results/test25.out 2> ./Results/test25.err
echo -n $? > ./Results/test25.!!!

# test26: Ignore function declarations in macros
$INTERPRETER $TASK.$EXTENSION --input=./Tests/macros.h > ./Results/test26.out 2> ./Results/test26.err
echo -n $? > ./Results/test26.!!!

# test27: Invalid parameter
$INTERPRETER $TASK.$EXTENSION --unknown-param > ./Results/test27.out 2> ./Results/test27.err
echo -n $? > ./Results/test27.!!!

# test28: Multiple occurrences of --input=
$INTERPRETER $TASK.$EXTENSION --input=./Tests/macros.h --input=./Tests/macros.h > ./Results/test28.out 2> ./Results/test28.err
echo -n $? > ./Results/test28.!!!

# test29: Multiple occurrences of --output=
$INTERPRETER $TASK.$EXTENSION --output=./Tests/out1 --output=./Tests/out2 > ./Results/test29.out 2> ./Results/test29.err
echo -n $? > ./Results/test29.!!!

# test30: Multiple occurrences of --pretty-xml=
$INTERPRETER $TASK.$EXTENSION --pretty-xml --pretty-xml=4 > ./Results/test30.out 2> ./Results/test30.err
echo -n $? > ./Results/test30.!!!

# test31: Multiple occurrences of --no-inline
$INTERPRETER $TASK.$EXTENSION --no-inline --no-inline > ./Results/test31.out 2> ./Results/test31.err
echo -n $? > ./Results/test31.!!!

# test32: Multiple occurrences of --max-par=
$INTERPRETER $TASK.$EXTENSION --max-par=5 --max-par=4 > ./Results/test32.out 2> ./Results/test32.err
echo -n $? > ./Results/test32.!!!

# test33: Multiple occurrences of --no-duplicates
$INTERPRETER $TASK.$EXTENSION --no-duplicates --no-duplicates > ./Results/test33.out 2> ./Results/test33.err
echo -n $? > ./Results/test33.!!!

# test34: Multiple occurrences of --remove-whitespace
$INTERPRETER $TASK.$EXTENSION --remove-whitespace --remove-whitespace > ./Results/test34.out 2> ./Results/test34.err
echo -n $? > ./Results/test34.!!!

# test35: Missing n after --max-par=
$INTERPRETER $TASK.$EXTENSION --max-par= > ./Results/test35.out 2> ./Results/test35.err
echo -n $? > ./Results/test35.!!!

# test36: Invalid n (NAN) after --max-par=
$INTERPRETER $TASK.$EXTENSION --max-par=4hh > ./Results/test36.out 2> ./Results/test36.err
echo -n $? > ./Results/test36.!!!

# test37: Invalid k (NAN) after --pretty-xml=
$INTERPRETER $TASK.$EXTENSION --pretty-xml=hh5 > ./Results/test37.out 2> ./Results/test37.err
echo -n $? > ./Results/test37.!!!

# test38: Non-existing input file
$INTERPRETER $TASK.$EXTENSION --input=/path/to/a/hopefully/nonexistent/file > ./Results/test38.out 2> ./Results/test38.err
echo -n $? > ./Results/test38.!!!

# test39: Unopenable input file
$INTERPRETER $TASK.$EXTENSION --input=/hopefully-no-write-permissions > ./Results/test39.out 2> ./Results/test39.err
echo -n $? > ./Results/test39.!!!

# test40: Unopenable output file
$INTERPRETER $TASK.$EXTENSION --output=/hopefully-no-write-permissions > ./Results/test40.out 2> ./Results/test40.err
echo -n $? > ./Results/test40.!!!

# test41: Input is a directory (whole dir) = STDIN
$INTERPRETER $TASK.$EXTENSION --pretty-xml > ./Results/test41.out 2> ./Results/test41.err
echo -n $? > ./Results/test41.!!!

# test42: Input is a directory (whole dir)
$INTERPRETER $TASK.$EXTENSION --input=./ --pretty-xml > ./Results/test42.out 2> ./Results/test42.err
echo -n $? > ./Results/test42.!!!

# test43: Output file
$INTERPRETER $TASK.$EXTENSION --output=Results/test43.out --pretty-xml 2> ./Results/test43.err
echo -n $? > ./Results/test43.!!!

# test44: Input is .c file
$INTERPRETER $TASK.$EXTENSION --input=Tests/nothing.c --pretty-xml > ./Results/test44.out 2> ./Results/test44.err
echo -n $? > ./Results/test44.!!!

################################################################################
# Dalsi testy
# test 45: comments inside macro
$INTERPRETER $TASK.$EXTENSION --input=Tests/macro_comm.c --pretty-xml=4 > ./Results/test45.out 2> ./Results/test45.err
echo -n $? > ./Results/test45.!!!

# test 46: more comments
$INTERPRETER $TASK.$EXTENSION --input=Tests/comments2.c --pretty-xml=4 > ./Results/test46.out 2> ./Results/test46.err
echo -n $? > ./Results/test46.!!!

# test47: Ignore function declarations in strings
$INTERPRETER $TASK.$EXTENSION --input=./Tests/strings2.h.c > ./Results/test47.out 2> ./Results/test47.err
echo -n $? > ./Results/test47.!!!

################################################################################


PASS="[ \033[0;32mPASS\033[0;0m ]"
FAIL="[ \033[0;31mFAIL\033[0;0m ]"

printf "File\t Output\t Return\n"

for i in 0{1..9} {10..47}
do
    printf "Test${i}\t"
    if [ $i == "01" ] || [ $i == "04" ];
        then
            diff "Results/test${i}.out" "Reff/test00.out" > /dev/null
            if [ $? == 0 ]; then printf "$FAIL"; else printf "$PASS"; fi;
        else
            diff "Reff/test00.!!!" "Reff/test${i}.!!!" > /dev/null
            if [ $? == 0 ];
                then
                    java -jar jexamxml/jexamxml.jar Results/test${i}.out Reff/test${i}.out delta.xml cha_options >/dev/null
                    if [ $? == 0 ]; then printf "$PASS"; else printf "$FAIL"; fi;
                else
                    diff "Results/test${i}.out" "Reff/test00.out"
                    if [ $? == 0 ]; then printf "$PASS"; else printf "$FAIL"; fi;
            fi;
    fi;
    diff "Results/test${i}.!!!" "Reff/test${i}.!!!" > /dev/null
    if [ $? == 0 ]; then printf "$PASS"; else printf "$FAIL"; fi
    printf "\n"
done
