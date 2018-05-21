### 安装 docker

Docker 使用的是 C/S 架构，分为 client 和 dockerd。

#### Mac 系统

1. [Docker for Mac](https://store.docker.com/editions/community/docker-ce-desktop-mac)，官方推荐。
2. [Docker Toolbox](https://docs.docker.com/docker-for-mac/docker-toolbox/)，系统低于 10.11，配置较低，或有性能问题。
3. [dinghy](https://github.com/codekitchen/dinghy)，第三方 docker-machine 管理工具，需手动安装 docker client。

[官方教程](https://docs.docker.com/docker-for-mac/install/)

#### Windows 系统

1. [Docker for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows)，支持 Win 10 64位专业或企业版、以及新版本的教育版，必须开启 Hyper-V。
2. [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/)，不满足使用 Docker for Windows 条件，或者安装失败。

[官方教程](https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install)

> 区别：Docker for Mac 和 Docker for windows 的 dockerd 守护进程在宿主机；Docker Toolbox 和第三方的管理工具，dockerd 运行在 docker-machine 中，需配合虚拟机管理工具。


### 修改配置文件

* Docker for Mac 或 Docker for Windows，"Preferences" > "Daemon" > "Insecure registries:" 添加不安全注册服务器地址（后期升级后，无需添加） `10.211.55.4:5000` ； "Registry Mirrors:" 添加私有镜像仓库地址 `http://10.211.55.4:5000` 和国内公有镜像地址 `https://registry.docker-cn.com`。如图所示
  ![Docker Desktop 配置示意图](http://ohtd7tndv.bkt.clouddn.com/docker_for_mac_pref.png)
* Docker Toolbox 等，修改配置文件 `$HOME/.docker/machine/machines/default/config.json` ，找到数组配置项 `InsecureRegistry` 和 `RegistryMirror`添加响应的配置，如图所示
  ![Docker Toolbox 配置示意图](http://ohtd7tndv.bkt.clouddn.com/docker_toolbox_config.png)
  
  修改配置后需重启 dockerd ，执行 `docker info` 检查配置是否生效。
  
### 运行

执行 `docker-compose up -d` 运行容器。
