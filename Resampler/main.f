c
c--------------------------------------------------------------------
c--------------------------------------------------------------------
c
      common /srcom/ iq, jq, il
      dimension coef(60), cofs(120),qbuf(10), ictr(16),bufl(24),
     *          bufm(15)
      iq = 0
      jq = 0
      il = 0
c
c this program converts the sampling rate of a signal by a ratio of l/m
c the program calls srinit to initialize and then calls srconv supplying
c input data through bufm and taking output data from bufl
c
c input: coefficients are read from the standard input unit (ind)
c
c output: all output is written on the standard output unit (lpt)
c
      ind = 5
      lpt = 6
      nn = 60
      read (ind,9999) (coef(k),k=1,nn)
      write (lpt,9998)
      write (lpt,9997) (coef(k),k=1,nn)
      write (lpt,9996)
c
c initialize conversion routine.
c
      n = 119
      nc = 120
      ni = 16
      l = 8
      m = 5
      nq = 30
      call srinit(m, l, qbuf, nq, coef, n, cofs, nc, ictr, ni, ierr)
      write (lpt,9995) ierr
      write (lpt,9996)
c
c generate unit sample
c
      do 10 i=1,15
        bufm(i) = 0.
10    continue
      bufm(1) = 1
c
c process data
c
      nd = 3
      call srconv(bufm, bufl, nd, qbuf, cofs, ictr)
      write (lpt,9994)
      nn = 24
      write (lpt,9997) (bufl(k),k=1,nn)
9999  format (7f11.0)
9998  format (13h coefficients)
9997  format (5f10.6)
9996  format (1h )
9995  format (6h ierr=, i3)
9994  format (21h unit sample response)
      stop
      end

