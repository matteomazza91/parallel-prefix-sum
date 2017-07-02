/**
 *
 *	Title:	Parallel Prefix - Algorithm 1 with optimization
 *	Author: Matteo Mazza - 463856
 *	Date:	11/02/2015
 *
 * 	optimization: at every steps each worker recalculate the subarray that it have to compute
 * 				  taking into account that the first elements are already calculated
 * 
 */

#include <stdio.h>
#include <stdlib.h>

#include <math.h>
#include <pthread.h>

#include <getopt.h>
#include <sys/time.h>

struct timeval tm1;
struct timeval tm2;
double t1;
double t2;
int test=0;


float* prefix_sum();
void* worker(void* par);
unsigned long dim;
int num_of_threads;

float *Vector1, *Vector2, *Vresult;
unsigned volatile long newStage = 0;
unsigned volatile long *threadsCompleted;


int typeFunc = 0;


/* commutative and associative function plus */
float g(float x,float y){
	float a = x;
	float b = y;
	return a+b;
}

/* commutative and associative function plus  with active delay adjusted by par*/
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


	/* initialization */
	/* create 2 arrays because at each step we need an input and an output array */
	Vector1 = malloc(dim * sizeof(float));
	Vector2 = malloc(dim * sizeof(float));
	for(i = 0; i<dim; i++)
		Vector1[i] = (float)1;

	/* compute parallel prefix and get the time needed by the computation */
	gettimeofday(&tm1,NULL);
	Vresult = prefix_sum();
	gettimeofday(&tm2,NULL);


	/* check correctness */
	if(test==2){
		for(i = 0; i<dim; i++)
			printf("%.0f ",Vresult[i]);
	}
	

	/* display time needed by the computation */
	t2=tm2.tv_sec+(tm2.tv_usec/1000000.0); 
	t1=tm1.tv_sec+(tm1.tv_usec/1000000.0); 
	if(test){
		printf("\n%i,%.6f\n",num_of_threads, t2-t1);
	}
	else
		printf("\n%.6f seconds\n", t2-t1);


	/* free memory */
	free(Vector1);
	free(Vector2);
	return 0;
}

/* log in base 2 revised upwards */
unsigned int log_2_ceil( unsigned int x )
{
  unsigned int ans = 0 ;
  int num_of_1 = 0;
  if(x%2 == 1) num_of_1++;
  while( x>>=1 ) {
  	if(x%2 == 1) num_of_1++;
  	ans++;
  }
  if(num_of_1 != 1) ans++;
  return ans ;
}



/* code of the master that coordinate workers */
float* prefix_sum(){
	pthread_t* threads;
	int i;
	long maxStage;
	int* parameters;

	/* memory allocation for threads and shared variables */
	parameters = malloc(num_of_threads * sizeof(int));
	threads = malloc(num_of_threads * sizeof(pthread_t));
	threadsCompleted = malloc(num_of_threads * sizeof(unsigned long)); /* each element of this array is assigned to one thread to communicate its state in the computation */

	/* newStage is a shared variable assigned at the master. Workers are synchronized all together reading this variable  */
	newStage = 0;

	/* creation of workers */
	for(i = 0;i<num_of_threads;i++){
		parameters[i] = i;
		threadsCompleted[i] = -2;
		pthread_create(&threads[i],NULL,worker,(void*)&parameters[i]);
	}

	/* determine the number of steps needed by the computation */
	maxStage = log_2_ceil(dim);   
	while( newStage != -1){
		/* (active) waiting that all workers complete the computation of step number newStage */
		for(i = 0;i<num_of_threads;i++){
			while(threadsCompleted[i] != newStage);
		}

		/* increase newStage (communicate to the worker to start the new step) */
		if(newStage+1 < maxStage)
			newStage++;
		else
			/* if all the steps are completed, set the "exit message" newStage = -1 */
			newStage = -1;
	}

	/* join all workers */
	for(i = 0; i<num_of_threads; i++){
		pthread_join(threads[i],NULL);
	}

	/* free memory used */
	free(parameters);
	free(threads);
	free((void*)threadsCompleted);

	/* determin in which Vector is stored the output */
	if(maxStage%2)
		return Vector2;
	return Vector1;
}

