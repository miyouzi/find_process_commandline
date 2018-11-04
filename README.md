# find_process_commandline
查询进程命令参数，可用于查询何种程序后台调用了 Windows Install 安装软件等。
## 使用
推荐放入PATH中，Win+R输入```pcmd (部分)进程名```回车，需要管理员权限，会自动尝试提权，默认查询所有以第一参数开头的进程的commandline信息。

如果需要查询所有包含关键字的进程，则传入任意字符第二参数即可。
## 举例
```
pcmd tim
pcmd tim all
```
