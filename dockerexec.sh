CONTAINER_NAME="angular_container"
OLD="$(docker ps --all --quiet --filter=name="$CONTAINER_NAME")"
if [ -n "$OLD" ]; then
  docker stop $OLD && docker rm $OLD
fi
docker pull sanyambatra13/jenkins-angularapp:latest
nohup docker run --name angular_container -p 3000:3000 --rm sanyambatra13/jenkins-angularapp:latest &
