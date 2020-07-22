# Chapel Benchmarking 
This repo contains example performance programs for design of `mason bench` & Chapel's benchmarking framework. 

In a recent WG call, it was decided that we could explore Go's style of benchmarking since it provides more flexibilty, and easy transition from `start_test --performance` for a Chapel developer.

### Contents 
- `arrayAdd/` : one of the simplest performance test. All performance metadata are included in a TOML file with the same name as that of test program. This TOML file depicts the first style of writing the metadata, i.e., using an array for certain options. eg: `execopts=[ ]`.
- `parOpEquals/`: a slightly complex performance test. Metadata consists of `compopts`, `execopts`, `good`, `perfcompopts` & `perfkeys`. The TOML file here also depicts the first style of writing the metadata.
- `transposePerf/`: here a second style of writing the metadata in TOML file is introduced, i.e.,
writing a table header for the type of option and options for the respective function of the performance program.
eg: 
```
# using start_test : transposePerf.perfexecopts
# cat transposePerf.perfexecopts
--m=10      --iters=1000 --reference=true  #m10
--m=1000    --iters=10   --reference=true  #m1000
--m=10000   --iters=1    --reference=false #m10000

# using mason bench
[perfexecopts]
transposePerf.m10=["--m=10", "--iters=1000", "--reference=true"]
transposePerf.m1000=["--m=1000", "--iters=10", "--reference=true"]
transposePerf.m10000=["--m=10000", "--iters=1", "--reference=false"]
```
- `stencil/`: WIP (complex program)
