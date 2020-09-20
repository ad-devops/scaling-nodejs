## Assumption !
 - EKS cluster is up and running
 - NFS storage class and metrics server is deployed in Amazon EKS clusters as well.



## Steps to setup the nodejs scaling app with Terraform

- To setup the app using terraform run following commands
```
  terraform init
  terraform plan 
  terraform apply -auto-approve
```


- To destroy cluster 
```
  terraform destroy -auto-approve
```
