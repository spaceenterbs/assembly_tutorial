void Test()
{
	char fileName[]="my.txt";
		
    hFile = CreateFile(fileName,               // file name 
                       GENERIC_WRITE,          // open for writing 
                       0,                     // do not share 
                       NULL,                  // default security 
                       CREATE_NEW,   // Creates a new file, only if it does not already exist. 
                       FILE_ATTRIBUTE_NORMAL, // normal file 
                       NULL);                 // no template 
    if (hFile == INVALID_HANDLE_VALUE) 
    { 
        PrintError(TEXT("Error"));        
    } 
	
	CloseHandle(hFile);
}