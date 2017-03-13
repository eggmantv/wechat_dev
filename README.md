# 项目介绍

微信开发课程，蛋人网课件 https://eggman.tv

实现功能:

- 微信开发环境搭建
- 微信账号配置和测试账号开发
- 用户授权与用户信息获取
- 微信账号与本地账号绑定, 自动登录
- 自定义菜单
- 消息自动回复
- JS-SDK
- 微信支付

技术:

- Rails 5.0.2
- Ruby 2.3.0
- Grape 0.19.1
- MySQL 5.x

## 课程说明

为了方便在每节课的代码间进行切换，该课程是通过git tag的方式来组织的，就是每节课对应一个git tag。

首先clone该项目

```shell
$git clone git@github.com:eggmantv/wechat_dev.git
```

切换tag
```shell
$cd wechat_dev

查看所有标签
$git tag
01
02
...

切换到第一节课的源码
$git checkout 01
