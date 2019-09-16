#!/bin/bash
cd data
number=$(ls *.crs | wc -l)

echo Total course records: $number

