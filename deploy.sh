docker build -t 000excel/multi-client:latest -t 000excel/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t 000excel/multi-server:latest -t 000excel/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t 000excel/multi-worker:latest -t 000excel/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push 000excel/multi-client:latest
docker push 000excel/multi-client:$SHA

docker push 000excel/multi-server:latest
docker push 000excel/multi-server:$SHA

docker push 000excel/multi-worker:latest
docker push 000excel/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=000excel/multi-server:$SHA
kubectl set image deployments/client-deployment client=000excel/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=000excel/multi-worker:$SHA