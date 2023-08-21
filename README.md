# ToDo-App
ToDo App on Flask. you can start  with k8s

Clone the this repo

```
$ git clone https://github.com/canogluonur/Todo-App.git
$ cd Todo-App
```

Deploy ToDo-App

```
$ kubectl apply  -f /k8s/complete.yaml
```

Check the pods and Service 

```
$ kubectl get pods
$ kubectl get svc
```

Then You can look the app on your browser.

# http://<your-minikube-ip>:30002 

this command you can access the app.

if you want to access mongoDB on mongodb-compass

# mongodb://<your-minikube-ip>:30001/


If you want to delete deployments

```
$ kubectl delete -f k8s/complete.yaml
```
