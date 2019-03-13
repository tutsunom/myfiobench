#!/bin/bash

sed -e 's/<FILENAME>/\/dev\/'$1'/g' \
-e 's/<IOSCHED>/'$2'/g' \
-e 's/<BLOCKSIZE>/'$3'/g' \
-e 's/<RAMPTIME>/10/g' -\
e 's/<RUNTIME>/60/g' \
config/sw.fio > config/temp.fio

for cnt in 1 2 3; do

for i in 1 2 4 8 16 32; do

if [ ! -e result/sw/sw_$1_$3_$2_${i}jobs_1depth_${cnt}.out ]; then

sed -e 's/<NUMJOBS>/'$i'/g' \
-e 's/<IODEPTH>/1/g' \
config/temp.fio > config/currjob.fio

sleep 10
fio config/currjob.fio --output=result/sw/sw_$1_$3_$2_${i}jobs_1depth_${cnt}.out --output-format=json+

fi

done

for j in 1 2 4 8 16 32; do

if [ ! -e result/sw/sw_$1_$3_$2_32jobs_${j}depth_${cnt}.out ]; then

sed -e 's/<NUMJOBS>/32/g' \
-e 's/<IODEPTH>/'$j'/g' \
config/temp.fio > config/currjob.fio

sleep 10
fio config/currjob.fio --output=result/sw/sw_$1_$3_$2_32jobs_${j}depth_${cnt}.out --output-format=json+

fi

done

done
