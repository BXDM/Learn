//��ָ������һά���鲢ʵ���������
#include<stdio.h>
int main()
{
	 int a[100];
	 int *p = a;
	 printf("please in put some numbers:\n");
	 do {
	 	scanf("%d",p++);
	 }
	while(getchar() != '\n');
	while(--p != a)
		 {
		 	printf("%d ",*p);
		  } 
	 printf("%d\n",*p);
	 return 0;
}
