#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aria-128-ctr -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ciphertext_aria
mv trace.txt trace_aria128.txt

${OPENSSL} sm4-ctr -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ciphertext_sm4
mv trace.txt trace_sm4.txt

${DIFF_PY} trace_aria128.txt trace_sm4.txt
