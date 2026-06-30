//*************************************************************************
// File name: lloat2bin.cc
//*************************************************************************

//*************************************************************************
// This program converts floating point text to  16-bit little endian PCM
// samples.
//
// To run this program type,
// 
//     ./Float2bin < inputFileName > outputFileName,
//
//*************************************************************************

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>

//*************************************************************************
// Mainline code.
//*************************************************************************
int main(int argc,char **argv)
{
  int i;
  int count;
  float inputValue;
  int16_t outputValue;
  bool done;

  // Set up for loop entry.
  done = false;

  while (!done)
  {
    // Read a single floating point sample.
    count = fscanf(stdin,"%f",&inputValue);

    if (count == EOF)
    {
      // We're done.
      done = true;
    } // if
    else
    {
      // Convert to the required PCM format.
      outputValue = (int16_t)inputValue;

      // Write another value to stdout.
      fwrite(&outputValue,sizeof(int16_t),1,stdout);
    } // else

  } // while

  return (0);

} // main
