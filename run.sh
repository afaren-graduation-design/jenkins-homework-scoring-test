#! /usr/bin/env bash

# build image
docker build -t did-jenkins .

# run container 
docker run -d --name did-jenkins -v /var/run/docker.sock:/var/run/docker.sock \
                -v $(which docker):/usr/bin/docker -p 8080:8080 did-jenkins

# copy plugins，必须安装某些插件，才可以使用 post-build，所以我一次性将所有插件安装了上去
for i in $(ls *.hpi); do dk cp $i did-jenkins:/var/jenkins_home/plugins; done

# copy config.xml
dk cp config.xml did-jenkins:/var/jenkins_home/jobs/HOMEWORK_SCORING/


# run nodejs container & execute command
echo $script > evaluate-script-$BUILD_NUMBER.sh
chmod +x evaluate-script-$BUILD_NUMBER.sh
./evaluate-script-$BUILD_NUMBER.sh > /tmp/result_detail_$BUILD_NUMBER 2>&1

MNT="$WORKSPACE/.."
docker run --name $container_name -d "$MTN:/opt/project" $IMAGE /bin/bash -c '\
	cd /opt/project/workspace && \
	chmod +x evaluate-script-$BUILD_NUMBER.sh && \
	./evaluate-script-$BUILD_NUMBER.sh '





# ---------------------------------------------------------------------
ontainer_name="${stack}_${BUILD_NUMBER}"
script_name="evaluate-script-${BUILD_NUMBER}.sh"

echo $script > $script_name
chmod +x $script_name

#./evaluate-script-$BUILD_NUMBER.sh > /tmp/result_detail_$BUILD_NUMBER 2>&1


pwd -P
ls -l


MNT="$WORKSPACE/"
IMAGE='node:5.8'

docker run --name $container_name --detach $IMAGE /bin/bash -xc "tail -f /dev/null"

docker cp . $container_name:/opt/project # copy directory
docker exec $container_name "chmod +x /opt/project/$script_name"
docker exec $container_name "/opt/project/$script_name > /tmp/result_detail_$BUILD_NUMBER 2>&1"
docker cp  $container_name:/tmp/result_detail_$BUILD_NUMBER  /tmp/result_detail_$BUILD_NUMBER

docker ps 

docker cp $container_name:/tmp/result_detail_$BUILD_NUMBER /tmp/result_detail_$BUILD_NUMBER
              

cat /tmp/result_detail_$BUILD_NUMBER

docker stop $container_name
# docker rm --force $container_name




# -----------------
container_name="${stack}_${BUILD_NUMBER}"
script_name="evaluate-script-${BUILD_NUMBER}.sh"

echo $script > $script_name
chmod +x $script_name

#./evaluate-script-$BUILD_NUMBER.sh > /tmp/result_detail_$BUILD_NUMBER 2>&1


pwd -P

ls -l

MNT="$WORKSPACE/"
IMAGE='node:5.8'

docker run --name $container_name --detach $IMAGE /bin/bash -xc "tail -f /dev/null"

docker exec $container_name mkdir -p "/var"
docker cp . $container_name:/var # copy directory

docker exec -i $container_name ls -l "/var/"
docker exec -i $container_name chmod +x "/var/$script_name"
docker exec -i $container_name "/var/$script_name > /tmp/result_detail_$BUILD_NUMBER 2>&1"
docker cp  $container_name:/tmp/result_detail_$BUILD_NUMBER  /tmp/result_detail_$BUILD_NUMBER


docker ps 

docker cp $container_name:/tmp/result_detail_$BUILD_NUMBER /tmp/result_detail_$BUILD_NUMBER
              

cat /tmp/result_detail_$BUILD_NUMBER

docker stop $container_name
# docker rm --force $container_name



#----------

container_name="${stack}_${BUILD_NUMBER}"
script_name="evaluate-script-${BUILD_NUMBER}.sh"

echo $script > $script_name
chmod +x $script_name

IMAGE='node:5.8'

docker run --name $container_name --detach $IMAGE /bin/bash -xc "tail -f /dev/null"

docker exec $container_name mkdir -p /var
docker cp . $container_name:/var # copy directory

docker exec -i $container_name chmod +x /var/$script_name

docker exec -i $container_name sh -c "cd /var; ./$script_name" > /tmp/result_detail_$BUILD_NUMBER 2>&1

         

cat /tmp/result_detail_$BUILD_NUMBER

docker stop $container_name


# 批量删除容器
for i in $(docker ps -a --filter "name=javascript" -q); do dk rm -f $i; done 


# refactor constants to uppercase
CONTAINER="${stack}_${BUILD_NUMBER}"
SCRIPT="evaluate-script-${BUILD_NUMBER}.sh"
IMAGE='node:5.8'

echo $script > $SCRIPT    # save script content to file

docker run --name $CONTAINER --detach $IMAGE /bin/bash -xc "tail -f /dev/null"
docker cp . $CONTAINER:/var # copy directory
docker exec -i $CONTAINER bash -c "cd /var && chmod +x $SCRIPT &&./$SCRIPT" > /tmp/result_detail_$BUILD_NUMBER 2>&1

docker rm --force $CONTAINER



# ADD_IMAGE 这样处理的话，就可以正确报错，并且把所有的信息都导入到 message 中
docker pull $image > /tmp/result_detail_$BUILD_NUMBER 2>&1 
