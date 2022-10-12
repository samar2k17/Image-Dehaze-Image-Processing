
Dark Channel Haze Removal
=========================

MATLAB implementation of "[Single Image Haze Removal Using Dark Channel Prior]"

	Single Image Haze Removal Using Dark Channel Prior using guided filter

<img src="https://github.com/samar2k17/Image-Dehaze-Image-Processing/blob/main/Image-Haze-Removal-using-Dark-Channel-Prior-master/Source%20Images/Capture.PNG"/>
&nbsp;

               
 [~]
 sam  minikube start
😄  minikube v1.27.0 on Ubuntu 22.04
❗  Kubernetes 1.25.0 has a known issue with resolv.conf. minikube is using a workaround that should work for most use cases.
❗  For more information, see: https://github.com/kubernetes/kubernetes/issues/112135
🎉  minikube 1.27.1 is available! Download it: https://github.com/kubernetes/minikube/releases/tag/v1.27.1
💡  To disable this notice, run: 'minikube config set WantUpdateNotification false'

✨  Using the docker driver based on existing profile
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
🔄  Restarting existing docker container for "minikube" ...
🐳  Preparing Kubernetes v1.25.0 on Docker 20.10.17 ...
🔎  Verifying Kubernetes components...
    ▪ Using image k8s.gcr.io/ingress-nginx/controller:v1.2.1
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
    ▪ Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
    ▪ Using image k8s.gcr.io/ingress-nginx/kube-webhook-certgen:v1.1.1
🔎  Verifying ingress addon...
🌟  Enabled addons: default-storageclass, storage-provisioner, ingress
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
               
 [~]
 sam  kubectl -n kube-system create serviceaccount tiller
serviceaccount/tiller created
               
 [~]
 sam  kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
clusterrolebinding.rbac.authorization.k8s.io/tiller created
               
 [~]
 sam  helm init --service-account tiller
Error: unknown command "init" for "helm"

Did you mean this?
	lint

Run 'helm --help' for usage.
               
 [~]
 ✘  sam  helm lint --service-account tiller
Error: unknown flag: --service-account
               
 [~]
 ✘  sam  helm create --service-account tiller
Error: unknown flag: --service-account
               
 [~]
 ✘  sam  helm version                        
version.BuildInfo{Version:"v3.10.0", GitCommit:"ce66412a723e4d89555dc67217607c6579ffcb21", GitTreeState:"clean", GoVersion:"go1.18.6"}
               
 [~]
 sam  kubectl create secret generic drone-server-secrets --namespace=default --from-literal=clientSecret="2be14d8ac4f5a8ef3b6421144404c051ee7377a9"
secret/drone-server-secrets created
               
 [~]
 sam  helm install --name drone-release stable/drone
Error: unknown flag: --name
               
 [~]
 ✘  sam  helm install drone-release stable/drone
Error: INSTALLATION FAILED: repo stable not found
               
 [~]
 ✘  sam  helm install --name my-release stable/drone~  
Error: unknown flag: --name
               
 [~]
 ✘  sam  helm install  my-release stable/drone~ 
Error: INSTALLATION FAILED: repo stable not found
               
 [~]
 ✘  sam  helm repo add stable https://charts.helm.sh/stable
"stable" has been added to your repositories
               
 [~]
 sam  helm install  my-release stable/drone~            
Error: INSTALLATION FAILED: chart "drone~" matching  not found in stable index. (try 'helm repo update'): no chart name found
               
 [~]
 ✘  sam  helm install  my-release stable/drone 
WARNING: This chart is deprecated
NAME: my-release
LAST DEPLOYED: Wed Oct 12 21:14:04 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
##############################################################################
This chart has been deprecated in favor of the official Drone chart:
https://github.com/drone/charts
############################################################################################################################################################
####        ERROR: You did not set a valid version control provider       ####
##############################################################################

This deployment will be incomplete until you configure a valid version
control provider:

    kubectl create secret generic drone-server-secrets \
      --namespace=default \
      --from-literal=clientSecret="github-oauth2-client-secret"

    helm upgrade my-release \
      --reuse-values \
      --set 'sourceControl.provider=github' \
      --set 'sourceControl.github.clientID=github-oauth2-client-id' \
      --set 'sourceControl.secret=drone-server-secrets' \
      stable/drone

