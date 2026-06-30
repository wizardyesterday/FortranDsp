#!/bin/sh
f77 -O0 -o unitSampleDemo MAIN.F SRINIT.F SRCONV.F
f77 -O0 -o AudioDemo/pcmDemo MAIN_PCM.F SRINIT.F SRCONV.F

