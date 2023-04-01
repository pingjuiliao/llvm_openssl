#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aria-192-ctr -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ciphertext_aria
mv trace.txt trace_aria192.txt

${OPENSSL} sm4-ctr -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ciphertext_sm4
mv trace.txt trace_sm4.txt

${DIFF_PY} trace_aria192.txt trace_sm4.txt
