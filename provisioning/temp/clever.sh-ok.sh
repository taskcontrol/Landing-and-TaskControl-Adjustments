#!/bin/bash

declare -a A
nof= 0 ## number of directories with cold backups...

## load the array with directories
directories=`ls -ls | awk -F '{print $10}'`

while [$directories=`ls -ls | awk -F '{print $10}'`]
do
##A[$(nof++))]=$line
echo $directories
done 

## remove the Cold backup directories keeping just the last 4 weeks

while (#A[@] >= 5) 
do
      ## rm -rf ${A[@]:0:0}
       ls -ls ${A[@]:0:0} 

end
