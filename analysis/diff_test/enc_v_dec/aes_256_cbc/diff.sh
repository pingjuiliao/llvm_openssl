#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aes-256-cbc -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext
mv trace.txt trace_enc.txt

${OPENSSL} aes-256-cbc -a -d -pbkdf2 -in ./ciphertext -pass "pass:example" -out ./decrypted
mv trace.txt trace_dec.txt

${DIFF_PY} ./trace_enc.txt ./trace_dec.txt
