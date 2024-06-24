## Try 1 : with double type

working, below see the call and some of the results (see "try1.txt") :

```
timeout 2h bambu $root_dir/../cpu_functions/cpu_functions.cpp --top-fname=max_pooling --simulate --evaluation --device-name=asap7-BC --simulator=XSIM --experimental-setup=BAMBU-PERFORMANCE-MP "$@"
```

```
Scheduling Information of function max_pooling:
    Number of control steps: 17
    Minimum slack: 7.0099455525516303
    Estimated max frequency (MHz): 334.44207039553163
Time to perform scheduling: 0.02 seconds

Module binding information for function max_pooling:
    Number of modules instantiated: 125
    Number of performance conflicts: 0
    Estimated resources area (no Muxes and address logic): 281950
    Estimated area of MUX21: 16794
    Total estimated area: 298744
    Estimated number of DSPs: 0
Time to perform module binding: 0.01 seconds
```


