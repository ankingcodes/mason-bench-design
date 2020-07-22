use Time;

// execopts
config const n = 1000000;
config const numIters = 1000;
// compopts
config param printArrays = false;
config param printTiming = true;

var A: [1..n] real;
var B: [1..n] int;

forall i in 1..Bench.N do B[i] = i;

// start the timer
Bench.Timer.start();

// run iterations
for i in 1..Bench.N do A[B] += 1;

// stop timer
Bench.Timer.stop();
// save elapsed time
Bench.save(Bench.time_elapsed());
// save average time 
Bench.save(Bench.avg_time());
// metrics displayed using mason bench
