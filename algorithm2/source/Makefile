all: compile debug
	
compile: prefixSum.c scan-seq.c
	gcc prefixSum.c -lpthread -lm -Wall -pedantic -Os -o prefix_sum
	gcc scan-seq.c -lpthread -lm -Wall -pedantic -Os -o prefix_sum_seq

debug: prefixSum.c scan-seq.c
	gcc prefixSum.c -lpthread -lm -Wall -pedantic -g -O0 -fbuiltin -o prefix_sum_debug
	gcc scan-seq.c -lpthread -lm -Wall -pedantic -g -O0 -fbuiltin -o prefix_sum_debug_seq

mic: mic-parallel mic-seq

mic-parallel: prefixSum.c
	/opt/intel/bin/icc prefixSum.c -lpthread -lm -mmic -o prefix_sum_mic

mic-seq: scan-seq.c
	/opt/intel/bin/icc scan-seq.c -lpthread -lm -mmic -o prefix_sum_mic_seq

test1_mic1:
	ssh spm1422@r720-phi.itc.unipi.it "mkdir test ; rm -rf test/*"
	scp prefixSum.c scan-seq.c Makefile test_1.sh spm1422@r720-phi.itc.unipi.it:~/test/ 
	ssh spm1422@r720-phi.itc.unipi.it "cd test ; make test1_phi_mic1"
	scp spm1422@r720-phi.itc.unipi.it:test/result1 result1.php
	php result1.php > toplot
	gnuplot plotSpeedup.gp > speedup_1.png
	gnuplot plotSpeedupTotale.gp > speedup_1_totale.png
	gnuplot plotScalability.gp > scalability_1.png
	gnuplot plotScalabilityTotale.gp > scalability_1_totale.png

test1_phi_mic1: mic
	ssh mic1 rm -rf *
	scp prefix_sum_mic_seq prefix_sum_mic test_1.sh mic1:
	ssh mic1 bash test_1.sh
	scp mic1:results result1


test1_mic0:
	ssh spm1422@r720-phi.itc.unipi.it "mkdir test ; rm -rf test/*"
	scp prefixSum.c scan-seq.c Makefile test_1.sh spm1422@r720-phi.itc.unipi.it:~/test/ 
	ssh spm1422@r720-phi.itc.unipi.it "cd test ; make test1_phi_mic0"
	scp spm1422@r720-phi.itc.unipi.it:test/result1 result1.php
	php result1.php > toplot
	gnuplot plotSpeedup.gp > speedup_1.png
	gnuplot plotSpeedupTotale.gp > speedup_1_totale.png
	gnuplot plotScalability.gp > scalability_1.png
	gnuplot plotScalabilityTotale.gp > scalability_1_totale.png

test1_phi_mic0: mic
	ssh mic0 rm -rf *
	scp prefix_sum_mic_seq prefix_sum_mic test_1.sh mic0:
	ssh mic0 bash test_1.sh
	scp mic0:results result1


test2_mic1:
	ssh spm1422@r720-phi.itc.unipi.it "mkdir test ; rm -rf test/*"
	scp prefixSum.c scan-seq.c Makefile test_2.sh spm1422@r720-phi.itc.unipi.it:~/test/ 
	ssh spm1422@r720-phi.itc.unipi.it "cd test ; make test2_phi_mic1"
	scp spm1422@r720-phi.itc.unipi.it:test/result2 result2.php
	php result2.php > toplot
	gnuplot plotSpeedup.gp > speedup_2.png
	gnuplot plotSpeedupTotale.gp > speedup_2_totale.png
	gnuplot plotScalability.gp > scalability_2.png
	gnuplot plotScalabilityTotale.gp > scalability_2_totale.png

test2_phi_mic1: mic
	ssh mic1 rm -rf *
	scp prefix_sum_mic_seq prefix_sum_mic test_2.sh mic1:
	ssh mic1 bash test_2.sh
	scp mic1:results result2


test2_mic0:
	ssh spm1422@r720-phi.itc.unipi.it "mkdir test ; rm -rf test/*"
	scp prefixSum.c scan-seq.c Makefile test_2.sh spm1422@r720-phi.itc.unipi.it:~/test/ 
	ssh spm1422@r720-phi.itc.unipi.it "cd test ; make test2_phi_mic0"
	scp spm1422@r720-phi.itc.unipi.it:test/result2 result2.php
	php result2.php > toplot
	gnuplot plotSpeedup.gp > speedup_2.png
	gnuplot plotSpeedupTotale.gp > speedup_2_totale.png
	gnuplot plotScalability.gp > scalability_2.png
	gnuplot plotScalabilityTotale.gp > scalability_2_totale.png

test2_phi_mic0: mic
	ssh mic0 rm -rf *
	scp prefix_sum_mic_seq prefix_sum_mic test_2.sh mic0:
	ssh mic0 bash test_2.sh
	scp mic0:results result2


test3_mic1:
	ssh spm1422@r720-phi.itc.unipi.it "mkdir test ; rm -rf test/*"
	scp prefixSum.c scan-seq.c Makefile test_3.sh spm1422@r720-phi.itc.unipi.it:~/test/ 
	ssh spm1422@r720-phi.itc.unipi.it "cd test ; make test3_phi_mic1"
	scp spm1422@r720-phi.itc.unipi.it:test/result3 result3.php
	php result3.php > toplot
	gnuplot plotSpeedup.gp > speedup_3.png
	gnuplot plotSpeedupTotale.gp > speedup_3_totale.png
	gnuplot plotScalability.gp > scalability_3.png
	gnuplot plotScalabilityTotale.gp > scalability_3_totale.png

test3_phi_mic1: mic
	ssh mic1 rm -rf *
	scp prefix_sum_mic_seq prefix_sum_mic test_3.sh mic1:
	ssh mic1 bash test_3.sh
	scp mic1:results result3


test3_mic0:
	ssh spm1422@r720-phi.itc.unipi.it "mkdir test ; rm -rf test/*"
	scp prefixSum.c scan-seq.c Makefile test_3.sh spm1422@r720-phi.itc.unipi.it:~/test/ 
	ssh spm1422@r720-phi.itc.unipi.it "cd test ; make test3_phi_mic0"
	scp spm1422@r720-phi.itc.unipi.it:test/result3 result3.php
	php result3.php > toplot
	gnuplot plotSpeedup.gp > speedup_3.png
	gnuplot plotSpeedupTotale.gp > speedup_3_totale.png
	gnuplot plotScalability.gp > scalability_3.png
	gnuplot plotScalabilityTotale.gp > scalability_3_totale.png

test3_phi_mic0: mic
	ssh mic0 rm -rf *
	scp prefix_sum_mic_seq prefix_sum_mic test_3.sh mic0:
	ssh mic0 bash test_3.sh
	scp mic0:results result3