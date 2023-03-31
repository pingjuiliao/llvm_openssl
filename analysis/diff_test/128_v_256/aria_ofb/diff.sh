#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aria-128-ofb -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext128
mv trace.txt trace_128.txt

${OPENSSL} aria-256-ofb -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext256
mv trace.txt trace_256.txt

${DIFF_PY} trace_128.txt trace_256.txt

