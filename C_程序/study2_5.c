//��ָ�뽻��������
#include<stdio.h>
int main()
{
	int a,b;
	printf("please input two numbers:\n");
	scanf("%d %d",&a,&b);
	int *point_a,*point_b,*temp;
	point_a = &a;
	point_b = &b;
	temp = point_a;point_a = point_b;point_b = temp;
	printf("a = %d,b = %d\n",*point_a,*point_b);	//ָ����ָ������� 
	return 0;
}
