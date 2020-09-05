# KKPodTest


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements


## Installation

KKPodTest is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'KKPodTest'
```

## Author


![CocoaPods](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/adc8510872ed40d99ecc284159824f10~tplv-k3u1fbpfcp-zoom-1.image)

本文主要是讲解 Pod 库的制作、发布、更新流程，具体的 Pod 原理可以自行搜索，为了方便大家从开始就可以学习到内容，首先可以先下载我本次讲解的 [Pod 库：KKPodTest](https://github.com/GavinKangDeveloper/KKPodTest)，下载后结合看，效率更好，创作不易，欢迎各位大佬 Star 我在 GitHub 中的 Demo ，你随手的举动，也是我创作的动力，谢谢！！ 

本文会在我使用自己 Pod 库的过程中长期更新坑和新技术，欢迎各位大佬一直关注！！

使用 CocoaPods 管理库，首选要有 CocoaPods 账号：
### 1、检查自己是否有 CocoaPods 账号：

```
pod trunk me
```
如果出现以下图，就需要注册一个 CocoaPods 会员
![未注册 Pod](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/2e3e25fbf8ff4bab97ef0ebe2800dfa1~tplv-k3u1fbpfcp-zoom-1.image)

### 2、注册 CocoaPods 账号：

```
pod trunk register 776362265@qq.com 'gavin'
<!--执行后会收到邮件，点击邮件跳转成功后，再执行 pod trunk me ，检查是都注册成功-->
```
![注册 Pod 账号的邮件](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/0e0c7eeb218b4b33b9814310c8d77c3f~tplv-k3u1fbpfcp-zoom-1.image)
![Pod 账号注册成功](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/f66ba209fe8f4fa8bdbcdc38f8ffb2fa~tplv-k3u1fbpfcp-zoom-1.image)

### 3、创建 Pod 组件项目
打开终端，索引在 Pod 库存放的位置，这里是以放在桌面，名字为 KKPodTest 为例讲解：

1、到桌面文件夹下面执行：`pod lib create KKPodTest`，创建 Pod 组件项目
![pod lib create KKPodTest 创建 Pod 库](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/c13d70042bf24c2280922c3a16877d4d~tplv-k3u1fbpfcp-zoom-1.image)
里面问题的含义也很明显：
1. 支持的平台
2. 支持的语言
3. 是否包含 Demo 应用（包含后方便后面测试库中的功能）
4. 是否使用测试框架
5. 是否使用 UI 测试
6. Class 的前缀

也可以根据需求选择，[具体可以看官当文档](https://guides.cocoapods.org/making/using-pod-lib-create.html)

### 4、项目源码分析
上面创建成功后，会自动打开刚才创建 Pod 库

![ Pod 初始化源码](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/9fba19361b634a919e8d12b76aa4041e~tplv-k3u1fbpfcp-zoom-1.image)

这是初始化的结构，主要注意其中标注的四项：
1. KKPodTest.podspec 是我们要编辑的并最终提交到 Cocoapods 以及 Git 的配置文件；我们可以指定 Git 来源测试，或者私有使用，也是指定到 Git 来源
2. Example for KKPodTest 是我们写 Demo 测试功能的地方
3. Pod/KKPodTest/** 下面是自己需要实现的类和图片资源（可以创建多个文件夹，上传的时候要注意物理分类，否则不会有分类，所有的类都在一个文件夹下面，具体的实现会在下面讲解）
4. 要注意版本号和 KKPodTest.podspec 兼容的版本一致，否则有可能会出现测试正常，实际使用有误的情况

### 5、创建 Git 仓库
- 注意：

好多同学使用的 Git 的第三方工具操作 Git，例如：Sourcetree ，这里建议使用 终端操作，因为 Sourcetree 的功能底层也是命令，如果不清楚 Sourcetree 中各项功能对应的命令，直接使用 Sourcetree 操作，有可能会出错，如果对终端命令不熟，可以查看 Sourcetree 中显示的状态来评估命令是否正确，在评估的时候，也要注意 Sourcetree 中状态是否延迟，可以通过关闭重启 Sourcetree 来确定状态是否延迟。

1. 在 Git 中创建 KKPodTest 未初始化的仓库（如果没有 Git 账号或者不会创建仓库，请自行查找方法）
2. 将本地的仓库上传到 Git , 因为 podspec 文件中获取 Git 版本控制的项目还需要 tag 号，所以我们还需要打上一个tag，具体名利如下：

```
//把代码从 工作区 添加到 暂存区
$ git add .  
//把代码从 暂存区 添加到 本地仓库区 
$ git commit -m 'Initial KKPodTest’
//本地仓库关联远程仓库源
$ git remote add origin https://github.com/GavinKangDeveloper/KKPodTest.git (自己的远程仓库地址)
//为项目添加标签
$ git tag -m 'First Release' ‘0.0.1’
//推送仓库和标签
$ git push --tags
```
### 6、编辑配置文件 podspec
- 新建项目默认的配置文件内容：

![默认的配置文件](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e8f287df0e0842e3a4a4728701339989~tplv-k3u1fbpfcp-zoom-1.image)

- 配置文件讲解：

```
s.name = "xxxx" #库的名字
s.version = "0.0.1" #版本号，当私有库需要更新的时候只要修改这个值
s.summay = "xxxxxx" #库的简介，pod search 显示在上面的介绍
s.description = "xxxxxxxx" #库的详细描述
s.homepage = "https://xxxx" #主页地址，pod search 会显示，一般填写仓库的地址就行了
s.license = { :type => 'MIT', :file => 'LICENSE' } #开源协议，项目文件目录下需要有一个MIT开源协议文件，创建的时候默认就创建了这个，具体内容可以打开 LICENSE 查看
s.author = { "name" => "xxxxxx@qq.com" } #作者名字、邮箱
s.ios.deployment_target = '9.0' #库最低支持的系统版本
s.source = { :git => "https://github.com/GavinKangDeveloper/KKPodTest.git", :tag => "#{s.version}" } #资源地址，pod install 的时候会根据这个地址去下载你的想要库，以及下载的版本，必须要跟s.version一致。
s.source_files = "xxxx" #这个很重要，指定资源文件，前缀就是 .podspec 文件当前路径，只用写之后的路径，如 Classes/* 是指 Classes 文件夹下的所有文件，但不包括子文件夹里面的文件、Classes/**/* 是指包含所有 Classes 文件夹下的文件，包括子文件、Classes/**/*.{h,m} 是指包含所有 Classes 文件夹下的后缀为 .h 和 .m 的文件，也可以指定文件。
s.requires_arc = true #是否支持arc

