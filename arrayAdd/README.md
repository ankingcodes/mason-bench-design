### arrayAdd 
Metadata to consider: 
- arrayAdd.good
- arrayAdd.perfcompopts
- arrayAdd.perfkeys

In the traditional [test](https://github.com/chapel-lang/chapel/blob/master/test/studies/elegance/arrayAdd.chpl), 
there's a main proc where the recorded time of elegant & performant is being returned and outputted to stream. 
This output is tested for correctness with .good file and perf data is matched with .perfkeys .
