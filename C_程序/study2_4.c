//���ú����Ƚ��������Ĵ�С 
//��7.2,p176
#include<stdio.h>
int main()
{
	int max(int x,int y);
	int a,b,c;
	printf("please input two numbers:\n");
	scanf("%d %d",&a,&b);
	c = max(a,b);	//ʵ��ʵ�ֺ�����ֵ 
	printf("max is %d\n",c);
	return 0;
}
int max(int x,int y)
{
	int z;
	z = x>y?x:y;
	return (z);
}
