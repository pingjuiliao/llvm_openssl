OPENSSL=../../../../openssl/apps/openssl
DIFF_PY=../../../diff.py
KEY128=$(shell cat ../../key128)
IV=$(shell cat ../../iv128)

all: diff
diff: trace_aes trace_camellia
	$(DIFF_PY) trace_aes.txt trace_camellia.txt
trace_aes:
	$(OPENSSL) aes-128-cbc -a -e -K $(KEY128) -iv $(IV) -in ./plaintext -out ./ciphertext_aes128
	mv trace.txt trace_aes.txt
trace_camellia:
	$(OPENSSL) camellia-128-cbc -a -e -K $(KEY128) -iv $(IV) -in ./plaintext -out ./ciphertext_camellia128
	mv trace.txt trace_camellia.txt
clean:
	rm $(wildcard *.txt) $(wildcard ciphertext*)
