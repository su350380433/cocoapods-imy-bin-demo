## 一、环境搭建

### 1.创建一个存放二进制私有源仓库

如：https://github.com/su350380433/example_spec_dev

并添加到本地仓库中

``` shell
pod repo add example_spec_bin_dev git@github.com:su350380433/example_spec_bin_dev.git
```

ps：cocopods 目前支持到1.8.4版本，1.9 `pod bin auto`命令需要适配 ，其他不受影响
### 2.安装mongodb

```shell
# 进入 /usr/local
cd /usr/local

# 下载
sudo curl -O https://fastdl.mongodb.org/osx/mongodb-osx-ssl-x86_64-4.0.9.tgz

# 解压
sudo tar -zxvf mongodb-osx-ssl-x86_64-4.0.9.tgz

# 重命名为 mongodb 目录

sudo mv mongodb-osx-x86_64-4.0.9/ mongodb

#创建一个数据库存储目录 /data/db：
sudo mkdir -p /data/db
```

### 3. 启动mongod

``` shell
sudo mongod
```

### 4. 启动静态资源服务器

```shell
cd ../binary-server

npm install

npm start #确保mongod 已经启动成功

```
ps:(端口修改在app.js 文件 `app.listen(8080)`)
## 5. 路由

```node
.get('/frameworks', frameworks.show)
.get('/frameworks/:names', frameworks.show)
.get('/frameworks/:name/:version', frameworks.show)
.del('/frameworks/:name/:version', frameworks.destroy)
.get('/frameworks/:name/:version/zip', frameworks.download)
.post('/frameworks', frameworks.create)
```

以下说明以 `http://localhost:8080` 为服务器地址，操作 PodA 组件。

获取组件信息：

```
curl http://localhost:8080/frameworks/PodA
> {"PodA":["0.2.4"]}

curl http://localhost:8080/frameworks
> {"TDFCoreProtocol":["1.2.4","1.2.5"],"PodA":["0.2.4-binary","0.2.4"]}
```

推送组件 zip 包：

```
curl http://localhost:8080/frameworks -F "name=PodA" -F "version=0.2.4" -F
  "annotate=Mergebranch'release/0.2.3'into'master'" -F
  "file=@/Users/songruiwang/Work/TDF/cocoapods-tdfire-binary/example/PodA/PodA.framework.zip"
  -F "sha=7bf2c8f3ce1184580abfea7129d1648e499d080e"
> 保存成功 PodA (0.2.4)
```

zip 包存储在 server 根目录的 `.binary` 目录下

获取组件 zip 包：

```
curl http://localhost:8080/frameworks/PodA/0.2.4/zip > PodA.framework.zip
```

删除组件：

```
curl -X 'DELETE' http://localhost:8080/frameworks/PodA/0.2.4 -O -J
```

[binary-server](https://github.com/su350380433/binary-server)
