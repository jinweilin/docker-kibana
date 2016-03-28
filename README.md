# docker-kibana
## Build
```
docker build -t kinbana .
```
## Start
```
mkdir /opt/jenkins_home
docker run -d -p 5601:5601 --name kinbana kinbana
```