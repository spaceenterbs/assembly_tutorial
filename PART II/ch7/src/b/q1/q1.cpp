#define BLOCK_SIZE  10

void Test()
{
	char rfileName[]="q1.cpp";
	char wfileName[]="q1.cpp.out";
	DWORD dwBytesWritten;
	DWORD dwNumberOfBytes;	
	char Buffer[BLOCK_SIZE+1];
	DWORD hrFile,hwFile;
	
	
	hrFile = CreateFile(rfileName,               // file name 
                       GENERIC_READ,          // open for reading 
                       0,                     // do not share 
                       NULL,                  // default security 
                       OPEN_EXISTING, // 3
                       FILE_ATTRIBUTE_NORMAL, // normal file 
                       NULL);                 // no template 
	
    hwFile = CreateFile(wfileName,               // file name 
                       GENERIC_WRITE,          // open for reading 
                       0,                     // do not share 
                       NULL,                  // default security 
                       CREATE_NEW,          // Creates a new file
                       FILE_ATTRIBUTE_NORMAL, // normal file 
                       NULL);                 // no template 
    while(1)
	{
			BOOL re;
			
	        re= ReadFile(hrFile,
					   Buffer,
					   BLOCK_SIZE,
					   &dwNumberOfBytes,
					   NULL);
			
			if( re && dwNumberOfBytes ==0)
			{
				break;
			}
			
			WriteFile( 
                    hwFile,           // open file handle
                    Buffer,      // start of data to write
                    dwNumberOfBytes,  // number of bytes to write
                    &dwBytesWritten, // number of bytes that were written
                    NULL);            // no overlapped structure
	
	
	
	}
	
	CloseHandle(hwFile);
	CloseHandle(hrFile);
}