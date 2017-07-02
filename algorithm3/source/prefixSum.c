/**
 *
 *	Title:	Parallel Prefix - Algorithm 3
 *	Author: Matteo Mazza - 463856
 *	Date:	11/02/2015
 * 
 */

#define _GNU_SOURCE
#define STAGE0 0
#define STAGE1 1
#define STAGE2 2

#include <stdio.h>
#include <stdlib.h>

#include <math.h>
#include <sched.h>
#include <pthread.h>

#include <getopt.h>
#include <sys/time.h>

struct timeval tm1;
struct timeval tm2;
double t1;
double t2;
int test=0;


void prefix_sum();
void* worker(void* par);

/* common variables */
unsigned long dim;
int num_of_threads;
int num_of_partitions;
int typeFunc = 0;

/* real shared variables */
float *Vector;



/* commutative and associative function plus */
float g(float x,float y){
	float a = x;
	float b = y;
	return a+b;
}

/* commutative and associative function plus  with active delay adjusted by par */
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
	int i;

	/* Usage */
	if(argc < 4){
		printf("USAGE: %s n threads func [test]\n",argv[0]); 
		printf("test = 0 => human readable\ntest = 1 => for plotting script\ntest = 2 => verify correctness\ntest = 3 => only output\n");
		printf("\nfunc = 0 => O(1)\nfunc = 1 => O(10)\nfunc = 2 => O(100)\n");
		return 0;
	}

	/* set the invoked parameters */
	if(argc > 4)
		if(atoi(argv[4]))
			test = atoi(argv[4]);

	typeFunc = atoi(argv[3]);
	dim = atoi(argv[1]);
	num_of_threads = atoi(argv[2]);


	/* set also the number of partitions that strictly depend on the parameter num_of_threads */
	num_of_partitions = num_of_threads+1;


	/* initialization */
	Vector = malloc(dim * sizeof(float));
	for(i = 0; i<dim; i++){
		Vector[i] = (float)1;
		
	}


	/* compute parallel prefix and get the time needed by the computation */
	gettimeofday(&tm1,NULL);
	prefix_sum();
	gettimeofday(&tm2,NULL);


	/* check correctness */
	if(test==2 || test == 3){
		for(i = 0; i<dim; i++)
			printf("%.0f ",Vector[i]);
	}
	


	/* display time needed by the computation */
	t2=tm2.tv_sec+(tm2.tv_usec/1000000.0); 
	t1=tm1.tv_sec+(tm1.tv_usec/1000000.0); 
	if(test!= 3){
		if(test){
			printf("\n%i,%.6f\n",num_of_threads, t2-t1);
		}
		else
			printf("%.6f seconds\n", t2-t1);
	}

	
	/* free memory */
	free(Vector);
	return 0;
}


/* structure of parameter passed to the worker. It is used also to communicate 1 value val  between worker and master */
typedef struct parameter{
	int id;
	int state ;
	float val;

} parameter_t;


/* linear prefix sum on every values val sent by the workers (this is the sequential part of the computation) */
void linearSolution(parameter_t* p){
	int i;
	for(i=1; i<num_of_threads;i++){
		if(typeFunc == 0)
			p[i].val = g(p[i].val , p[i-1].val);
		else if(typeFunc == 1)
			p[i].val = f(p[i].val,p[i-1].val,10);
		else if(typeFunc == 2)
			p[i].val = f(p[i].val,p[i-1].val,100);
	}

	if(test==2){
		printf("linearSolution\n");
		for(i=0; i<num_of_threads;i++){
			printf("%f ",p[i].val);
		}	
		printf("\n");
	}
	return;
}



/* code of the master that coordinate workers */
void prefix_sum(){
	pthread_t* threads;
	int i;
	volatile parameter_t* parameters;


	/* memory allocation for threads and shared variables */
	parameters = malloc(num_of_threads * sizeof(parameter_t));
	threads = malloc(num_of_threads * sizeof(pthread_t));
	

	/* creation of workers */
	for(i = 0;i<num_of_threads;i++){
		parameters[i].id = i;
		parameters[i].state = STAGE0;
		pthread_create(&threads[i],NULL,worker,(void*)&parameters[i]);

	}
	
	for(i = 0;i<num_of_threads;i++){
		/* (active) waiting that all workers complete the computation of STAGE0 */
		while(parameters[i].state == STAGE0);	
	}

	/* apply the linear solution on the values computed by the workers */
	linearSolution((parameter_t*)parameters);
	
	/* workers start STAGE2  */
	for(i = 0;i<num_of_threads;i++){
		parameters[i].state = STAGE2;
	}

	for(i = 0; i<num_of_threads; i++){
		/* join all workers */
		pthread_join(threads[i],NULL);
	}

	/* free memory used */
	free((parameter_t*)parameters);
	free(threads);

	return ;
}



