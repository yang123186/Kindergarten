i学童家长端 iOS版
=====================================


## 界面编写规范：
界面布局使用代码编写，禁止StoryBoard与Xib界面.布局建议使用autoLayout,frame布局再在工程完工前必须全部转换成autoLayout布局.
布局可使用系统自带 NSLayoutConstraint ,或 Masonry. 推荐使用Masonry,代码长度与可读性高于NSLayoutConstraint.
界面复杂程度过高时，controller的view必须单独在一个viewController中实现，主体controller主要实现代理和功能的实现.主体controller强持有viewController,通过传递自身给负责view的viewcontroller，viewcontroller弱持有主体controller,以此实现界面与功能分离.具体例子可查看personalController.(Notice:viewController父类必须为NSObject,使其轻量化运行).

## 命名规范：
命名规范遵循Objective-C默认驼峰式命名规范.
类，变量，方法命名必须严格遵守Obective-C命名规范，如初始化方法必须init开头，存取器必须set/get开头.变量，方法首字母小写，类首字母大写等等。详细规范请自行百度。

文件命名规范请以文件内对应内容实现按实际情况命名，存文件夹时，controller相关在controller文件夹下简历响应controller名字目录存入（包括viewController一起随主Controller存入对应文件夹），view请根据情况存入view文件夹或当前controller文件夹（如果确定这个view只有这个controller才会用到）.

## 第三方库：
必须使用cocoaPod管理第三方库，包括添加，删除，更新等所有涉及第三方库的操作.
除常用著名第三方库：AFNetworking,Masonry,MBProcessHUD等，其余库建议全部自己手写.

## 其他事项
为保证可维护性，所有类必须封装，具有特定功能的可重用的代码必须封装.