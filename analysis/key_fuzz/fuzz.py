#!/usr/bin/env python3
import collections
import hashlib
import os

BLOCK_SIZE = 16
OPENSSL = "../../openssl/apps/openssl"
ENCODE_ALGORITHM = "aes-128-cbc"
PLAINTEXT_FILE = "./plaintext"
CIPHERTEXT_FILE = "./ciphertext"
CONST_IV = "0"*BLOCK_SIZE*2
DEBUG = False

def fuzz_input():
    with open("/dev/urandom", "rb") as f:
        x = f.read(BLOCK_SIZE)
        f.close()
    return x

def fuzz_eval():
    with open("./trace.txt", "rb") as f:
        raw_content = f.read()
        f.close()

    # remove pid tracing
    traces = raw_content.split(b"\n")
    format_traces = []
    for trace in traces:
        if b"|" in trace:
            format_trace = trace[:trace.find(b"|")]
            format_traces.append(format_trace)

    format_content = b"\n".join(format_traces)
    if DEBUG:
        with open("format_trace.txt", "wb") as f:
            f.write(format_content)
            f.close()

    return hashlib.md5(format_content).hexdigest()

def fuzz_one():
    key = fuzz_input().hex()
    print("fuzzing key", key)
    cmd = [OPENSSL, ENCODE_ALGORITHM, "-a", "-e",
           "-K", key, "-iv", CONST_IV,
           "-in", PLAINTEXT_FILE,
           "-out", CIPHERTEXT_FILE]

    os.system(" ".join(cmd))
    result = fuzz_eval()
    print("trace.txt cksum:", result)
    return key, result

def main():

    result_2_key = collections.defaultdict(list)
    for _ in range(100):
        k, cksum = fuzz_one()
        result_2_key[cksum].append(k)

    for k, v in result_2_key.items():
        print(k, ":", "[")
        for cipher_key in v:
            print("\t", cipher_key)
        print("]")


if __name__ == "__main__":
    main()
