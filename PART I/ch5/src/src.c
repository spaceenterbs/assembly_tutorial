
int main()
{
	int a;
	int sum;
	
	a=input();
	sum = Myf(a);
	print(sum);
	
	return 0;
}
int Myf(int a)
{
	if(1==a) return a;
	
	return a*Myf(a-1);	
}