>>>>>以下是可选描述<<<<<
s.resource_bundles = {
      'KKPodTest' => ['KKPodTest/Assets/*.xcassets']
  } #资源图片
# s.dependency "JSONKit", "~> 1.4" #需要依赖的三方库
#s.framework  = "SomeFramework" #需要依赖的框架
#s.public_header_files = '' #公开的头文件，如果没有公开，用户在用的时候可能引不到响应的头文件
s.subspec 'subFolder' do |ss|
    ss.source_files = 'Classes/xxx/**/*.{h,m}'
    ss.public_header_files = "Classes/xxx/**/*.{h}"
end   #这个是子依赖库，如果我们只是用 s.source_files 来指定文件，那么用户在 pod 下来之后所有的文件都在同一个目录下，没有子文件夹，如果想要分类，用 s.subspec，每一个 subspec 可以分一个子文件夹，但是记得一定要将 .h 文件通过 ss.public_header_files 公开，不然有可能会找不到头文件。
```
- KKPodTest.podspec 的配置内容

```
Pod::Spec.new do |s|
  s.name             = 'KKPodTest'
  s.version          = '0.0.1'
  s.summary          = 'A test of Pod.'
  s.description      = <<-DESC
  主要是为了测试创建 pod 库
                       DESC
  s.homepage         = 'https://github.com/GavinKangDeveloper/KKPodTest'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KangKang' => '776362265@qq.com.com' }
  s.source           = { :git => 'https://github.com/GavinKangDeveloper/KKPodTest.git', :tag => s.version.to_s }
  s.social_media_url = 'https://juejin.im/user/1433418895468397/posts'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  
  s.resource_bundles = {
      'KKPodTest' => ['KKPodTest/Assets/*.xcassets']
  }
  
  s.subspec 'UIKit' do |ss|
      ss.source_files = 'KKPodTest/Classes/UIKit/*.{h,m}'
  end
  
  s.subspec 'Category' do |ss|
      ss.source_files = 'KKPodTest/Classes/Category/*.{h,m}'
  end
  
