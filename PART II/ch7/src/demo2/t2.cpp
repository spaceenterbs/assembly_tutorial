void Test()
{
	char fileName[]="my.txt";
	char msg[]="I love you";
	DWORD dwBytesWritten;
	BOOL bErrorFlag
		
    hFile = CreateFile(fileName,               // file name 
                       GENERIC_WRITE,          // open for reading 
                       0,                     // do not share 
                       NULL,                  // default security 
                       CREATE_NEW, // Creates a new file, only if it does not already exist. 
                       FILE_ATTRIBUTE_NORMAL, // normal file 
                       NULL);                 // no template 
    if (hFile == INVALID_HANDLE_VALUE) 
    { 
        PrintError(TEXT("Error"));        
    } 
	
		
	bErrorFlag = WriteFile( 
                    hFile,           // open file handle
                    msg,      // start of data to write
                    10,  // number of bytes to write
                    &dwBytesWritten, // number of bytes that were written
                    NULL);            // no overlapped structure
	
	CloseHandle(hFile);
}