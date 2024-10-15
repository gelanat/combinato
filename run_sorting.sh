#!/bin/bash

files=`ls ./*.hdf5`
for eachfile in $files
do
    css-extract --files $eachfile --h5
done
   
css-mask-artifacts
ls */*.h5 > do_sort.txt

css-prepare-sorting --jobs do_sort.txt
cp do_sort.txt do_sort_pos.txt
css-cluster --jobs sort_pos_tos.txt --single
css-combine --jobs sort_pos_tos.txt --single

css-prepare-sorting --neg --jobs do_sort.txt
cp do_sort.txt do_sort_neg.txt
css-cluster --jobs sort_neg_tos.txt --single
css-combine --jobs sort_neg_tos.txt --single
