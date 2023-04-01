#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aes-128-cbc -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext_aes128
mv trace.txt trace_aes-128-cbc.txt

${OPENSSL} sm4-cbc -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext_sm4
mv trace.txt trace_sm4-cbc.txt

${DIFF_PY} trace_aes-128-cbc.txt trace_sm4-cbc.txt
