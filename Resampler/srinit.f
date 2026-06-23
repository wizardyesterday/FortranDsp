c-------------------------------------------------------------------------
c subroutine srinit
c initialization before srconv which converts the sampling rate
c of a signal by the ratio of l/m
c-------------------------------------------------------------------------
c
      subroutine srinit(m, l, qbuf, nq, coef, n, cofs, nc, ictr, ni,
     *                  ierr)
      common /srcom/ iq, jq, il
      dimension qbuf(1), coef(1), cofs(1), ictr(1)
c
      ierr = 0
      il = l
c
c compute iq
c
      iq = n/l
      if (n.ne.(iq*l)) iq = iq + 1
      np = iq*l
      if (nq.lt.(2*iq)) ierr = 1
      if (nc.lt.np) ierr = 2
      ncf = (n+1)/2
      fl = l
c
c zero out qbuf
c
      do 10 i=1,nq
        qbuf(i) = 0
10    continue
c
c scramble coefficients
c
      i = 1
      do 30 ml=1,l
        do 20 mq=1,iq
          mx = (ml-1) + (mq-1)*l
          if (mx.lt.ncf) mm = ncf - mx
          if (mx.ge.ncf) mm = mx - (n-ncf-1)
          if (mm.le.ncf) cofs(i) = coef(mm)*fl
          if (mm.gt.ncf) cofs(i) = 0
          i = i + 1
20      continue
30    continue
c
c setup of moving address pointer
c
      jq  = iq
c
c generate control array ictr
c
      lm = l*m
      if (ni.lt.(2*l)) ierr = 3
      lc = 0
      mc = 0
      incr = 0
      k = 1
      do 50 i=1,lm
        if (lc.eq.0) incr = incr + 1
        if (mc.lt.(m-1)) goto 40
c
c no of samples to update qbuf
c
        ictr(k) = incr
        incr = 0
        k = k + 1
c
c starting location of cofs vector
c
        ictr(k) = lc*iq
        incr = 0
        mc = -1
        k = k + 1
40      lc = lc + 1
        if (lc.ge.l) lc = 0
        mc = mc + 1
50    continue
      return
      end

