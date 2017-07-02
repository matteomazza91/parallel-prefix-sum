#!/bin/bash

maxParDegree=240
inputSize=16777216  #2^24
numTest=7

echo "" > results
echo "<?php \$A = Array(" >> results

echo "computing sequential"
for (( i=1; i<=$numTest; i++))
do
	echo "  Array(0," >> results
	./prefix_sum_mic_seq $inputSize 2 >> results
	echo "  )," >> results
done

for (( i=1; i<=$maxParDegree; i++))
do
   echo "computing $i/$maxParDegree"
   for (( j=1; j<=$numTest; j++))
   do
   	  echo "  Array(" >> results
      ./prefix_sum_mic $inputSize $i 2 1 >> results
      echo "  )," >> results
   done

done

echo """
Array());

\$B = Array();

\$computingDegree = -1;
\$min = 0;
\$max = 0;

foreach(\$A as \$k=>\$v){
	 if(isset(\$v[0])){
          

		if(!isset(\$B[\$v[0]]))
			\$B[\$v[0]] = 0;

		if(\$v[0] != \$computingDegree){
	      if(\$computingDegree>= 0){
	        \$B[\$v[0]]-=(\$min+\$max);
	      }
	      \$computingDegree = \$v[0];
	      \$min = \$B[\$v[0]];
	      \$max = \$B[\$v[0]];
	    }

		\$B[\$v[0]] += \$v[1];
	}
}

foreach(\$B as \$k=>\$v){
	\$B[\$k] /= ($numTest.0-2.0);
}

foreach(\$B as \$k => \$v)
	if(\$k != 0)
		echo \"\$k \".(\$B[1]/\$v).\" \".(\$B[0]/\$v).\" \".\$B[0]/((\$B[0]*log($inputSize,2))/\$k).\" \$k\n\";
""" >> results


# parDegree scalability speedup speedupCalculated scalabilityCalculated