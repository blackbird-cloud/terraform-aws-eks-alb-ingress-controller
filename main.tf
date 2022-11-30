locals {
  name = "aws-load-balancer-controller"
}

resource "helm_release" "alb_ingress_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  cleanup_on_fail = true
  version         = "1.4.1"

  values = [
    templatefile("template.yaml",
      {
        cluster_name         = var.cluster_name
        role_arn             = module.iam_role.iam_role_arn
        service_account_name = local.name
        aws_region           = var.aws_region
        vpc_id               = var.vpc_id
      }
    )
  ]
}
