//�ṹ������ĳ�ʼ���Ͷ���
#include<stdio.h>
int main()
{
	struct student		//�����ṹ������
	{					
		long int num;	//�ṹ��ĳ�Ա
		char name[20];
		char sex;
		char addr[20];
	}a = {10101,"Lilin",'M',"123 Beijin road"};	//����ṹ����� a ����ʼ��
	printf("NO.:%ld\nname:%s\nsex:%c\naddress:%s\n",a.num,a.name,a.sex,a.addr);
	return 0;
}
