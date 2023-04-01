#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} sm4-cbc -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ciphertext_cbc
mv trace.txt trace_cbc.txt

${OPENSSL} sm4-ecb -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ciphertext_ecb
mv trace.txt trace_ecb.txt

${DIFF_PY} trace_cbc.txt trace_ecb.txt
