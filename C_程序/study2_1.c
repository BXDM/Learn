//ʹ������ͳ��ѧ���ɼ�

#include<stdio.h>
#define MAX 50		//����MAXΪ���� 
int main()
{
	int i,num;
	int Chinese[MAX],Math[MAX],English[MAX];
	long studentID[MAX];
	float average[MAX];		//����ƽ����ΪС������������ 
	printf("please input the number of student\n");
	scanf("%d",num);
	printf("please input a student ID and three score:\n");
	printf("studentID  Chinese		Math		entglis ");
	for(i = 0;i<num;i++)			//for�Ĳ�������";"�ָ� 
	{
		printf("No.%d>",i+1);
		scanf("%ld%d%d%d", &studentID[i],&Chinese[i],&Math[i],&English[i]);		//?????????
		average[i] = (float)(Chinese[i]+Math[i]+English[i])/3;
	}
	puts("\nstudentNum		Chinese		English		average");
	for(i = 0;i<num;i++)
	{
		printf("%8ld %8d %8d %8d.2f\n",studentID[i],&Chinese[i],&Math[i],&English[i]);
	}
	return 0;
}