end
```

- 关于 resource_bundles 和 source_files 的具体说明

![新增 xcassets](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/20c8e6e1cefe4ace9c040649547c2d44~tplv-k3u1fbpfcp-zoom-1.image)

![新增文件夹和分类](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/7c7ae805a6814a3d84f45efdf900a771~tplv-k3u1fbpfcp-zoom-1.image)

1. 在 KKPodTest 文件夹下 add Files，新增 Classes 和 Assets 文件夹
2. 删除 Classes 和 Assets 下面的 gitkeep 和 ReplaceMe.m 文件
3. 新增 文件夹、xcassets 、分类

- '*'表示匹配所有文件
- '*.{h,m}' 表示匹配所有以.h和.m结尾的文件
- '**' 表示匹配所有子目录
- 这里的路径是相对于 KKPodTest.podspec 文件, 如果是与 KKPodTest.podspec 同级的文件夹, 直接写文件夹名称，否则就要写到对应文件

### 7、验证配置文件
在 pod 库的路径下输入：

```
pod lib lint 或者 pod spec lint
```
- pod lib lint  所编译的源代码是来自于 podspec 所在目录而不是 source 所指定git地址
- pod spec lint  会联网校验，通过 source 中的 git 地址获取源代码，同时还会校验 git 地址上是否有对应 version 字段 tag

可以在修改后使用 `pod lib lint`验证是否正确，如果没问题，再上传到 Git，但是最终使用的还是 source 中的 git 地址源码的内容，在 `pod repo push`或者 `pod trunk push` 出问题的情况下，也可以先用 `pod spec lint` 验证是否有问题，对比一下本地和Git中的配置文件是否一致。

![验证配置文件](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e4484c2c385e4db88e10c62f48c0c3c6~tplv-k3u1fbpfcp-zoom-1.image)

有警告可以，但是不能有错误，这里一般是因为 resource_bundles 和 source_files 路径不对，按照上面的方法不会出现问题

### 8、添加 podspec 到本地
向 Spec Repo 提交 podspec 需要完成两点：
1. podspec 必须通过验证无误
2. 删掉无用的注释
- 本地初始化组件仓库，初始化后可以在自己电脑的 `~/.cocoapods/repos/`目录下面打开查看

```
pod repo add KKPodTest https://github.com/GavinKangDeveloper/KKPodTest.git
```
- 向本地仓库添加，如果不想看警告，可以后面加上`--allow-warnings`，KKPodTest 后面是自己 podspec 的路径

```
pod repo push KKPodTest ~/Desktop/KKPodTest/KKPodTest.podspec  --allow-warnings
```
### 9、将 podspec 和修改的内容上传到 Git
```
//把代码从 工作区 添加到 暂存区
$ git add .  
//把代码从 暂存区 添加到 本地仓库区 
$ git commit -m 'Initial KKPodTest’
//把代码从 本地仓库区 推送到 远程仓库区 
$ git push
```
如果是第一次推送，会报以下错误，这是因为初次推送内容需要初始化远程仓库，把 git push 替换成  git push --set-upstream origin master 就可以了
![推送本地仓库到远端仓库](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/ec639798c663428d9391d4bb2a4c2ed2~tplv-k3u1fbpfcp-zoom-1.image)

### 10、本地测试 Git 仓库是否可用
创建一个项目，集成 Cocoapods ，加入本次创建的 KKPodTest 库，因为此时还没有上传到 Pod ，所以还需要加上索引地址，本次以 KKTest 项目为例：
- Podfile 中的内容：

```
platform :ios, "9.0"chua
target 'KKTest' do
  pod 'SDWebImage','4.4.7'
  pod 'KKPodTest' , :git => 'https://github.com/GavinKangDeveloper/KKPodTest.git'
