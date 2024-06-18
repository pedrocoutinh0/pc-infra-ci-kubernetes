module "prod" {
    source = "../../infra"
    
    cluster_name = "eks-cluster"
}

output "IP_db" {
  value = module.prod.IP
}
