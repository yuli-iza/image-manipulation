#include <stdio.h>
#include <stdlib.h>

//main function to allocated memory and print/output new/changed values
int main(int argc, char *argv[]){
int *arrayPtr = (int*)malloc((argc - 1) * sizeof(int));
	//allocate memory for the values/pixels of the image provided
	for(int i = 1; i < argc; i++){
		arrayPtr[i-1] = atoi(argv[i]);
	}

	for(int i = 0; i < argc - 1; i++){
	//If arrayPtr i.e. pixel color value is larger than the 170 threshhold than print 255 valueelse print 0, this will be written to the 'c_output.txt' which is accomplished in the python program 'wrapper.py'
		if(arrayPtr[i] > 170){
		arrayPtr[i] = 255;
		printf("%d ", arrayPtr[i]);
		}
		else {
		arrayPtr[i]=0;
		printf("%d ", arrayPtr[i]);
		}
	}
	//free up the allocated memory for arrayPtr from the first for-loop 
	free(arrayPtr);
	return 0;
}
