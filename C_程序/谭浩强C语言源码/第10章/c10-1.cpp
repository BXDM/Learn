#include <stdlib.H>
//#include <stdio.h>
#include <stdio.H>
int main()
  {FILE *fp;
   char ch,filename[10];
   printf("���������õ��ļ�����");
   scanf("%s",filename);
   if((fp=fopen(filename,"w"))==NULL)       // ������ļ���ʹfpָ����ļ� 
	  {
       printf("�޷��򿪴��ļ�\n");          // �����ʱ���������"�򲻿�"����Ϣ  
       exit(0);                             // ��ֹ����*/
       }
   ch=getchar( );                           // ������ִ��scanf���ʱ�������Ļس���  
   printf("������һ��׼���洢�����̵��ַ���(��#����)��\n");
   ch=getchar( );                           // ���մӼ�������ĵ�һ���ַ� 
   while(ch!='#')                           // ������'#'ʱ����ѭ��  
	{
	  fputc(ch,fp);                         // ������ļ����һ���ַ�  
     // putchar(ch);                          // ��������ַ���ʾ����Ļ��  
	  ch=getchar();                         // �ٽ��մӼ��������һ���ַ�  

	 }

 //  printf("bsize=%d",fp->bsize);
   
   fclose(fp);                              // �ر��ļ�  
   putchar(10);                             // ����Ļ���һ�����з������з���ASCII����Ϊ10 
   return 0;
  }
