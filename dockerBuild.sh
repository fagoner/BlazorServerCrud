docker rmi -f blazorcrud || true
docker build -t blazorcrud . || true                          
docker rmi $(docker images -f "dangling=true" -q) || true