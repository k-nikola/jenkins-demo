# kubernetes-demo
Prerequisites for running this demo: <br>
This kubernetes demo uses minikube to set up a local cluster. <br>
Minikube can be used to quickly setup a local Kubernetes cluster on Linux/Windows/MacOS. It can be run as a docker container or a VM. <br>
Minikube installation guide ->  https://minikube.sigs.k8s.io/docs/start/<br>
After the installation is completed, minikube can be run with a simple command: <br>
![2](https://user-images.githubusercontent.com/81910142/123321286-13f7fe00-d533-11eb-80eb-2fba484ed7cc.PNG)<br>
Installing minikube should also install kubectl, and connect it to the minikube cluster.<br>
![3](https://user-images.githubusercontent.com/81910142/123322618-cda39e80-d534-11eb-909a-76a01802c5de.PNG)<br>
Status of the cluster can be easily verified with `minikube status` command. <br>
With kubectl apply, we can create/update resources in a cluster from a file. <br>
![6](https://user-images.githubusercontent.com/81910142/123332429-c6828d80-d540-11eb-9c09-5861feb7b389.PNG)<br>
Kubectl will then create pods within the cluster. This can be verified with a command such as `kubectl get pods`</br>
Other resources that are created, such as namespace and services, can also be verified with commands such as `kubectl get namespaces` and `kubectl get services`<br>
![15](https://user-images.githubusercontent.com/81910142/123427874-74378000-d5c5-11eb-9806-a0cb7b40becd.PNG)<br>
LoadBalancer service in the test namespace makes it possible to reach pods that are running inside the cluster. Note that it isn't possible to reach the cluster from the outside using the CLUSTER-IP written in the output,but through the EXTERNAL-IP. Since this demo is using minikube, this parameter will stay in the pending state.<br>
minikube service [name] is a command which enables us to assign the EXTERNAL-IP address through which we can target the service, running inside the cluster.<br>
![9](https://user-images.githubusercontent.com/81910142/123427769-566a1b00-d5c5-11eb-9d9c-e86de715f096.PNG)<br>
This command will also automatically open a web browser, and access the service. This service will forward the request to one of the pods running inside the cluster.<br>
![10](https://user-images.githubusercontent.com/81910142/123423803-4c91e900-d5c0-11eb-861b-5cf93762c3f6.PNG)<br>
Ingress can be used to expose HTTP and HTTP routes from outside the cluster, to services running within the cluster. This can even be used in a local kubernetes cluster, such as this one. To use ingress, it is necessary to have an Ingress controller. Setting up an ingress controller for this demo in minikube is rather simple, through `minikube addons enable ingress` command.<br>
![12](https://user-images.githubusercontent.com/81910142/123425070-f160f600-d5c1-11eb-85d8-139fdd0f0eb9.PNG)<br>
Only after setting up the controller it is useful to define an ingress resource. This is once again possible with the `kubectl apply` command.<br>
![13](https://user-images.githubusercontent.com/81910142/123425780-d5aa1f80-d5c2-11eb-8769-02b6c966cfcf.PNG)<br>
Verification can be done with the `kubectl get ingress` command<br>
![14](https://user-images.githubusercontent.com/81910142/123426639-f161f580-d5c3-11eb-80a3-43804ff080be.PNG)<br>
Since the domain provided in the ingress resource file is not valid, one more thing needs to be done, before accessing it through the browser. This domain needs to be mapped in the /etc/hosts file to the IP address listed in the output of the `kubectl get ingress` command. Once that is done it is possible to access the cluster:<br>
![16](https://user-images.githubusercontent.com/81910142/123429131-e197e080-d5c6-11eb-95d3-13e71949e48b.PNG)<br>
Final part of this demo focuses on automation. Any push to site directory, within this repo, will trigger an automated build through GitHub Actions. A docker image will be created and pushed to DockerHub with the latest tag. The docker image is built from a Dockerfile in this repo. Once the image is in a public DockerHub repo, it will be reachable to all the pods running within the cluster.
