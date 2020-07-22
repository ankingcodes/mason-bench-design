use LinearAlgebra;
use BLAS;
use Time;

// execopts
config const m=1000,
             iters=10,
             reference=false,
             correctness=false;

config type eltType = real;

const nBytes = numBytes(eltType);

/* BLAS Transpose */
proc blasTranspose(A: [?Dom] ?eltType) {
  var B: [Dom] eltType = eye(Dom, eltType=eltType);
  var C: [transpose(Dom)] eltType;
  gemm(A, B, C, 1:eltType, 0:eltType, opA=Op.T);
  return C;
}

// performance test
proc transposePerf(test: borrowed Bench) {
  var D = {0..#m, 0..#m*2};
  var A = Matrix(D, eltType=eltType);

  [(i, j) in D] A[i, j] = i - j;
  
  // run iterations and record elapsed time
  for 1..Bench.N {
    Bench.Timer.start();
    transpose(A);
    Bench.Timer.stop();
    Bench.save(Bench.time_elapsed());
  }
  
  // run iterations and record elapsed time
  if reference {
    for 1..Bench.N {
      Bench.Timer.start();
      blasTranspose(A);
      Bench.Timer.stop();
      Bench.save(Bench.time_elapsed());
    }
  }
  // output displayed by mason bench
}