end
```
执行 `pod install`，如果失败，可以注释这次创建的 KKPodTest ，先 `pod update` 更新再解注释执行 `pod install`。
- 执行成功后的效果：


### 11、提交 podspec 到本地
- 本地初始化组建仓库

```
pod repo add KKPodTest https://github.com/GavinKangDeveloper/KKPodTest.git
```
- 向仓库中添加组件，可以在 `~/.cocoapods/repos/` 下查看 

```
pod repo push KKPodTest ~/Desktop/KKPodTest/KKPodTest.podspec
```

### 12、提交开源组件到 Pod
push 到 pod 之前，最好删掉刚刚添加到本地的 podspec ,删除效果可以在电脑的 `~/.cocoapods/repos/` 下查看

```
$ pod repo remove KKPodTest
```
提交 podspec 到 pod

```
$ pod trunk push KKPodTest.podspec
```
执行成功后会有以下内容显示

![pod trunk push 成功](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/97035fdbfb9f41ba82d7a597d15ffc9b~tplv-k3u1fbpfcp-zoom-1.image)

### 13、提交成功后的使用
提交成功后就可以像 SDWebImage 一样可以使用，在使用 `pod search`搜索的时候，如果搜不到，可以用以下命令清理以下缓存后再试，如果还是搜不到，可以到 [ Pod 的官网搜索](https://cocoapods.org/)

```
~/Library/Caches/CocoaPods/search_index.json

```

![使用 Pod 库](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/12f667f8b6a44fa286f2b0461d2f8585~tplv-k3u1fbpfcp-zoom-1.image)


### 14、升级 Pod 版本
上面的没问题，以下升级版本就比较简单了，主要有以下步骤：

1. 修改完升级的内容
2. 修改 podspec 里面的版本号
3. 把修改的内容全部推到 Git
4. 打标签`git tag tag值`
5. 推送标签 `git push --tags`
6. 推送到 pod `pod trunk push`

push 成功后就可以在使用的项目中修改版本或者直接 update 了。


## 遇到的错误以及解决办法
### The NAME.podspec specification does not validate
解决方案：

Xcode > preferences > Locations 里面
指定 Command Line Tools 的 Xcode 版本。

![指定 Command Line Tools Xcode](https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/fdeb43ac81ca46daaf59c7a3932fded9~tplv-k3u1fbpfcp-zoom-1.image)


### did not match any file

```
pod trunk push file patterns: The `resource_bundles` pattern for `KKPodTest` did not match any file
```
如果 效验 podspec `pod lib lint` 没问题，但是 pod repo push 出问题，有可能是路径错误，或者 podspec 中 s.source 中的路径不对。

### pattern did not match any file.

```
[iOS] file patterns: The `source_files` pattern did not match any file.
```
这个一般出现在效验 podspec `pod lib lint` 出现的问题，要注意在 podspec 中的配置是否正确，这里的路径是相对于 KKPodTest.podspec 文件, 如果是与 KKPodTest.podspec 同级的文件夹, 直接写文件夹名称，否则就要写到对应文件的路径

如果本地 和 Git 中的路径一样，本地路径中的配置文件验证成功，Git 中的验证失败，有可能是缓存问题，可以修改一个 tag ，重新验证和提交

### 推送新版本出错

执行 `pod trunk push`的时候出现了以下错误

```
[!] There was an error pushing a new version to trunk: Failed to open TCP connection to trunk.cocoapods.org:443 (getaddrinfo: nodename nor servname provided, or not known)
```
这个很有可能是网络问题，多推几次，换个网络就 OK 了。




## 未完待续，本文会根据自身使用，长期更新坑和新技术，欢迎各位大佬关注！


## License

KKPodTest is available under the MIT license. See the LICENSE file for more info.
