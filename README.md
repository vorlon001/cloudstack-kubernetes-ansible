
```shell

docker run -it --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock ubuntu:22.04 bash

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock harbor.iblog.pro/test/ubuntu:main.ubuntu.22.04 bash

docker run -it --rm --hostname kolla-yoga --name kolla-yoga -v $(pwd):/install -v /var/run/docker.sock:/var/run/docker.sock harbor.iblog.pro/test/ubuntu:main.ubuntu.22.04 bash

```

