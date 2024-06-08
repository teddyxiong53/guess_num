# guess_num
基于skynet的猜数字游戏

## 编译skynet

在当前目录下下载skynet并编译。

```
git clone https://github.com/cloudwu/skynet.git
cd skynet
make 'PLATFORM' # PLATFORM can be linux, macosx, freebsd now
```

我是在macos上做的测试。

## 测试方法

启动服务端

```
teddy@teddydeMBP work % ./skynet/skynet config 
[:00000002] LAUNCH snlua bootstrap
[:00000003] LAUNCH snlua launcher
[:00000004] LAUNCH snlua cdummy
[:00000005] LAUNCH harbor 0 4
[:00000006] LAUNCH snlua datacenterd
[:00000007] LAUNCH snlua service_mgr
[:00000008] LAUNCH snlua main
[:00000009] LAUNCH snlua redis
[:0000000a] LAUNCH snlua hall
[:00000002] KILL self
[:0000000b] LAUNCH snlua agent 3 127.0.0.1:57351
recv a connection:	3	127.0.0.1:57351
[:0000000c] LAUNCH snlua agent 4 127.0.0.1:57393
recv a connection:	4	127.0.0.1:57393
[:0000000d] LAUNCH snlua agent 5 127.0.0.1:57399
recv a connection:	5	127.0.0.1:57399
[:0000000e] LAUNCH snlua room
[:0000000e] KILL self
```

用户aa

```
teddy@teddydeMBP work % netcat localhost 8888
login aa 123
请准备开始游戏。。。
ready
等待其他玩家加入
房间:14 系统已经随机一个数字
请玩家cc开始猜数字
cc输入的数字太小，范围变为 [41 - 100], 接下来由 aa 来操作
guess 80
aa输入的数字太大，范围变为 [41 - 79], 接下来由 bb 来操作
bb输入的数字太大，范围变为 [41 - 65], 接下来由 cc 来操作
cc输入的数字太大，范围变为 [41 - 49], 接下来由 aa 来操作
guess 45
aa输入的数字太小，范围变为 [46 - 49], 接下来由 bb 来操作
bb输入的数字太大，范围变为 [46 - 47], 接下来由 cc 来操作
游戏结束，cc猜中了数字46，输了
离开房间
```

用户bb

```
teddy@teddydeMBP work % netcat localhost 8888
login bb 123
请准备开始游戏。。。
ready
等待其他玩家加入
房间:14 系统已经随机一个数字
请玩家cc开始猜数字
cc输入的数字太小，范围变为 [41 - 100], 接下来由 aa 来操作
aa输入的数字太大，范围变为 [41 - 79], 接下来由 bb 来操作
guess 66
bb输入的数字太大，范围变为 [41 - 65], 接下来由 cc 来操作
cc输入的数字太大，范围变为 [41 - 49], 接下来由 aa 来操作
aa输入的数字太小，范围变为 [46 - 49], 接下来由 bb 来操作
guess 48
bb输入的数字太大，范围变为 [46 - 47], 接下来由 cc 来操作
游戏结束，cc猜中了数字46，输了
离开房间
```

用户cc

```
teddy@teddydeMBP work % netcat localhost 8888
login cc 123
请准备开始游戏。。。
ready
房间:14 系统已经随机一个数字
请玩家cc开始猜数字
20
20 该命令不存在
*规则*:猜数字游戏，由系统随机1-100数字，猜中输，未猜中赢。
help: 显示所有可输入的命令;
login: 登陆，需要输入用户名和密码;
ready: 准备，加入游戏队列，满员自动开始游戏;
guess: 猜数字，只能猜1~100之间的数字;
quit: 退出
guess 40
cc输入的数字太小，范围变为 [41 - 100], 接下来由 aa 来操作
aa输入的数字太大，范围变为 [41 - 79], 接下来由 bb 来操作
bb输入的数字太大，范围变为 [41 - 65], 接下来由 cc 来操作
guess 50
cc输入的数字太大，范围变为 [41 - 49], 接下来由 aa 来操作
aa输入的数字太小，范围变为 [46 - 49], 接下来由 bb 来操作
bb输入的数字太大，范围变为 [46 - 47], 接下来由 cc 来操作
guess 46
游戏结束，cc猜中了数字46，输了
离开房间
```

