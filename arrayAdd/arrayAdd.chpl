use Bench;

// these are some perfcompopts 
config const order: int = 10,
        suborder: int = 5,
        iterations: int = 5;

proc elegant(test: borrowed Bench) {

  var Dom = {1..order, 1..order},
      subDom = {1..subOrder, 1..subOrder};

  // arrays required for test initialised 
  var Array: [Dom] real, subArray: [Dom] real = 2.0;
  // start time in Bench class  
  Bench.Timer.start()
  /*
    Number of iterations : Bench.N
    We can use any other variable(iterations),
    declared either within the program or in TOML file
  */
  for 1..Bench.N {
    for (i, j) in Dom {
      for k in 1..subOrder do
        Array[i,j] += i*j*subArray[k, k];
    }
  }
  // stop time in Bench class
  Bench.timer.stop();
  // record metric to a var defined in Bench class, which is for avg_time
  Bench.save(Bench.avg_Time());
  // metric output done using `mason bench`
}

proc performant(test: borrowed Bench) {

  var Dom = {1..order, 1..order},
      subDom = {1..subOrder, 1..subOrder};

  var Array: [Dom] real, subArray: [Dom] real = 2.0;
  var tmp: real = 0;

  Bench.timer.start();
  for 1..Bench.N {
    for (i, j) in Dom {
      for  k in 1..subOrder do
        tmp += i*j*subArray[k, k];
      Array[i, j] += tmp;
    }
  }

  Bench.timer.stop();
  Bench.save(Bench.avg_Time());
}

