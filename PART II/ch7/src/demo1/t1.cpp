void Test()
{
	char caption[] = "My App";
	char msg[] = "Hello, world";
	
    int reval = MessageBoxA(
        NULL,
        caption,
        msg,
        MB_OK | MB_ICONINFORMATION
    );

    
}