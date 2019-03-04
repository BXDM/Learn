#!/usr/bin/env python
"""
Minimal Example
===============

ʹ��Ĭ�ϲ������������ܷ����ɷ��εĴ���
"""

from os import path
from wordcloud import WordCloud

d = path.dirname(__file__)

# ��ȡ�����ı�
text = open(path.join(d, 'constitution.txt')).read()

# ����һ������ͼ��
wordcloud = WordCloud().generate(text)

# matplotlib�ķ�ʽչʾ���ɵĴ���ͼ��
import matplotlib.pyplot as plt
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis("off")

#max_font_size�趨���ɴ����е���������С
#width,height,margin��������ͼƬ����
# generate ���Զ�ȫ���ı������Զ��ִ�,������������֧�ֲ���
wordcloud = WordCloud(max_font_size=66).generate(text)
plt.figure()
plt.imshow(wordcloud, interpolation="bilinear")
plt.axis("off")
plt.show()

# pil��ʽչʾ���ɵĴ���ͼ�������û��matplotlib��
# image = wordcloud.to_image()
# image.show()
