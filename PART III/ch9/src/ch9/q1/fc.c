#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>

int main()
{	
	char buf;
	int sourcefile,destfile,n;
	
	wrie(1,"start file copy",15);
	
	sourcefile=open("fc.c",O_RDONLY);
	destfile=open("fc.c_new.c",O_CREAT | O_WRONLY ,0666);
	
	
	while(1)
	{
		n=read(sourcefile,&buf,1);
		if( 0 == n ) break;
		write(destfile,&buf,1);
	}
	
	
	close(destfile);
	close(sourcefile);	
	
	write(1,"end file copy",13);
	
	return 0;
}
