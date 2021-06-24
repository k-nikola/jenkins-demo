# kubernetes-demo
Prerequisites for running this demo: <br>
To run this kubernetes demo, I've used minikube. <br>
Minikube can be used to quickly setup a local Kubernetes cluster on Linux/Windows/MacOS. Minikube can be run as a docker container or a VM. <br>
Minikube installation guide ->  https://minikube.sigs.k8s.io/docs/start/<br>
After the installation is finished, minikube can be run with a simple command: <br>
![2](https://user-images.githubusercontent.com/81910142/123321286-13f7fe00-d533-11eb-80eb-2fba484ed7cc.PNG)<br>
Installing minikube should also install kubectl, and connect it to the minikube cluster.<br>
![3](https://user-images.githubusercontent.com/81910142/123322618-cda39e80-d534-11eb-909a-76a01802c5de.PNG)<br>
Status of the cluster can be easily verified with <b>minikube status</b> command. <br>
With kubectl apply, we can create/update resources in a cluster from a file. <br>
![6](https://user-images.githubusercontent.com/81910142/123332429-c6828d80-d540-11eb-9c09-5861feb7b389.PNG)<br>
Kubectl will then create pods within the cluster. This can be verified with a command such as <b>kubectl get pods</b></br>
Other resources that are created, such as namespace and services, can also be verified with commands such as <b>kubectl get namespaces</b> and <b>kubectl get services</b><br>
![8](https://user-images.githubusercontent.com/81910142/123332772-3f81e500-d541-11eb-84d9-a78246e406a2.PNG)<br>
To access the cluster from the outside, and reach the static website that is being hosted inside the pods, we need to access the LoadBalancing service of the cluster.
The name of the service in this example is site-service, which is defined inside the site-deployment.yml file. <br>
<b>minikube service [name]</b> command can come in handy in situations like these. This command will also automatically open a web browser and access the url of the service.</br>
![9](https://user-images.githubusercontent.com/81910142/123333785-7b697a00-d542-11eb-839c-3781071a2ea4.PNG)</br>
And there it is! A simple static website hosted inside a kubernetes cluster.</br>
![10](https://user-images.githubusercontent.com/81910142/123333800-802e2e00-d542-11eb-844c-21fd07c27832.PNG)</br>
