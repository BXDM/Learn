�//ÓÃwhile¼ÆËãÊäÈëÊý×ÖµÄ½×³Ë
//±±ÏïµÄÃ¨ 2018.12.22
#include<stdio.h>
void main()
{
	float fac=1;	//¶¨Òå×îÖÕÔËËã½á¹ûÎª¸¡µãÐÍ
	int i = 1,n;
	printf("please inpute a nimber >=0\n");
	scanf("%d",&n);
	if(n == 0 || n == 1){
		printf("factorial is %d\n",1);
		return 0;	//º¯Êýµ½´Ë½áÊø£¬²¢·µ»Øº¯ÊýÖµ 0
	}
	while(n > 0){
		fac = fac*n;
		n--;
	}
	printf("factorial is %.2f\n",fac);	//	.2f ±íÊ¾Êä³öµÄÎ»ÊýÎª2Îª£¬ÆäÖÐµÄ . ²»ÄÜÊ¡ÂÔ
}

/*¸ü¸Ä·½°¸£ºÓÃ n ²Î¼Ó¼ÆËã£¬Ã¿´ÎÊÇµÄ n µÄÖµ¼õÐ¡ 1*/