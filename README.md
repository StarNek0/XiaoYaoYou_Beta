# 这是逍遥游的简易示例版本

## -- 环境

    Python 2.7.13  
    Django 1.10.16  
...


## -- 生产环境搭建与运行

1.下载python2.7.13 

2.环境变量中检查Path，没有就添加Python27的路径，与Scripts路径（如C:\Python27\Scripts） 

3.重启 

4.命令行->保持在与requirement.txt同一目录下->输入命令pip install -r requirement.txt 

5.等待安装完成

6.在Python27\Lib\site-packages下添加一个名为sitecustomize.py的文件，内容如下:

    # encoding=utf8  
    import sys  

    reload(sys)  
    sys.setdefaultencoding('utf8') 

7.修改项目名为Quickly_Page, 在settings.py中的DATABASE={}中需要对数据库连接配置进行相应的更改 

8.命令行->保持在与manage.py同一目录下->输入命令python manage.py runserver  

9.网址输入 http://localhost:8000/city_around/1  

## -- 数据库

数据正在制作中，一周内制作完毕
