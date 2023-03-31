#!/usr/bin/env python3

import os
import sys

SCRIPT_DIR = os.path.realpath(os.path.dirname(__file__))

def error(msg):
    print(msg)
    quit()

def diff(file0, file1):

    with open(file0, "rb") as f0:
        s0 = f0.read()
        f0.close()

    with open(file1, "rb") as f1:
        s1 = f1.read()
        f1.close()

    tuple0 = s0.split("\n")
    tuple1 = s1.split("\n")

    set0 = set(tuple0)
    set1 = set(tuple1)

    paragraph0 = "[STATS]"
    paragraph0 +=
    paragraph0 += "{}".format(len(set0))

    with open(OUTFILE, "wb") as f:
        f.write()
        f.close()

def main():
    if len(sys.argv) < 3:
        error("Usage: {} <file0> <file1> <outfile>".format(argv[0]))

    file0, file1 = argv[1], argv[2]
    if not os.path.exists(file0):
        error("{} does not exists".format(file0))
    if not os.path.exists(file1):
        error("{} does not exists".format(file1))

    diff(file0, file1)

if __name__ == "__main__":
    main()
