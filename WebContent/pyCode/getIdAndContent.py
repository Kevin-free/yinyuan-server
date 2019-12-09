#-*- coding:utf-8 -*-

#Python单引号和双引号都能用来定义字符串，哪个方便用哪个。

from Crypto.Cipher import AES
from wordcloud import WordCloud
#需加入下面两句话，不然会报错：matplotlib: RuntimeError: Python is not installed as a framework
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
import base64
import requests
import json
import codecs
import time
import jieba
#python2 Unicode加sys
import  sys
import io

reload(sys)
sys.setdefaultencoding( "utf-8" )
type = sys.getfilesystemencoding()

headers = {
    'Host':'music.163.com',
    'Origin':'https://music.163.com',
    'Referer':'https://music.163.com/song?id=28793052',
    'User-Agent':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'
}

#除了第一个参数，其他参数为固定参数，可以直接套用
# offset的取值为:(评论页数-1)*20,total第一页为true，其余页为false
# 第一个参数
# first_param = '{rid:"", offset:"0", total:"true", limit:"20", csrf_token:""}'
# 第二个参数
second_param = "010001"
# 第三个参数
third_param = "00e0b509f6259df8642dbc35662901477df22677ec152b5ff68ace615bb7b725152b3ab17a876aea8a5aa76d2e417629ec4ee341f56135fccf695280104e0312ecbda92557c93870114af6c9d05c4f7f0c3685b7a46bee255932575cce10b424d813cfe4875d3e82047b97ddef52741d546b8e289dc6935b3ece0462db0a22b8e7"
# 第四个参数
forth_param = "0CoJUm6Qyw8W8jud"

# 获取参数
def get_params(page): # page为传入页数
    iv = "0102030405060708"
    first_key = forth_param
    second_key = 16 * 'F'
    if(page == 1): # 如果为第一页
        first_param = '{rid:"", offset:"0", total:"true", limit:"20", csrf_token:""}'
        h_encText = AES_encrypt(first_param, first_key, iv)
    else:
        offset = str((page-1)*20)
        first_param = '{rid:"", offset:"%s", total:"%s", limit:"20", csrf_token:""}' %(offset,'false')
        h_encText = AES_encrypt(first_param, first_key, iv)
    h_encText = AES_encrypt(h_encText, second_key, iv)
    return h_encText

# 获取 encSecKey
def get_encSecKey():
    encSecKey = "257348aecb5e556c066de214e531faadd1c55d814f9be95fd06d6bff9f4c7a41f831f6394d5a3fd2e3881736d94a02ca919d952872e7d0a50ebfa1769a7a62d512f5f1ca21aec60bc3819a9c3ffca5eca9a0dba6d6f7249b06f5965ecfff3695b54e1c28f3f624750ed39e7de08fc8493242e26dbc4484a01c76f739e135637c"
    return encSecKey


# 解密过程
def AES_encrypt(text, key, iv):
    pad = 16 - len(text) % 16
    text = text + pad * chr(pad)
    encryptor = AES.new(key, AES.MODE_CBC, iv)
    encrypt_text = encryptor.encrypt(text)
    encrypt_text = base64.b64encode(encrypt_text)
    encrypt_text = str(encrypt_text).encode("utf-8")#改动 #注意一定要加上这一句，没有这一句则出现错误
    return encrypt_text

# 获得评论json数据
def get_json(url, params, encSecKey):
    data = {
         "params": params,
         "encSecKey": encSecKey
    }
    response = requests.post(url, headers=headers, data=data)
    # print(response.content)
    return response.content

# 抓取某一首歌的前100页评论
def get_all_comments(url,page):
    all_comments_list = [] # 存放所有评论
    for i in range(page):  # 逐页抓取
        params = get_params(i+1)
        encSecKey = get_encSecKey()
        json_text = get_json(url,params,encSecKey)
        json_dict = json.loads(json_text)
        for item in json_dict['hotComments']:  #改为hot热评
            # print("item:",item)
            comment = item['content'] # 评论内容
            commentId = item['commentId'] # 评论id
            # print("commentId:",commentId)
            commentData = {"commentId":commentId,"content":comment}
            json_commentData = json.dumps(commentData, encoding="utf-8", ensure_ascii=False)  # deal format and coding
            # print json_commentData
            # print comment
            comment_info = str(comment)

            # print("comment_info:", comment_info)
            all_comments_list.append(commentData)
        print('the %d page done!' % (i+1))
        #time.sleep(random.choice(range(1,3)))  #爬取过快的话，设置休眠时间，跑慢点，减轻服务器负担
    return all_comments_list #对象数组

