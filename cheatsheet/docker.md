### Docker Cheat Sheet

- Connect to process running or exposed on localhost port from inside a docker container
```
  - docker.for.mac.localhost
  - docker.for.mac.host.internal
```

- Remove all untagged docker images from local
```
$ docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")
```

- Remove all stopped docker container from local
```
$ docker rm $(docker ps -a -q)
```

### Useful docker images one liner
- Kafka Web view https://github.com/SourceLabOrg/kafka-webview
```
$ docker run -it -p 8080:8080 -v /tmp/kafka:/app/data sourcelaborg/kafka-webview:latest
```

- Redis Cluster
```
$ docker run -d -p 30001:30001 -p 30002:30002 -p 30003:30003  tommy351/redis-cluster:3.2
```

