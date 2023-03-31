#!/bin/bash
OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py

${OPENSSL} aria-256-cfb -a -e -pbkdf2 -in ./plaintext -pass "pass:example" -out ./ciphertext
mv trace.txt trace_enc.txt

${OPENSSL} aria-256-cfb -a -d -pbkdf2 -in ./ciphertext -pass "pass:example" -out ./decrypted
mv trace.txt trace_dec.txt

${DIFF_PY} ./trace_enc.txt ./trace_dec.txt
