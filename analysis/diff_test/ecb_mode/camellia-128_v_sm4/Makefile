OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py
KEY128=$(shell cat ../../key128)
IV=$(shell cat ../../iv128)

all: diff
diff: trace_camellia trace_sm4
	$(DIFF_PY) trace_camellia.txt trace_sm4.txt
trace_camellia:
	$(OPENSSL) camellia-128-ecb -a -e -K $(KEY128) -in ./plaintext -out ./ciphertext_camellia128
	mv trace.txt trace_camellia.txt
trace_sm4:
	$(OPENSSL) sm4-ecb -a -e -K $(KEY128) -in ./plaintext -out ./ciphertext_sm4
	mv trace.txt trace_sm4.txt
clean:
	rm $(wildcard *.txt) $(wildcard ciphertext*)
