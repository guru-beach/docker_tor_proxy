del_stopped(){
  local name=$1
  local state
  state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

  if [[ "$state" == "false" ]]; then
    docker rm "$name"
  fi
}

torproxy () {
  del_stopped torproxy

  docker run -d \
  --restart always \
  -v /etc/localtime:/etc/localtime:ro \
  -p 9050:9050 \
  --name torproxy \
  torproxy
}

privoxy () {
  del_stopped privoxy
  docker run -d \
  --restart always \
  -v /etc/localtime:/etc/localtime:ro \
  --link torproxy:torproxy \
  -p 8118:8118 \
  --name privoxy \
  privoxy
}

start_proxy () {
  torproxy
  privoxy
}

stop_proxy () {
  docker kill torproxy privoxy
}
