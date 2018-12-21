// JavaScript Document

       // ==UserScript==
// @name AC-��Google Baidu Bing�������������������Զ�����վ
// @namespace BlockKafanTopicinGoogle
// @include /^https?\:\/\/encrypted.google.[^\/]+/
// @include /^https?\:\/\/www.google.[^\/]+/
// @include /^https?\:\/\/www.baidu.[^\/]+/
// @include /^https?\:\/\/[\w]+.bing.[^\/]+/
// @include /^https?\:\/\/www.haosou.com+/
// @include /^https?\:\/\/www.youdao.com/
// @include /^https?:\/\/www.sogou.com/
// @include /^https?:\/\/search.disconnect.me/
// @icon    https://coding.net/u/zb227/p/zbImg/git/raw/master/img0/icon.jpg
// @author       AC
// @version 0.7.0
// @description ��Google Baidu Bing�������������������Զ������վ

// @grant note 2017.4.14 �����ˣ����ݷ�����������chrome�ϵ�MutationObserver�����⣬���ǻ�����DOMinsert����������
// @grant note 2016.2.6 �����ˣ����ݷ������������µ������㣺Disconnect.ME�����㣬������һ���򵥵��������
// @grant note 2015.11.22 �����ˣ��������µ��¼�����MutationObserver�����֮ǰ��������������DOMinsert�¼����������˴�������������������������
// @grant note 2015.11.21 �����ˣ�֮ǰ����͵�������Լ򵥵�д��Щ�󲿷ֹ��ܣ���λ��������������ܵĹ��ܣ�Ӧ�ò�����©��֮���ˣ�������������뼰ʱ��������1353464539@qq.com�����û������Ļ�Ӧ����˵�������һ���ˣ������Ժ����ʧЧ���һ�����޸ĵ�
// @grant note 2015.11.4 �����ˣ��ȸ�ɵ�����������µĿհ�--ע���ȱ�����ǰ���޸�
// @grant note 2015.10.31-4 һ���̶����ٴε����˿��ٵļ��ʣ�ͬʱ���뺯��tryto_del_specificEle(url_d, spec_d, spec_f_d, index_d)������ɾ���˰ٶȵ�����ƹ�
// @grant note 2015.10.31-3 ��������ϲ���������Ҿ�ֱ��д���˲�Ҫwww.kafan.cn���ˣ�֮ǰֻ�����www.kafan.cn/topic
// @grant note 2015.10.31-2 ������(���޸Ĺȸ�ҳ�濨��)���µİٶȿ������,���۵İٶ���ĳ��f13��ǩ������
// @grant note 2015.10.31 ���´���ȸ�ҳ�濨�ٵ����-����Ժͷ���

// ==/UserScript==
//===================================================���������=======================================================
/***���ڸɵ�ĳЩ��������ͨ�����ģ�飬�����Լ����ո�ʽ���**/
//var sepcStr1_USELESS=new Array("��ɾ��Ŀ��URL", "��ɾ����ַ��class", "��ɾ����ַ��Ӧ���տ��class");
var sepcStr1=new Array("rj.baidu.com","c-showurl", "result-op c-container"); //�ٶ�����ƹ�
tryto_del_specificEle(sepcStr1[0], sepcStr1[1], sepcStr1[2], sepcStr1[3]);

//===================================================��ͨ�����������=======================================================
/*
����x����baidu-google-bing-haosou-youdao
������ַ�ĺ���������˼~~��--����ʾ�������е���ַ
*/
var x=new Array(
	"360.cn",
	"mm131.com",
	"jkforum.net",
	"t66y.cc",
	"jav-library.com",
	"jav007.com",
	"javss.com",
	"javmega.net",
	"https://bbs.kafan.cn/",
);

//��ַ�ڵ��������ڵ� �ٶȡ���Ӧ���ȸ衢���ѡ��е�--->���������ܵı�֤�����������
var dir_fatherName = new Array(
"f13", //�ٶ�
"b_attribution", //��Ӧ
"f kv _SWb", //�ȸ�
"res-linkinfo", //����
"result-footer", //�е�
"fb", //�ѹ�
"title"
); 
//��ַ�ڵ�����ո��ڵ�-һһ��Ӧ
var end_fatherName = new Array(
"result c-container ", //�ٶ�
"b_algo", //��Ӧ
"g", //�ȸ�
"res-list", //����
"rnw default", //�е�
"rb", //�ѹ�
"result"
); 
var map={};
initMap();

//===================================================�����=======================================================
document.addEventListener('DOMNodeInserted', blockKafanBaidu, false);

