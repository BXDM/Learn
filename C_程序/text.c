#include<stdio.h>
int main()
{
    int i,j,k,n,x,a[100][100];
    a[0][1]=1;
    scanf("%d",&x);
    for(i=1;i<=x;i++)
    {
        for(j=1;j<=i;j++)
        {
            a[i][j]=a[i-1][j-1]+a[i-1][j];
            printf("%5d ",a[i][j]);//%5d  ��ʾ�Ҷ����5���ո�
        }//ͬ��%-5d  ��ʾ������5���ո�
        printf("\n");
    }
    return 0;
}
/*--------------------- 
���ߣ�beyond���� 
��Դ��CSDN 
ԭ�ģ�https://blog.csdn.net/qq_41264055/article/details/80274297 
��Ȩ����������Ϊ����ԭ�����£�ת���븽�ϲ������ӣ�*/