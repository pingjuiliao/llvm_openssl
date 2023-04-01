#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aes-128-cbc -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ciphertext_cbc
mv trace.txt trace_cbc.txt

${OPENSSL} aes-128-ecb -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ciphertext_ecb
mv trace.txt trace_ecb.txt

${DIFF_PY} trace_cbc.txt trace_ecb.txt
