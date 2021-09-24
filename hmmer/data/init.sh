#!/usr/bin/env bash

N_SEQ=$1

for i in {1..500}
  do
    esl-shuffle -G -N $N_SEQ -L 200 > data_$i.fa
  done