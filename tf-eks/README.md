```
( cd eks && terraform init && terraform apply -auto-approve )
( cd kubernetes_resources && terraform init && terraform apply -auto-approve )
( cd eks && terraform destroy -auto-approve )
( cd kubernetes_resources && terraform destroy -auto-approve )
```

My idea was to use AWS provider [1] to create EKS cluster and kubernetes provider [2] to create namespaces. Probably the trickiest part here is how to create namespaces together with EKS cluster. My best judjement is that the best way is to actually avoid having EKS resource in the same module and even more in the same TF state.

Problems:

- it's not generally recommended to define providers within modules [3]
- particularly the combination of managed kubernetes services (EKS/AKS/GKE) + kubernetes provider within the same state s known to be a source of "intermittent and unpredictable errors" [4][5]



[1] https://registry.terraform.io/providers/hashicorp/aws/latest/docs
[2] https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs
[3] https://developer.hashicorp.com/terraform/language/modules/develop/providers#legacy-shared-modules-with-provider-configurations
[4] https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs#stacking-with-managed-kubernetes-cluster-resources
[5] https://github.com/hashicorp/terraform-provider-kubernetes/blob/main/_examples/eks/README.md
