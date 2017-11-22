# binsec-docker
Dockerfile for binsec server

 * based on [ntddk/binsec-vagrant](https://github.com/ntddk/binsec-vagrant)


## Getting Started
```
docker build -t binsec .
docker run --rm -p 5570:5570 -it binsec
# now binsec server is available at localhost:5570
```
