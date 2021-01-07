## 一、环境搭建

### 1.创建一个存放二进制私有源仓库

如：https://github.com/su350380433/example_spec_dev

并添加到本地仓库中

``` shell
pod repo add example_spec_bin_dev git@github.com:su350380433/example_spec_bin_dev.git
```

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

