//*************************************************************************
// File name: binToFloat.cc
//*************************************************************************

//*************************************************************************
// This program converts 16-bit little endian PCM samples to floating
// point text.
//
// To run this program type,
// 
//     ./binToFloat < inputFileName > outputFileName,
//
//*************************************************************************

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>

// Globals.
int16_t inputBuffer[32768];

//*************************************************************************
// Mainline code.
//*************************************************************************
int main(int argc,char **argv)
{
  int i;
  int count;
  bool done;

  // Set up for loop entry.
  done = false;

  while (!done)
  {
    // Read a block of PCM samples.
    count = fread(inputBuffer,sizeof(int16_t),1024,stdin);

    if (count == 0)
    {
      // We're done.
      done = true;
    } // if
    else
    {
      for (i = 0; i < count; i++)
      {
        printf("% -5.0f\n",(float)inputBuffer[i]);
      } // for

    } // else

  } // while

  return (0);

} // main
