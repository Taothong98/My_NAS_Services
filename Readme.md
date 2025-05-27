add ignor main_data of production




docker-compose build --no-cache
docker images
docker tag my_nas_services-jupyter:latest taothong/u-jupyter:2.0

docker push taothong/u-jupyter:2.0


docker tag my_nas_services-ssh-server:latest taothong/u-ssh-server:1.0
docker push taothong/u-ssh-server:1.0
