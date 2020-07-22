use Bench;

proc elegant(test: borrowed Bench) {
  var Dom = {1..order, 1..order},
      subDom = {1..subOrder, 1..subOrder};
  var Array: [Dom] real, subArray: [Dom] real = 2.0;
  Bench.timer.start()
  for 1..Bench.N {
    for (i, j) in Dom {
      for k in 1..subOrder do
        Array[i,j] += i*j*subArray[k, k];
    }
  }
  Bench.timer.stop();
  Bench.save(Bench.avg_Time());
}

proc performant(order, subOrder, test: borrowed Bench) {
  var Dom = {1..order, 1..order},
      subDom = {1..subOrder, 1..subOrder};
  var Array: [Dom] real, subArray: [Dom] real = 2.0;
  Bench.timer.start();
  var tmp: real = 0;
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

