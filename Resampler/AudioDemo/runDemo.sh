#!/bin/sh

# Convert PCM file to floatpoint point text records.
./bin2float < cos_input_16000.raw > cos_input_16000.txt

#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
# Concatenate the coefficient file and the PCM text file.
# The resampler program, pcmDemo, expects the textual input file as folloes:
# filter coefficients | PCM samples. Each line has a single entry, rather
# than a contiguous blob of data.
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
cat interpolateBy5Coefficients.txt cos_input_16000.txt > input.txt

# Perform the 5/2 interpolation of the PCM samples.
./pcmDemo < input.txt | ./float2bin > output.raw

exit 0

