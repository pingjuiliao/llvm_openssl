#!/usr/bin/env python3

import os
import multiprocessing

NPROC = multiprocessing.cpu_count() // 2
PWD = os.path.abspath(".")
LLVM_ROOT = os.path.abspath("./llvm")
OPENSSL_ROOT = os.path.abspath("./openssl")

def error(msg):
    print(msg)
    quit()

def configure_openssl():
    llvm_build = LLVM_ROOT + "/build"
    llvm_clang = llvm_build + "/bin/clang"
    if not os.path.exists(llvm_clang):
        error("must build llvm first")

    OPENSSL_ROOT = os.path.abspath("./openssl")
    openssl_config_script = OPENSSL_ROOT + "/config"
    if not os.path.exists(openssl_config_script):
        error("must get submodule 'openssl'")

    CC = "CC=" + llvm_clang
    argv = [CC,
            openssl_config_script,
            "no-shared",
            "enable-weak-ssl-ciphers",
            "-DOPENSSL_TLS_SECURITY_LEVEL=2",
            "enable-ec_nistp_64_gcc_128"]
    config_cmd = " ".join(argv)
    print("[CMD]", config_cmd)

    os.chdir(OPENSSL_ROOT)
    os.system(config_cmd)
    os.system("make -j{}".format(NPROC))
    os.chdir(PWD)

def main():
    configure_openssl()

if __name__ == "__main__":
    main()
