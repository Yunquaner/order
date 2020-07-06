
rder站点

#需要配置如下参数
# 项目路径, 在Execute Shell中配置项目路径, pwd 就可以获得该项目路径
# export PROJ_PATH=这个jenkins任务在部署机器上的路径

# 输入你的环境上tomcat的全路径
# export TOMCAT_APP_PATH=tomcat在部署机器上的路径

### base 函数
killTomcat()
{
    pid=`ps -ef|grep tomcat|grep java|awk '{print $2}'`
    echo "tomcat Id list :$pid"
    if [ "$pid" = "" ]
    then
      echo "no tomcat pid alive"
    else
      kill -9 $pid
    fi
}

# 停tomcat
killTomcat

# 删除原有工程
rm -f /webapps/tomcat/apache-tomcat-9.0.30/webapps/todolist-3.0.5-SNAPSHOT.war

# 复制新的工程
cp /var/lib/jenkins/workspace/DEMO_01_master/target/todolist-3.0.5-SNAPSHOT.war /webapp/tomcat/apache-tomcat-9.0.30/webapps/

# 启动Tomcat
cd /webapp/tomcat/apache-tomcat-9.0.30/
sh bin/startup.sh