/*
	Determine the starting index of the authority interval of thread threadId at step stage

	after 0 stages,  first 1 element is completed
	after 1 stage,   first 2 elements are completed
	after 2 stages,  first 4 elements are completed
	after 3 stages,  first 8 elements are completed

	after i stages,  2^i elements are completed

 */
unsigned long computeFirst(unsigned long stage, int threadId){
	/*
		subdivide to compute stage i, the firsts 2^i elements are already completed
		but the elements in the intervals [2^(i-1),2^i] must be copied in the second array

		length = (dim - 2^stage)
		length_per_thread = length / num_of_threads
		first_element = (num_of_threads * id) + 2^stage
	 */
	unsigned long two_power_stage = 1;
	if(stage > 0)
		stage--;
	two_power_stage <<= stage;
	return ((dim-two_power_stage)/num_of_threads)*(threadId) + two_power_stage;
}

/*
	Determine the ending index of the authority interval of thread threadId at step stage
*/
unsigned long computeLast(unsigned long stage, int threadId){
	unsigned long two_power_stage = 1;
	if(stage > 0)
		stage--;
	two_power_stage <<= stage;
	return ((dim-two_power_stage)/num_of_threads)*(threadId+1) + two_power_stage -1;
}


void* worker(void* par){
	unsigned long i, addingItem, stage, sub;

	/* setting worker parameters */
	int id = *((int*)par);
	unsigned long first = ((dim)/num_of_threads)*(id);
	unsigned long last = ((dim)/num_of_threads)*(id+1)-1;
	

	/*if(last < first){
		printf("WARNING: thread %i has an empty partition\n",id);
	}*/

	stage = 0; sub = 1;
	while(stage != -1){
		


		if(test == 2)
			printf("thread %i, stage %li, first=%li, last = %li\n",id,stage,first, last);
	
		/* if stage is even, output vector = Vector2   and   input vector = Vector1 */
		if(stage % 2 == 0){
			for(i = first; i <= last; i++){
				
				if(i >= sub){  /* same as addingItem >= 0 */
					addingItem = i-sub;

					/* apply the choosed function */
					if(typeFunc == 0)
						Vector2[i] = g(Vector1[i] , Vector1[addingItem]);
					if(typeFunc == 1)
						Vector2[i] = f(Vector1[i],Vector1[addingItem],10);
					if(typeFunc == 2)
						Vector2[i] = f(Vector1[i],Vector1[addingItem],100);
					
				}
				else
					/* copy the value in the output Vector */
					Vector2[i] = Vector1[i];
			}
		}
		else{
			for(i = first; i <= last; i++){

				if(i >= sub){  /* same as addingItem >= 0*/
					addingItem = i-sub;
					/* apply the choosed function */
					if(typeFunc == 0)
						Vector1[i] = g(Vector2[i] , Vector2[addingItem]);
					if(typeFunc == 1)
						Vector1[i] = f(Vector2[i],Vector2[addingItem],10);
					if(typeFunc == 2)
						Vector1[i] = f(Vector2[i],Vector2[addingItem],100);
				}
				else
					/* copy the value in the output Vector */
					Vector1[i] = Vector2[i];
			}
		}

		

		/* MESSAGE "Stage Completed" ( shared var ) */
		threadsCompleted[id] = stage;
		

		/* UPDATE parameters for next stage, before waiting all threads */
		sub *=2;
		first = computeFirst(stage+1,id);   

		if(id == num_of_threads-1)
			last = dim-1;
		else
			last = computeLast(stage+1,id);

		/* WAITING master */
		while(stage == newStage); /* synch */
		stage=newStage;

		
	}
	
	return NULL;
}
