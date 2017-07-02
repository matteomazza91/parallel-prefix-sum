
#include <stdio.h>

#include <math.h>
#include <stdlib.h>
#include <getopt.h>
#include <sys/time.h>

struct timeval tm1;
struct timeval tm2;
double t1;
double t2;

float *v1;
float min(float ,float );
int max,typeFunc;


/* cummutative and associative function */
float g(float x,float y){
	float a = x;
	float b = y;
	return a+b;
}


/* cummutative and associative function computationally costly with parameter par*/
float f(float x,float y,int par){
	
	int i ;
	float zero = 0.001;
	float z = x*zero;
	for(i=0;i<par;i++){
		z *= zero;
		z *= zero;
		z *= zero;
	}
	return x+y+z;
	
}



int main(int argc, char* argv[]){
	int i,test=0;
	
	/* usage */
	if(argc < 3){
		printf("USAGE: %s n func [test]\n",argv[0]); 
		printf("\nfunc = 0 => O(1)\nfunc = 1 => O(10)\nfunc = 2 => O(100)\n");
		printf("\ntest = 0 => default\ntest = 1 => only Output\n");
		return 0;
	}

	/* set command line parameters */
	max = atoi(argv[1]);
	typeFunc = atoi(argv[2]);
	if(argc >= 4)
		test = atoi(argv[3]);

	/* allocation of input array and initialization */
	v1 = (float*)malloc(sizeof(float)*max);
	for( i = 0 ;i < max; i++)
		v1[i] = (float)1;

	/* compute and get time */
	gettimeofday(&tm1,NULL);
	for(i = 1; i < max; i++){
		if(typeFunc == 0)
			v1[i]=g(v1[i-1],v1[i]);
		else if(typeFunc == 1)
			v1[i]=f(v1[i-1],v1[i],10);
		else if(typeFunc == 2)
			v1[i]=f(v1[i-1],v1[i],100);
	}
	gettimeofday(&tm2,NULL);
		

	/* display results */
	if(test == 1){
		for(i = 0 ;i < max; i++)
			printf("%.0f ",v1[i]);
		printf("\n");
	}

   
	/* display time needed */
	t2=tm2.tv_sec+(tm2.tv_usec/1000000.0); 
	t1=tm1.tv_sec+(tm1.tv_usec/1000000.0); 
	if(test!=1)
		printf("%.6f\n", t2-t1);

	/* free memory */
	free(v1);

	return 0;

}

