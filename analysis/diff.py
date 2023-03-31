#!/usr/bin/env python3

import os
import sys

SCRIPT_DIR = os.path.realpath(os.path.dirname(__file__))
PWD = os.getcwd()
OUTFILE = PWD + "/diff_report.txt"

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

    tuple0 = s0.strip().split(b"\n")
    tuple1 = s1.strip().split(b"\n")

    set0 = set(tuple0)
    set1 = set(tuple1)

    paragraph0 = b"[STATS]\n"
    paragraph0 += b"$$ " + file0.encode() + b" $$\n"
    paragraph0 += "uniq func:{}\n".format(len(set0)).encode()
    paragraph0 += b"\n$$ " + file1.encode() + b" $$\n"
    paragraph0 += "uniq func:{}\n".format(len(set1)).encode()

    paragraph1 = "\n\n[Uniq Func in {}]\n".format(file0).encode()
    for tup in (set0 - set1):
        paragraph1 += tup + b"\n"

    paragraph2 = "\n\n[Uniq Func in {}]\n".format(file1).encode()
    for tup in (set1 - set0):
        paragraph2 += tup + b"\n"

    with open(OUTFILE, "wb") as f:
        f.write(paragraph0)
        f.write(paragraph1)
        f.write(paragraph2)
        f.close()

def main():
    if len(sys.argv) < 3:
        error("Usage: {} <file0> <file1> <outfile>".format(sys.argv[0]))

    file0, file1 = sys.argv[1], sys.argv[2]
    if not os.path.exists(file0):
        error("{} does not exists".format(file0))
    if not os.path.exists(file1):
        error("{} does not exists".format(file1))

    diff(file0, file1)

if __name__ == "__main__":
    main()
