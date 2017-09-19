#设置基础镜像,如果本地没有该镜像，会从Docker.io服务器pull镜像
FROM keymetrics/pm2-docker-alpine:latest

#创建app目录,保存我们的代码
RUN mkdir -p /opt/www/wwwroot/test
#设置工作目录
WORKDIR /opt/www/wwwroot/test

#复制所有文件到 工作目录。
COPY . /opt/www/wwwroot/test

#编译运行node项目，使用npm安装程序的所有依赖,利用taobao的npm安装

WORKDIR /opt/www/wwwroot/test
RUN npm install --registry=https://registry.npm.taobao.org


#暴露container的端口
EXPOSE 8360

#运行命令
CMD ["pm2","start", "pm2.json"]