Currently supported providers:

    - GitHub
    - GitLab
    - Gitea
    - Gogs
    - Bitbucket Cloud
    - Bitbucket Server (Stash)

See the values.yaml file to see what values are required for each provider.

If you are having trouble with the configuration of a provider please visit
the official documentation:

    http://docs.drone.io/installation/
               
 [~]
 sam  helm upgrade drone --reuse-values --set 'service.type=NodePort' --set 'service.nodePort=32000' --set 'sourceControl.provider=github' --set 'sourceControl.github.clientID=0cb6e52e26befec35a3e' --set 'sourceControl.secret=drone-server-secrets' stable/drone
WARNING: This chart is deprecated
Error: UPGRADE FAILED: "drone" has no deployed releases
               
 [~]
 ✘  sam  helm upgrade drone-release --reuse-values --set 'service.type=NodePort' --set 'service.nodePort=32000' --set 'sourceControl.provider=github' --set 'sourceControl.github.clientID=0cb6e52e26befec35a3e' --set 'sourceControl.secret=drone-server-secrets' stable/drone
WARNING: This chart is deprecated
Error: UPGRADE FAILED: "drone-release" has no deployed releases
               
 [~]
 ✘  sam  helm upgrade drone --reuse-values --set 'service.type=NodePort' --set 'service.nodePort=32000' --set 'sourceControl.provider=github' --set 'sourceControl.github.clientID=6cbe13d421936a085f9f' --set 'sourceControl.secret=drone-server-secrets' stable/drone
WARNING: This chart is deprecated
               
 [~]
 ✘  sam  helm upgrade drone --reuse-values --set 'service.type=NodePort' --set 'service.nodePort=32000' --set 'sourceControl.provider=github' --set 'sourceControl.github.clientID=6cbe13d421936a085f9f' --set 'sourceControl.secret=drone-server-secrets' stable/drone
WARNING: This chart is deprecated
Error: UPGRADE FAILED: "drone" has no deployed releases
               
 [~]
 ✘  sam  helm status drone
Error: release: not found
               
 [~]
 ✘  sam  helm ls                           
NAME      	NAMESPACE	REVISION	UPDATED                                	STATUS  	CHART      	APP VERSION
my-release	default  	1       	2022-10-12 21:14:04.568783602 +0530 IST	deployed	drone-2.7.2	1.6.5      
               
 [~]
 sam  helm status my-release
NAME: my-release
LAST DEPLOYED: Wed Oct 12 21:14:04 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
##############################################################################
This chart has been deprecated in favor of the official Drone chart:
https://github.com/drone/charts
############################################################################################################################################################
####        ERROR: You did not set a valid version control provider       ####
##############################################################################

This deployment will be incomplete until you configure a valid version
control provider:

    kubectl create secret generic drone-server-secrets \
      --namespace=default \
      --from-literal=clientSecret="github-oauth2-client-secret"

    helm upgrade my-release \
      --reuse-values \
      --set 'sourceControl.provider=github' \
      --set 'sourceControl.github.clientID=github-oauth2-client-id' \
      --set 'sourceControl.secret=drone-server-secrets' \
      stable/drone

Currently supported providers:

    - GitHub
    - GitLab
    - Gitea
    - Gogs
    - Bitbucket Cloud
    - Bitbucket Server (Stash)

See the values.yaml file to see what values are required for each provider.

If you are having trouble with the configuration of a provider please visit
the official documentation:

    http://docs.drone.io/installation/
               
 [~]
 sam  helm upgrade my-release \
      --reuse-values \
      --set 'sourceControl.provider=github' \
      --set 'sourceControl.github.clientID=github-oauth2-client-id' \
      --set 'sourceControl.secret=drone-server-secrets' \
      stable/drone

WARNING: This chart is deprecated
Release "my-release" has been upgraded. Happy Helming!
NAME: my-release
LAST DEPLOYED: Wed Oct 12 21:18:47 2022
NAMESPACE: default
STATUS: deployed
REVISION: 2
TEST SUITE: None
NOTES:
##############################################################################
This chart has been deprecated in favor of the official Drone chart:
https://github.com/drone/charts
##############################################################################
*********************************************************************************
***        PLEASE BE PATIENT: drone may take a few minutes to install         ***
*********************************************************************************

