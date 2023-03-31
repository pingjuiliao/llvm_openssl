#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aes-128-ecb -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext128
mv trace.txt trace_128.txt

${OPENSSL} aes-256-ecb -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext256
mv trace.txt trace_256.txt

${DIFF_PY} trace_128.txt trace_256.txt