void* worker(void* par){
	unsigned long i;
	unsigned long first,last;

	/* setting worker parameters  and  copying the global parameters in the stack of the worker */
	int id = (*((parameter_t*)par)).id;
	volatile float *result = &(*((parameter_t*)par)).val;
	volatile int *state = &(*((parameter_t*)par)).state;

	unsigned long t_dim = dim, 
	              t_num_of_partitions = num_of_partitions;
	unsigned long t_dim_partitions=t_dim/t_num_of_partitions;
	int t_typeFunc = typeFunc;
	float *t_Vector = Vector;
	float summingValue;

	/*
	cpu_set_t mask;
	CPU_ZERO(&mask);
	CPU_SET((id*4)+1, &mask);
	if(id<60)
		if(sched_setaffinity(0, sizeof(mask), &mask))
			perror("ERRORE setaffinity");
	*/


	/* find the authority interval */
	first = id*t_dim_partitions;
	last =  (id+1)*t_dim_partitions - 1;

	
	/*if(last < first){
		printf("WARNING: thread %i has an empty partition\n",id);
	}*/


	i = -1;
	if(test == 2)
		printf("thread %i, first=%li, last = %li\n",id,first, last);

	if(last != -1){   /*  if needed because of last is typed UNSIGNED ( last can be -1 becouse of the formula, and (unsigned -1) is bigger than first in the second nested if) */
			
		/* the first stage (STAGE0): compute prefixSum on the authority interval */
		for(i = first+1; i <= last; i++){
			
			if(t_typeFunc == 0)
				t_Vector[i] = g(t_Vector[i], t_Vector[i-1]);
			else if(t_typeFunc == 1)
				t_Vector[i] = f(t_Vector[i],t_Vector[i-1],10);
			else if(t_typeFunc == 2)
				t_Vector[i] = f(t_Vector[i],t_Vector[i-1],100);
		}
	}
			

	/* MESSAGE "Stage0 Completed" ( shared var ) */
	if(i>=0)
		*result = t_Vector[i-1];
	*state = STAGE1;
	
	/* compute next authority interval */
	first = last+1;
	last = last + t_dim_partitions;
	if(id == num_of_threads-1)
		last = dim-1;

	/* WAITING master */
	while(*state != STAGE2); /* synch */
	

	/* start STAGE2 */

	/* retrieve the value to add at the new authority interval */
	summingValue = *result;
	if(test == 2)
		printf("thread %i, first=%li, last = %li, summingVal=%f\n",id,first, last, summingValue);


	if(id == num_of_threads-1){
		/* if the authority interval is the last subarray, compute prefixSum taking into account the summingValue */
		if(t_typeFunc == 0)
			t_Vector[first] = g(t_Vector[first] , summingValue);
		else if(t_typeFunc == 1)
			t_Vector[first] = f(t_Vector[first],summingValue,10);
		else if(t_typeFunc == 2)
			t_Vector[first] = f(t_Vector[first],summingValue,100);


		if(last != -1){    /*  if needed because of last is typed UNSIGNED ( last can be -1 becouse of the formula, and (unsigned -1) is bigger than first in the second nested if) */
			for(i = first+1; i <= last; i++){
				
				if(t_typeFunc == 0)
					t_Vector[i] = g(t_Vector[i] , t_Vector[i-1]);
				else if(t_typeFunc == 1)
					t_Vector[i] = f(t_Vector[i],t_Vector[i-1],10);
				else if(t_typeFunc == 2)
					t_Vector[i] = f(t_Vector[i],t_Vector[i-1],100);
			}
		}

	}
	else{
		/* if the authority interval is not the last subarray, add only the summingValue */
		if(last != -1){   /*  if needed because of last is typed UNSIGNED ( last can be -1 becouse of the formula, and (unsigned -1) is bigger than first in the second nested if) */
			for(i = first; i <= last; i++){
				
				if(t_typeFunc == 0)
					t_Vector[i] = g(t_Vector[i] , summingValue);
				else if(t_typeFunc == 1)
					t_Vector[i] = f(t_Vector[i],summingValue,10);
				else if(t_typeFunc == 2)
					t_Vector[i] = f(t_Vector[i],summingValue,100);
			}
		}

	}



	return NULL;
}
