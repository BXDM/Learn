#include<iostream>
#include<fstream>
#include<string>
using namespace std;
int main()
{
	string temp;
	string content("");
	string outcontent("");
	//�ļ��������ļ������ݶ�����
	ifstream fin("D:\\test.txt");
	if(!fin)
	{
		cout<<"open error1!"<<endl;
		return 0;
	}
	//�ļ����ݱ��浽outcontent��
	while (getline(fin,temp))
	{
		int i = temp.length();
		for (--i;i>=0;i--)
		{
			outcontent+=temp[i];
		}
		outcontent+='\n';
	}
	fin.close();

	//�ļ�д��������д���ļ���
	ofstream fout("D:\\test.txt");
	if(!fout)
	{
		cout<<"open error2!"<<endl;
		return 0;
	}
	size_t i = outcontent.length();
	for(size_t j =0;j<i;j++)
	{
		fout<<outcontent[j];
	}
	fout.close();
	return 0;
}
