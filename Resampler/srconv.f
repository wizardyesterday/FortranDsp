c----------------------------------------------------------------------
c subroutin srconv
c converts the sampling rate of a signal  by the ratio l/m.
c srinit must be called prior to calling this routine.
c----------------------------------------------------------------------
c
      subroutine srconv(bufm, bufl, nd, qbuf, cofs, ictr)
      common /srcom/ iq, jq, il
      dimension bufm(1),bufl(1), qbuf(1), cofs(1), ictr(1)
c
      mb = 1
      lb = 1
      l = il
      do 50 i=1,nd
c
c mb = index on bufm
c compute l output samples
c
        k = 1
        do 40 j=1,l
          jd = ictr(k)
          ic = ictr(k+1)
          k = k + 2
c
c update qbuf
c
10        if (jd.eq.0) go to 20
          qbuf(jq) = bufm(mb)
          jq1 = jq + iq
          qbuf(jq1) = bufm(mb)
          mb = mb + 1
          jq = jq - 1
          if (jq.eq.0) jq = iq
          jd = jd - 1
          go to 10
c
c compute 1 sample of output data and store in bufl
c
20        sum = 0
          do 30 kq=1,iq
            icof = kq + ic
            iqb = kq + jq
            sum = sum + qbuf(iqb)*cofs(icof)
30        continue
          bufl(lb) = sum
          lb = lb + 1
40      continue
50    continue
      return
      end

