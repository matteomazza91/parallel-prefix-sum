/**
 *
 *	Title:	Parallel Prefix - Algorithm 2 with optimizations
 *	Author: Matteo Mazza - 463856
 *	Date:	11/02/2015
 *
 *	optimizations: 
 *		- insert tempStage variable to avoid repeated read from the volatile variable stage
 *		
 *		- global variable copied in the thread stack to avoid multiple read from the same memory area
 *		
 *	 
 */
	

#define _GNU_SOURCE

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
unsigned volatile long newStage = 0;
unsigned volatile long *threadsCompleted;



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
	unsigned long real_dim;

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
	num_of_partitions = 2*num_of_threads;

	/* initialization */
	real_dim = dim;
	if(dim %2)  /*dim must be even. if dim is odd, we compute with dim+1 elements and we display only dim elements. (NOTE: The value of the added element is not meaningful to compute the dim elements of the output ) */
		dim++;

	/* since each worker (in each step) does not read elements in subarrays assigned to other workers we don't need an additional array (save memory) */
	Vector = malloc(dim * sizeof(float));
	for(i = 0; i<dim; i++){
		Vector[i] = (float)1;
	}


	/* compute parallel prefix and get the time needed by the computation */
	gettimeofday(&tm1,NULL);
	prefix_sum();
	gettimeofday(&tm2,NULL);


	/* check correctness */
	if(test==2){
		for(i = 0; i<real_dim; i++)
			printf("%.0f ",Vector[i]);
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
	free(Vector);
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
void prefix_sum(){
	pthread_t* threads;
	int i;
	unsigned long maxStage;
	int* parameters;
	unsigned long tempStage;

	
	/* memory allocation for threads and shared variables */
	parameters = malloc(num_of_threads * sizeof(int));
	threads = malloc(num_of_threads * sizeof(pthread_t));
	threadsCompleted = malloc(num_of_threads * sizeof(unsigned long));
	
	
	/* newStage is a shared variable assigned at the master. Workers are synchronized all together reading this variable  */
	newStage = 0;
	tempStage = 0; /* since newStage is volatile, we introduce a copy of that variable that is mantained locally on the master stack to avoid some contentions */

	/* creation of workers */
	for(i = 0;i<num_of_threads;i++){
		parameters[i] = i;
		threadsCompleted[i] = -2;
		pthread_create(&threads[i],NULL,worker,(void*)&parameters[i]);

	}

	/* determine the number of steps needed by the computation */
	maxStage = log_2_ceil(num_of_threads)+2;   
	while( tempStage != -1){
		/* (active) waiting that all workers complete the computation of step number newStage */
		for(i = 0;i<num_of_threads;i++){
			while(threadsCompleted[i] != tempStage);
		}

		/* increase newStage (communicate to the worker to start the new step) */
		if(tempStage+1 < maxStage){
			newStage++;
			tempStage++;
		}
		else{
			/* if all the steps are completed, set the "exit message" newStage = -1 */
			newStage = -1;
			tempStage = -1;
		}
	}

	/* join all workers */
	for(i = 0; i<num_of_threads; i++){
		pthread_join(threads[i],NULL);
	}

	/* free memory used */
	free(parameters);
	free(threads);
	free((void*)threadsCompleted);

	return ;
}

/*
	Determine the starting index of the authority interval of thread threadId at step stage

	after 0 stages,  first 1 element is completed
	after 1 stage,   first 2 elements are completed
	after 2 stages,  first 4 elements are completed
	after 3 stages,  first 8 elements are completed

	after i stages,  2^i elements are completed

 */
unsigned long computeFirst(unsigned long stage, int threadId, unsigned long num_of_partitions, unsigned long dim_partition){
	/*
		stage 0:  0 _ 1 _ 2 _ 3 _ 4 _ 5 _ 6 _ 7 _
		stage 1:  _ 0 _ 1 _ 2 _ 3 _ 4 _ 5 _ 6 _ 7
		stage 2:  _ _ 0 1 _ _ 2 3 _ _ 4 5 _ _ 6 7
		stage 3:  _ _ _ _ 0 1 2 3 _ _ _ _ 4 5 6 7
		stage 4:  _ _ _ _ _ _ _ _ 0 1 2 3 4 5 6 7

		f(0,i) = 2*i
		f(1,i) = 2*i+1
		f(2,i) = if(i %2 == 0) 2*(i)+2
				 if(i % 2==1)  2*(i)+1

		f(3,i) = if(i % 4 == 0) 2*i+4
				 if(i % 4 == 1) 2*i+3	
				 if(i % 4 == 2) 2*i+2
				 if(i % 4 == 3) 2*i+1	

		f(4,i) = if(i % 8 == 0) 2*i+8
				 if(i % 8 == 1) 2*i+7	
				 if(i % 8 == 2) 2*i+6
				 if(i % 8 == 3) 2*i+5

		f(n,i) = 2*i + (2^(n-1) - i % 2^(n-1))	  calcola l'id del blocco che l'elemento i deve computare allo stage n
			con f(0,i) = 2*i
			e   f(1,i) = 2*i+1
	 */
	
	unsigned long blockId;
	unsigned long two_power_stage = 1;

	if(stage == 0)
		return (2*threadId) * dim_partition;
	if(stage == 1)
		return (2*threadId+1) * dim_partition;
	
	stage--;
	two_power_stage <<= stage;

	blockId = (2*threadId + two_power_stage - (threadId % two_power_stage));

	if(blockId >= num_of_partitions) /* if the number of threads is not a power of 2, we'll go in overflow  ((unsigned) -1 is the biggest index)*/
		return -1;

	return  blockId * dim_partition;
}


/*
	Determine the ending index of the authority interval of thread threadId at step stage
*/
unsigned long computeLast(unsigned long stage, int threadId, unsigned long dim, unsigned long num_of_threads, unsigned long num_of_partitions, unsigned long dim_partition){
	unsigned long blockId;
	unsigned long two_power_stage = 1;

	if(stage == 0)
		return ((2*threadId) * dim_partition) + dim_partition-1;
	if(stage == 1){
		if(threadId == num_of_threads-1)
			return dim-1;
		return ((2*threadId+1) * dim_partition) + dim_partition-1;
	}

	stage--;
	two_power_stage <<= stage;

	blockId = (2*threadId + two_power_stage - (threadId % two_power_stage));

	if(blockId == 2*num_of_threads-1) /* if it is the last block, computeLast return the last element of the array (the last block can be bigger than others)*/
		return dim-1;

	return ( blockId * dim_partition) + dim_partition-1;

	

}


/*
	get the value needed at step stage by thread threadId to compute the cummutative and associative function
 */
float getInitialValue(unsigned long stage,int threadId, float* Vector, unsigned long dim, unsigned long num_of_partitions, unsigned long dim_partition,unsigned long num_of_threads){
	/*
		stage 0:  0 _ 1 _ 2 _ 3 _ 4 _ 5 _ 6 _ 7 _
		stage 1:  _ 0 _ 1 _ 2 _ 3 _ 4 _ 5 _ 6 _ 7
		stage 2:  _ _ 0 1 _ _ 2 3 _ _ 4 5 _ _ 6 7
		stage 3:  _ _ _ _ 0 1 2 3 _ _ _ _ 4 5 6 7
		stage 4:  _ _ _ _ _ _ _ _ 0 1 2 3 4 5 6 7
		stage 5:  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 0 1 2 3 4 5 6 7

		
		f(0,i) = 0.0
		f(1,i) = V[ computeLast(0,i) ]
		f(2,i) = if( i % 2 == 0) V[ computeLast(1,i) ]			base + 0
		         if( i % 2 == 1) V[ computeLast(1,i-1)]
		         
		f(3,i) = if( i % 4 == 0) V[ computeLast(2,i+1) ]		base +1
		         if( i % 4 == 1) V[ computeLast(2,i)]
		         if( i % 4 == 2) V[ computeLast(2,i-1)]
		         if( i % 4 == 3) V[ computeLast(2,i-2)]

		f(4,i) = if( i % 8 == 0) V[ computeLast(3,i+3) ]		base + 3
		         if( i % 8 == 1) V[ computeLast(3,i+2)]
		         if( i % 8 == 2) V[ computeLast(3,i+1)]
		         if( i % 8 == 3) V[ computeLast(3,i)]
		         if( i % 8 == 4) V[ computeLast(3,i-1)]
		         if( i % 8 == 5) V[ computeLast(3,i-2)]
		         if( i % 8 == 6) V[ computeLast(3,i-3)]
		         if( i % 8 == 7) V[ computeLast(3,i-4)]

		f(5,i) = if( i % 16 == 0) V[ computeLast(4,i+7) ]		base + 7
		         if( i % 16 == 1) V[ computeLast(4,i+6)]
		         if( i % 16 == 2) V[ computeLast(4,i+5)]
		         if( i % 16 == 3) V[ computeLast(4,i+4)]
		         if( i % 16 == 4) V[ computeLast(4,i+3)]
		         if( i % 16 == 5) V[ computeLast(4,i+2)]
		         if( i % 16 == 6) V[ computeLast(4,i+1)]
		         if( i % 16 == 7) V[ computeLast(4,i)]

		f(n,i) = V[ computeLast(n-1, i - (i%2^(n-1)) + (2^(n-2)-1 )) ]   

		         
		

	*/
	unsigned long index,two_power_stage_minus_one,two_power_stage_minus_two=1;
	

	if(stage == 0)	
		return 0.0;

	if(stage == 1){

		index = computeLast(stage-1,threadId,dim,num_of_threads,num_of_partitions,dim_partition); 
	}
	else{
		two_power_stage_minus_two <<= stage-2;
		two_power_stage_minus_one = two_power_stage_minus_two << 1;

		index = computeLast(stage-1, threadId - (threadId%two_power_stage_minus_one) + (two_power_stage_minus_two-1 )        ,dim,num_of_threads,num_of_partitions,dim_partition);
	}

	if(index >= 0 && index < num_of_partitions*dim_partition)
		return Vector[index];
	return 0.0;
}

void* worker(void* par){
	unsigned long i, stage;
	unsigned long first,last;
	float initialValue;

	/* setting worker parameters  and  copying the global parameters in the stack of the worker */
	int id = *((int*)par);
	unsigned long t_dim = dim, t_num_of_threads = num_of_threads, t_num_of_partitions = num_of_partitions;
	unsigned long t_dim_partitions=t_dim/t_num_of_partitions;
	int t_typeFunc = typeFunc;
	float *t_Vector = Vector;

	unsigned long *t_threadsCompleted = (unsigned long *) threadsCompleted; /* not volatile because here we do not need to read values from other threads */
	

	/* set affinity only on the first 60 threads */
/*	cpu_set_t mask;
	CPU_ZERO(&mask);
	CPU_SET((id*4)+1, &mask);
	if(id<60)
	if(sched_setaffinity(0, sizeof(mask), &mask))
		perror("ERRORE setaffinity");
*/

	/* find the authority interval */
	first = computeFirst(0,id,  t_num_of_partitions,t_dim_partitions);
	last =  computeLast(0,id,  t_dim,t_num_of_threads,t_num_of_partitions,t_dim_partitions);
	
	/*if(last < first){
		printf("WARNING: thread %i has an empty partition\n",id);
	}*/

	stage = 0; 
	while(stage != -1){

		/* retrieve the value needed to compute step stage */
		initialValue = getInitialValue(stage,id,t_Vector,t_dim,t_num_of_partitions,t_dim_partitions,t_num_of_threads);

		if(test == 2)
			printf("thread %i, stage %li, first=%li, last = %li, initVal = %f\n",id,stage,first, last, initialValue);
	
		if(last != -1){   /*  if needed because of last is typed UNSIGNED ( last can be -1 becouse of the formula, and (unsigned -1) is bigger than first in the second nested if) */
			
			/* the first 2 steps are an initialization phase. they need a specific code */
			if(stage < 2){
				
				if(first <= last){
					if(t_typeFunc == 0)
						t_Vector[first] = g(t_Vector[first], initialValue);
					else if(t_typeFunc == 1)
						t_Vector[first] = f(t_Vector[first],initialValue,10);
					else if(t_typeFunc == 2)
						t_Vector[first] = f(t_Vector[first],initialValue,100);
				}

				
				for(i = first+1; i <= last; i++){
					
					if(t_typeFunc == 0)
						t_Vector[i] = g(t_Vector[i], t_Vector[i-1]);
					else if(t_typeFunc == 1)
						t_Vector[i] = f(t_Vector[i],t_Vector[i-1],10);
					else if(t_typeFunc == 2)
						t_Vector[i] = f(t_Vector[i],t_Vector[i-1],100);
				}
			}
			
			else {
				register float initVal = initialValue;

				/* in the other steps we only need to add the initialValue */
				for(i = first; i <= last; i++){
					
					if(t_typeFunc == 0)
						t_Vector[i] = g(t_Vector[i], initVal);
					else if(t_typeFunc == 1)
						t_Vector[i] = f(t_Vector[i],initVal,10);
					else if(t_typeFunc == 2)
						t_Vector[i] = f(t_Vector[i],initVal,100);
				}
			}
		}
	

		/* MESSAGE "Stage Completed" ( shared var ) */
		t_threadsCompleted[id] = stage;
		

		/* UPDATE parameters for next stage, before waiting all threads */
		first = computeFirst(stage+1,id,t_num_of_partitions,t_dim_partitions);   
		last = computeLast(stage+1,id,t_dim,t_num_of_threads,t_num_of_partitions,t_dim_partitions);


		/* WAITING master */
		while(stage == newStage); /* synch */
		stage=newStage;

	}
	
	return NULL;
}
