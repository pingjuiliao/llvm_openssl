#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aes-128-cbc -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext_aes128
mv trace.txt trace_aes-128-cbc.txt

${OPENSSL} aria-128-cbc -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext_aria128
mv trace.txt trace_aria-128-cbc.txt

${DIFF_PY} trace_aes-128-cbc.txt trace_aria-128-cbc.txt
