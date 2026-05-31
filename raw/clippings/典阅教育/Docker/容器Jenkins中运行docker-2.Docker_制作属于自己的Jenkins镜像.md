# 容器Jenkins中运行docker - 2.Docker | 制作属于自己的 Jenkins 镜像



<font style="color:rgb(51, 51, 51);">有时候我们可能需要为了满足自己的需求来制作自己的 Docker 镜像。</font>

## <font style="color:rgb(51, 51, 51);">前言</font>
<font style="color:rgb(51, 51, 51);">最近我在使用 Docker 搭建 Jenkins 自动化构建平台时遇到了各种环境问题，例如在 Jenkins 官方的镜像内是没有 maven、Android SDK、npm 等环境的，自然也就没法使用 Jenkins 来构建编译我们的项目，这里有三种解决办法：</font>

##### <font style="color:rgb(51, 51, 51);">1. 直接进入到 Jenkins 容器内部安装相关环境。</font>
<font style="color:rgb(51, 51, 51);">需要注意的是，安装相关相关环境后要确保容器不能被删除，容易一旦被删除，那么里面所做的变更都消失了，所以不推荐。</font>

##### <font style="color:rgb(51, 51, 51);">2. 在宿主机上安装相关环境，然后通过 Docker 挂载卷的形式映射到容器内部。</font>
<font style="color:rgb(51, 51, 51);">这种方式如果宿主机有相关环境是非常方便的，可以直接环境的位置以挂载卷的形式映射到容器内部让容器能访问到宿主机的环境，但缺点也很明显，如果需要将 Jenkins 迁移到其他服务器上，那么这些环境是没法迁移的，需要到迁移的服务器上再安装一遍的，所以综上两种方式有了下面的第三种方式。</font>

##### <font style="color:rgb(51, 51, 51);">3. 将相关环境直接打包进 Jenkins 镜像中。</font>
<font style="color:rgb(51, 51, 51);">这种方式需要我们在官方 Jenkins 镜像的基础上定制属于我们自己的 Jenkins 镜像，和第一种方式一样，环境是安装在容器内部的，但是不同的是容器若被删除，下次重新创建容器的时候环境都是还在的，因为环境安装在 Image 镜像内部的。所以迁移也很方便，只需要把制作好的镜像上传到 DockerHub 上，然后其他服务器需要使用的话只需要将镜像拉取下来即可。</font>

## <font style="color:rgb(51, 51, 51);">镜像制作</font>
<font style="color:rgb(51, 51, 51);">下面就来一步一步制作我们的 Jenkins 镜像，分别演示将 Maven、Android SDK、Node.js 环境打包到镜像中。</font>

#### <font style="color:rgb(51, 51, 51);">编写 Dockerfile 文件</font>
<font style="color:rgb(51, 51, 51);">首先创建我们的 Dockerfile 文件，然后编写。</font>

##### <font style="color:rgb(51, 51, 51);">选定基础镜像</font>
1. <font style="color:rgb(51, 51, 51);">这里我们使用 Jenkins 官方提供的 Jenkins 镜像作为基础镜像。</font>

##### <font style="color:rgb(51, 51, 51);">安装必要的辅助工具</font>
2. <font style="color:rgb(51, 51, 51);">因为后面涉及到 zip 压缩包下载、解压操作，所以我们需要先安装 </font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">curl</font><font style="color:rgb(51, 51, 51);">、</font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">unzip</font><font style="color:rgb(51, 51, 51);"> 命令。</font>

