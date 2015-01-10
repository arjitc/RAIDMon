#!/bin/bash


## RAID rebuild %
hpacucli ctrl all show config | grep Recovering | awk {'print $8'}
