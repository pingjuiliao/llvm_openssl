#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aes-256-cbc -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext_aes256
mv trace.txt trace_aes-256-cbc.txt

${OPENSSL} aria-256-cbc -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext_aria256
mv trace.txt trace_aria-256-cbc.txt

${DIFF_PY} trace_aes-256-cbc.txt trace_aria-256-cbc.txt