Get the Drone URL by running:
  export POD_NAME=$(kubectl get pods -n default -l "component=server,app=drone,release=my-release" -o jsonpath="{.items[0].metadata.name}")
  echo http://127.0.0.1:8000/
  kubectl -n default port-forward $POD_NAME 8000:80
               
 [~]
 sam  kubectl get node -o wide                                                                                                                     
NAME       STATUS   ROLES           AGE    VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
minikube   Ready    control-plane   2d3h   v1.25.0   192.168.49.2   <none>        Ubuntu 20.04.5 LTS   5.15.0-48-generic   docker://20.10.17
               
 [~]
 sam  kubectl get pod         
NAME                                       READY   STATUS    RESTARTS   AGE
my-release-drone-server-794f5587f9-qlzns   1/1     Running   0          111s
               
 [~]
 sam  kubectl get svc   
NAME               TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
kubernetes         ClusterIP   10.96.0.1        <none>        443/TCP   2d4h
my-release-drone   ClusterIP   10.106.227.198   <none>        80/TCP    7m7s
               
 [~]
 sam  kubectl get ing   
No resources found in default namespace.
               
 [~]
 sam  helm upgrade my-release \
      --reuse-values \
      --set 'sourceControl.provider=github' \
      --set 'sourceControl.github.clientID=github-oauth2-client-id' \
      --set 'sourceControl.secret=drone-server-secrets' \
      stable/drone

WARNING: This chart is deprecated
Release "my-release" has been upgraded. Happy Helming!
NAME: my-release
LAST DEPLOYED: Wed Oct 12 21:22:10 2022
NAMESPACE: default
STATUS: deployed
REVISION: 3
TEST SUITE: None
NOTES:
##############################################################################
This chart has been deprecated in favor of the official Drone chart:
https://github.com/drone/charts
##############################################################################
*********************************************************************************
***        PLEASE BE PATIENT: drone may take a few minutes to install         ***
*********************************************************************************

Get the Drone URL by running:
  export POD_NAME=$(kubectl get pods -n default -l "component=server,app=drone,release=my-release" -o jsonpath="{.items[0].metadata.name}")
  echo http://127.0.0.1:8000/
  kubectl -n default port-forward $POD_NAME 8000:80
               
 [~]
 sam  helm upgrade my-release \                                   
      --reuse-values \
      --set 'service.type=NodePort' --set 'service.nodePort=32000'\--set 'sourceControl.provider=github' \
      --set 'sourceControl.github.clientID=github-oauth2-client-id' \
      --set 'sourceControl.secret=drone-server-secrets' \
      stable/drone

Error: "helm upgrade" requires 2 arguments

Usage:  helm upgrade [RELEASE] [CHART] [flags]
               
 [~]
 ✘  sam  helm upgrade my-release \
      --reuse-values \
      --set 'service.type=NodePort' --set 'service.nodePort=32000' --set 'sourceControl.provider=github' \
      --set 'sourceControl.github.clientID=github-oauth2-client-id' \
      --set 'sourceControl.secret=drone-server-secrets' \
      stable/drone

WARNING: This chart is deprecated
Release "my-release" has been upgraded. Happy Helming!
NAME: my-release
LAST DEPLOYED: Wed Oct 12 21:23:39 2022
NAMESPACE: default
STATUS: deployed
REVISION: 4
TEST SUITE: None
NOTES:
##############################################################################
This chart has been deprecated in favor of the official Drone chart:
https://github.com/drone/charts
##############################################################################
*********************************************************************************
***        PLEASE BE PATIENT: drone may take a few minutes to install         ***
*********************************************************************************

Get the Drone URL by running:
  export NODE_PORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services my-release-drone)
  export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT/
               
 [~]
 sam  kubectl get svc
NAME               TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes         ClusterIP   10.96.0.1        <none>        443/TCP        2d4h
my-release-drone   NodePort    10.106.227.198   <none>        80:32000/TCP   9m41s
               
 [~]
 sam  kubectl get ing
No resources found in default namespace.
               
 [~]
 sam  kubectl get node -o wide
NAME       STATUS   ROLES           AGE    VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE             KERNEL-VERSION      CONTAINER-RUNTIME
minikube   Ready    control-plane   2d4h   v1.25.0   192.168.49.2   <none>        Ubuntu 20.04.5 LTS   5.15.0-48-generic   docker://20.10.17
               
 [~]
 sam  export NODE_PORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services my-release-drone)
               
 [~]
 sam  export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
               
 [~]
 sam  echo http://$NODE_IP:$NODE_PORT/
