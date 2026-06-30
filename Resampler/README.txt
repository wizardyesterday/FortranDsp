This directory contains the original code as published in a paper entitled
"A General Program to Perform Sampling Rate Conversion of Data by
Rational Ratios" by R. E. Crochiere.
The orignal program was contained in a single file. I broke it up into
three separate files: MAIN.F, SRINIT.F and SRCONV.F. This program performs
a ample rate change by a factor of 8/5.
Any other program or shell script was written by me.

To build the original test application, and my application, type:
sh buildResamplers.sh.

To build the support applications, change to the Resampler/AudioDemo
directory and type: sh buildFilters.sh

To run the original application:, change to the Resampler directory and type:
./unitSampleDemo < coefficients.txt.

You'll see a display of the center tap plus upper half of the prototype
filter coefficients ans a display of the unit sample response of the
polyphase resampler.

To run my PCM demo, change to thr Resampler/AudioDemo directory and type:
sh runDemo.sh. This will automalically run my program that resamples a
200Hz cosine signal, sampled at 16000S/s, to a sample rate of 40000S/s, by
resampling the original signal by a factor of 5/2.

The result will be a file called output.raw. This represents a 200Hz cosine
wave, sampled at 40000S/s. You can listen to this file by typing:
aplay -f S16_LE -r 40000 output.raw.

