## LLVM openssl
The goal of this repo is to analyze the openssl by transforming it.

### How to run

Compiled the customed compiler
```
./setup_llvm.py
```

compiler the openssl project with customed compiler
```
cd openssl
git submodule init
git submodule sync
git submodule udpate
cd ..
./build_openssl.py
```


### How to analyze
Each run of openssl functionality will dump a `trace.txt` file.  
`analysis/` contains some meaningful analysis

`key_fuzz`: fuzzing different key for the same crypto algorithm to see if there's a different path of execution (which implies possible side-channels)
`diff_test`: see if different crypto algorithms yields different path. This helps for diving into the code and understand it (e.g. dominators, what part are unique under different algorithms)

