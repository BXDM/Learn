#include<stdio.h>
main()
{
	int i,j,x=1,y=3,a[6][6]={0};					/*因为数组下标要用1到5，所以数组长度是6*/
	for(i=1;i<=25;i++)
	{
		a[x][y] =i;							/*将1到25所有数存到数组相应位置*/
		if(x==1&&y==5)
		{
			x=x+1;							/*当上一个数是第1行第五列时，下一个数放在它的下一行*/
			continue;							/*结束本次循环*/
		}
		if(x==1)								/*当上一个数是是第1行时，则下一个数行数是5*/
			x=5;
		else
			x--;								/*否则行数减1*/
		if(y==5)								/*当上一个数列数是第5列时，则下一个数列数是1*/
			y=1;
		else
			y++;								/*否则列数加1*/
		if(a[x][y]!=0)							/*判断经过上面步骤确定的位置上是否有非零数*/
		{
			x=x+2;							/*表达式为真则行数加2列数减1*/
			y=y-1;
		}
	}
	for(i=1;i<=5;i++)							/*将二维数组输出*/
	{
		for(j=1;j<=5;j++)
		{
			printf("%4d",a[i][j]);
		}
		printf("\n");							/*每输出一行回车*/
	}
	return 0;
}