http://192.168.49.2:32000/
               
 [~]
 sam  curl 192.168.49.2:32000
<!DOCTYPE html><html lang=en><head><meta charset=utf-8><meta http-equiv=X-UA-Compatible content="IE=edge"><meta name=viewport content="width=device-width,initial-scale=1,user-scalable=0"><link id=favicon rel=icon href=/favicon.png type=image/png><title>Drone | Continuous Integration</title><link href=/css/app.835f40e0.css rel=preload as=style><link href=/js/app.2c99ed98.js rel=preload as=script><link href=/js/chunk-vendors.f5840117.js rel=preload as=script><link href=/css/app.835f40e0.css rel=stylesheet></head><body><noscript><strong>We're sorry but Drone does not work properly without JavaScript enabled. Please enable it to continue.</strong></noscript><div id=app></div><script src=/js/chunk-vendors.f5840117.js></script><script src=/js/app.2c99ed98.js></script></body></html>%                                                          
 [~]
 sam  helm upgrade drone-release --reuse-values --set 'server.host=http://192.168.49.2:32000' stable/drone
WARNING: This chart is deprecated
Error: UPGRADE FAILED: "drone-release" has no deployed releases
               
 [~]
 ✘  sam  kubectl get dep         
error: the server doesn't have a resource type "dep"
               
 [~]
 ✘  sam  kubectl get deploy   
NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
my-release-drone-server   1/1     1            1           7m38s
               
 [~]
 sam  helm upgrade my-release --reuse-values --set 'server.host=http://192.168.49.2:32000' stable/drone
WARNING: This chart is deprecated
Release "my-release" has been upgraded. Happy Helming!
NAME: my-release
LAST DEPLOYED: Wed Oct 12 21:27:02 2022
NAMESPACE: default
STATUS: deployed
REVISION: 5
TEST SUITE: None
NOTES:
##############################################################################
This chart has been deprecated in favor of the official Drone chart:
https://github.com/drone/charts
##############################################################################
*********************************************************************************
***        PLEASE BE PATIENT: drone may take a few minutes to install         ***
*********************************************************************************

Get the Drone URL by running:
  export NODE_PORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services my-release-drone)
  export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT/
               
 [~]
 sam  helm upgrade my-release \                                                                        
      --reuse-values \
      --set 'service.type=NodePort' --set 'service.nodePort=32000' --set 'sourceControl.provider=github' \
      --set 'sourceControl.github.clientID=6cbe13d421936a085f9f' \
      --set 'sourceControl.secret=drone-server-secrets' \
      stable/drone

WARNING: This chart is deprecated
Release "my-release" has been upgraded. Happy Helming!
NAME: my-release
LAST DEPLOYED: Wed Oct 12 21:29:36 2022
NAMESPACE: default
STATUS: deployed
REVISION: 6
TEST SUITE: None
NOTES:
##############################################################################
This chart has been deprecated in favor of the official Drone chart:
https://github.com/drone/charts
##############################################################################
*********************************************************************************
***        PLEASE BE PATIENT: drone may take a few minutes to install         ***
*********************************************************************************

Get the Drone URL by running:
  export NODE_PORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services my-release-drone)
  export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT/
               
 [~]
 sam  helm upgrade my-release --reuse-values --set 'server.host=http://192.168.49.2:32000' stable/drone
WARNING: This chart is deprecated
Release "my-release" has been upgraded. Happy Helming!
NAME: my-release
LAST DEPLOYED: Wed Oct 12 21:29:50 2022
NAMESPACE: default
STATUS: deployed
REVISION: 7
TEST SUITE: None
NOTES:
##############################################################################
This chart has been deprecated in favor of the official Drone chart:
https://github.com/drone/charts
##############################################################################
*********************************************************************************
***        PLEASE BE PATIENT: drone may take a few minutes to install         ***
*********************************************************************************

Get the Drone URL by running:
  export NODE_PORT=$(kubectl get -o jsonpath="{.spec.ports[0].nodePort}" services my-release-drone)
  export NODE_IP=$(kubectl get nodes -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT/
               
 [~]
 sam  minikube stop 
✋  Stopping node "minikube"  ...
🛑  Powering off "minikube" via SSH ...
^A🛑  1 node stopped.