##### <font style="color:rgb(51, 51, 51);">安装 Maven 环境</font>
##### <font style="color:rgb(51, 51, 51);">安装 Android SDK 环境</font>
##### <font style="color:rgb(51, 51, 51);">安装 Node.js 环境</font>
3. <font style="color:rgb(51, 51, 51);">安装 Node.js 的命令是通过 apt 来安装的，详见</font>[官方文档](https://github.com/nodesource/distributions/blob/master/README.md)<font style="color:rgb(51, 51, 51);">。</font>

##### <font style="color:rgb(51, 51, 51);">将各环境添加到系统环境变量中</font>
##### <font style="color:rgb(51, 51, 51);">最后做一些清理操作</font>
4. <font style="color:rgb(51, 51, 51);">尽量在镜像中不要放一些冗余的无用文件，所以需要做一些清理操作。</font>

##### <font style="color:rgb(51, 51, 51);">完整的 Dockerfile 文件</font>
```dockerfile
FROM jenkins/jenkins:lts
```

```dockerfile
RUN apt-get update \
    && echo Y | apt-get install curl \
    && apt-get install unzip
```

```dockerfile
ARG MAVEN_URL="http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip"
ARG USER_LOCAL="/usr/local"
ENV MAVEN_HOME="$USER_LOCAL/maven"

RUN cd $MAVEN_HOME \
    && curl -o maven.zip $MAVEN_URL \
    && unzip maven.zip \
    && rm maven.zip
```

    - <font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">ARG</font><font style="color:rgb(51, 51, 51);">：用于定义常量，仅在当前 Dockerfile 有效。</font>
    - <font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">ENV</font><font style="color:rgb(51, 51, 51);">：也是定于常量，当时在构建镜像时，会作为环境变量打到镜像内部。</font>
    - <font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">curl -o</font><font style="color:rgb(51, 51, 51);"> ：下载文件。</font>

```dockerfile
ARG USER_LOCAL="/usr/local"
ARG SDK_MANAGER_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip"
ENV ANDROID_HOME="$USER_LOCAL/Android/sdk"

RUN cd $ANDROID_HOME \
    && curl -o sdk.zip $SDK_MANAGER_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && cd tools \
    && echo Y | $ANDROID_HOME/tools/bin/sdkmanager "extras;android;m2repository" "platform-tools" "platforms;android-28" "build-tools;28.0.3" "cmake;3.10.2.4988404"
```

    - <font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">echo Y</font><font style="color:rgb(51, 51, 51);">：因为有些操作需要用户输入 Y/n 确认，所以这句的意思是代替用户输入 Y。</font>

<font style="color:rgb(51, 51, 51);">这里我们使用 Andoird 提供的命令行工具 sdkmanager 去安装 sdk，这里我们安装了 android-28、build-tools 28.0.3 版本，以及 cmake。</font><font style="color:rgb(51, 51, 51);">可以使用 </font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">sdkmanager list</font><font style="color:rgb(51, 51, 51);"> 可以查看所有可安装的环境。</font><font style="color:rgb(51, 51, 51);">详细的 sdkmanager 使用可以查看</font>[官方文档](https://developer.android.com/studio/command-line/sdkmanager)<font style="color:rgb(51, 51, 51);">。</font>

```dockerfile
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get install -y nodejs
```

```dockerfile
ENV PATH $MAVEN_HOME/apache-maven-3.6.3/bin:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmake/3.10.2.4988404/bin:$PATH
```

```dockerfile
RUN apt-get clean
```

```dockerfile
FROM jenkins/jenkins:lts
USER root

ARG USER_LOCAL="/usr/local"
ARG SDK_MANAGER_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip"
ARG MAVEN_URL="http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip"
ENV ANDROID_HOME="$USER_LOCAL/Android/sdk"
ENV MAVEN_HOME="$USER_LOCAL/maven"

RUN mkdir -p $ANDROID_HOME \
    && mkdir -p $MAVEN_HOME \
    && apt-get update \
    && echo Y | apt-get install curl \
    && apt-get install unzip \
    && cd $MAVEN_HOME \
    && curl -o maven.zip $MAVEN_URL \
    && unzip maven.zip \
    && rm maven.zip \
    && cd $ANDROID_HOME \
    && curl -o sdk.zip $SDK_MANAGER_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && cd tools \
    && echo Y | $ANDROID_HOME/tools/bin/sdkmanager "extras;android;m2repository" "platform-tools" "platforms;android-28" "build-tools;28.0.3" "cmake;3.10.2.4988404" \
    && curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get install -y nodejs

ENV PATH $MAVEN_HOME/apache-maven-3.6.3/bin:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmake/3.10.2.4988404/bin:$PATH

RUN apt-get clean
```

<font style="color:rgb(119, 119, 119);">Docker 镜像分层存储结构，层数是有限制的，Dockerfile 中每个命令将作为一层，所以尽量将可放在一起一些操作放在一个命令内，例如上面不必写很多 </font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">RUN</font><font style="color:rgb(119, 119, 119);">，将命令放在一起会更好，了解更多写法可参考</font>[这里](https://yeasy.gitbooks.io/docker_practice/image/build.html)<font style="color:rgb(119, 119, 119);">。</font>

#### <font style="color:rgb(51, 51, 51);">构建镜像</font>
```bash
docker build -t my_jenkins .
```

+ <font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">-t</font><font style="color:rgb(51, 51, 51);">：指定镜像名。</font>

<font style="color:rgb(119, 119, 119);">最后的 . 不要忘记，用于指定</font>[构建上下文环境](https://yeasy.gitbooks.io/docker_practice/image/build.html)<font style="color:rgb(119, 119, 119);">，如果 Dockerfile 文件没有问题，那么构建应该是没有问题的，其中安装 Android SDK 可能需要耗时一点。</font>

## <font style="color:rgb(51, 51, 51);">上传镜像到 DockerHub</font>
##### <font style="color:rgb(51, 51, 51);">注册 DockerHub 账号</font>
1. <font style="color:rgb(51, 51, 51);">想要上传镜像到 </font>[DockerHub](https://hub.docker.com/)<font style="color:rgb(51, 51, 51);"> 需要提前注册一个账号。</font>

##### <font style="color:rgb(51, 51, 51);">在本地登录 DockerHub 账号</font>
##### <font style="color:rgb(51, 51, 51);">推送刚刚构建的镜像</font>
2. <font style="color:rgb(163, 21, 21);">使用镜像创建Jenkins </font>

```bash
docker login
```

<font style="color:rgb(51, 51, 51);">可使用上面的命令按照提示登入你的账号</font>

```bash
docker tag my_jenkins imhanjie/my_jenkins
docker push my_jenkins
```

<font style="color:rgb(51, 51, 51);">这里需要注意的是，在 </font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">push</font><font style="color:rgb(51, 51, 51);"> 之前，肯定是要推送到自己的仓库，所以根据镜像名称的规则，需要在镜像前面加上你自己的 DockerHub 的用户名，这样才会推送到你的仓库下，指定用户名的形式就是 </font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">your_username/image_name</font><font style="color:rgb(51, 51, 51);"> ，我的 DockerHub 名字是 </font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">imhanjie</font><font style="color:rgb(51, 51, 51);"> ，所以首先根据本地的 </font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">my_jenkis</font><font style="color:rgb(51, 51, 51);"> 镜像添加一个 tag，名称为 </font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">imhanjie/my_jenkins</font><font style="color:rgb(51, 51, 51);"> ，然后 </font><font style="color:rgb(192, 52, 29);background-color:rgb(251, 229, 225);">push</font><font style="color:rgb(51, 51, 51);"> 就可以了，最后就可以在 DockerHub 上看见自己刚刚推送的镜像了。</font>

```bash
docker run --name jenkins -d -p 8080:8080 -p 50000:50000 -v `pwd`/jenkins-data:/var/jenkins_home imhanjie/my_jenkins
```



> 更新: 2024-04-03 17:10:10  
> 原文: <https://www.yuque.com/lixinsi/gbsggt/pqygfvqczto0p1wp>