#生成词云
def wordcloud(all_comments,songId):
    # print all_comments
    json_commentData = json.dumps(all_comments, encoding="utf-8", ensure_ascii=False)  # deal format and coding
    # print "json_commentData:"+json_commentData
    # print("all_comments", all_comments)
    # 对句子进行分词，加载停用词
    # 打开和保存文件时记得加encoding='utf-8'编码，不然会报错。
    def seg_sentence(sentence):
        # print("sentence:",sentence)  #即outputs取出的每行
        sentence_seged = jieba.cut(sentence.strip(), cut_all=False)  # 精确模式
        stopwords = [line.strip() for line in io.open('E:\Py_spide_ass\stopwords.txt', 'r', encoding='utf-8').readlines()]  # 这里加载停用词的路径
        outstr = ''
        for word in sentence_seged:
            if word not in stopwords:
                if word != '\t':
                    outstr += word
                    outstr += " "
        # print outstr
        # print type(outstr)
        return outstr
    comments_list = []
    for contentObj in all_comments:
        comment = contentObj['content']
        commentId = contentObj['commentId']
        comment_info = str(comment)
        comments_list.append(comment_info)
    # print comments_list
    # print("all_comments['content']:",all_comments['content'])
    for line in comments_list:
        # print("line:", line)
        line_seg = seg_sentence(line)  # 这里的返回值是字符串
        # print("line_seg:", line_seg) #因为储存是u8，这样输出会是u8
        # print "line_seg:"+line_seg #这样输出不会是u8，中文正常
        #修改输出路径为 加歌曲id.txt
        with io.open('E:/Py_spide_ass/comments/outputs'+str(songId)+'.txt', 'a', encoding='utf-8') as f:
            f.write(u'{}\n'.format(line_seg + '\n')) #写入outputs时加上对应的commentId 没有文件夹需要先建

    data = io.open('E:/Py_spide_ass/comments/outputs'+str(songId)+'.txt', 'r', encoding='utf-8').read()
    my_wordcloud = WordCloud(
        background_color='white',  #设置背景颜色
        max_words=200,  #设置最大实现的字数
        # font_path=r'SimHei.ttf',  #设置字体格式，如不设置显示不了中文
    ).generate(data)  #整体返回为list  list中的为tuple元组（不可修改）
    feel_list = []
    for tuple_wc,contentObj in zip(my_wordcloud,all_comments): #对返回的词云信息做处理
        list_wc = list(tuple_wc)
        list_wc.pop()
        list_wc.insert(0,contentObj['commentId']) #将commentId插入
        feel_list.append(list_wc)
        json_list_wc = json.dumps(list_wc, encoding="utf-8", ensure_ascii=False)  # deal format and coding
        # print json_list_wc
    json_feel_list = json.dumps(feel_list, encoding="utf-8", ensure_ascii=False)  # deal format and coding
    print json_feel_list #返回需要的[commentId,content]

    # json_frequencies = json.dumps(my_wordcloud, encoding="utf-8", ensure_ascii=False)  # deal format and coding
    # print "my_wordcloud:"+json_frequencies # the data is sortByFreque

    # print "my_wordcloud:"+my_wordcloud #返回词云按频率排序的data
    # plt.figure()
    # plt.imshow(my_wordcloud)
    # plt.axis('off')
    # plt.show()  # 展示词云

def main(songId):
    print("start")
    start_time = time.time()  # 开始时间

    url = "https://music.163.com/weapi/v1/resource/comments/R_SO_4_"+str(songId)+"?csrf_token="  # 替换为你想下载的歌曲R_SO的链接
    all_comments = get_all_comments(url, page=1)  # 需要爬取的页面数
    wordcloud(all_comments,songId)
    # end_time = time.time()  # 结束时间
    # print('pro spend time %f sec.' % (end_time - start_time)) #主因是print（）中不能有中文，否则cmd运行出错，即java运行出错
    # return "success" #return "success" 后java可以运行

main(sys.argv[1])
# main(461347998)
# if __name__ == '__main__':
#     print "hello jp"
#     main()