//document.addEventListener('DOMNodeInserted',blockKafanBaidu,false);
function blockKafanBaidu() {
    var isBaidu = (location.href.indexOf('.baidu.com') > -1);
    var isDisConnectMe = (location.href.indexOf('.disconnect.me') > -1);
    var citeList;
    if(isBaidu){
        citeList = document.getElementsByClassName('c-showurl');  //֮ǰȡ����g���������ǩ��google�������ı�ǩ�����¹ȸ�ҳ�濨ס���������ж���baiduվ��
        deal(citeList)
    }else if(isDisConnectMe){
        citeList = document.getElementsByClassName('title');
        deal_DisConnectMe(citeList);
    }else{
        citeList = document.getElementsByTagName('cite');  // �����ļ�������ò�ƶ�����citeΪTAG��
        deal(citeList)
    }
}

// ����nodelist��Ȼ����������У��鿴�Ƿ�һ�£�һ����ɾ��
function deal(citeList){
    for (var index = 0; index < citeList.length; index++) {
        var element = replaceAll(citeList[index].innerHTML);
        if (checkIndexof(element)) {
            var node = citeList[index].parentNode;
            var cur_dir_fatherName = node;
            var II=0;
            if(is_dir_fatherNode(cur_dir_fatherName.className)){
                for(II = 0; II <= 5; II++){
                    node = node.parentNode;
                    console.log(node.className+" kk  "+ map[cur_dir_fatherName.className]);
                    if(isequal(node.className, map[cur_dir_fatherName.className])){
                        break;
                    }
                }
            }
            if(II <= 5)
                node.parentNode.removeChild(node);
        }
    }
}
function deal_DisConnectMe(citeList){
    for (var index = 0; index < citeList.length; index++) {
        var element = replaceAll(citeList[index].href);
        if (checkIndexof(element)) {
            var node = citeList[index].parentNode;
            var cur_dir_fatherName = node;
            var II=0;
            if(is_dir_fatherNode(cur_dir_fatherName.id)){
                for(II = 0; II <= 5; II++){
                    node = node.parentNode;
                    console.log(node.id+" kk  "+ map[cur_dir_fatherName.id]);
                    if(isequal(node.id, map[cur_dir_fatherName.id])){
                        break;
                    }
                }
            }
            if(II <= 5)
                node.parentNode.removeChild(node);
        }
    }
}
// ��ʼ��Map
function initMap(){
    var length = dir_fatherName.length;
    for(var i = 0; i < length; i++){
        var a = dir_fatherName[i];
        var b = end_fatherName[i];
        map[a] = b;
    }
}
// ȷ���Ƿ�Ϊ���սڵ�
function isequal(cur_end, map_end){ 
    if(map_end == cur_end)
        return true;
    return false;
}
// ����Array���ж���ַ���ڵ���Ӧ�������б��е�
function is_dir_fatherNode(node){
    var leng = dir_fatherName.length;
    for(var i = 0; i < leng; i++){
        if(node == dir_fatherName[i]){
            return true;
        }
    }
    return false;
}
/**
url_d ��ɾ���ĵ�ַurl
spec_d ��ɾ���ڵ��Class����
spec_f_d ��ɾ���ڵ���ܵĸ��׽ڵ��Class����
index_d �ڵ㵽���ڵ�Ĳ���
*/
function tryto_del_specificEle(url_d, spec_d, spec_f_d, index_d){
		//alert('ɾ��ing '+spec_d);
		var citeList2 = document.getElementsByClassName(''+spec_d);
		for(var index = 0; index < citeList2.length; index++){
		var ele = replaceAll(citeList2[index].innerHTML);
		if((ele.indexOf(''+url_d)>-1)){
			var node = citeList2[index].parentNode;
			for(var index2 = 0; index2 <= 4; index2++){
				node = node.parentNode;
				//alert(node.className);
				if(node.className == spec_f_d){
						 break;
				}
			}
			if(index2 <= 4)
				node.parentNode.removeChild(node);
		}
	}
}
/*ȥ����ַ�е�<xxx>*/
function replaceAll(sbefore){
	var send;
	send = sbefore.replace(/<[^>]*>/g ,"");
	return send;
}
/*ȷ���ǵ�ǰ���ӵ�һ������*/
function checkIndexof(element){
	var result = (element.indexOf(x[0]) > -1);
	for(var i = 1; i <= x.length; i++){
		//alert("check");
		result = result || (element.indexOf(x[i]) > - 1);
	}
	return result;
}


