OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py
KEY128=$(shell cat ../../key128)
IV=$(shell cat ../../iv128)

all: diff
diff: trace_cbc trace_ecb
	$(DIFF_PY) trace_cbc.txt trace_ecb.txt
trace_cbc:
	$(OPENSSL) camellia-128-cbc -a -e -K $(KEY128) -iv $(IV) -in ./plaintext -out ./ciphertext_cbc
	mv trace.txt trace_cbc.txt
trace_ecb:
	$(OPENSSL) camellia-128-ecb -a -e -K $(KEY128) -in ./plaintext -out ./ciphertext_ecb
	mv trace.txt trace_ecb.txt
clean:
	rm $(wildcard *.txt) $(wildcard ciphertext*)
