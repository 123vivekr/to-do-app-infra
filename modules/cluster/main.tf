output "endpoint" {
  value = aws_eks_cluster.to_do_app_cluster.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.to_do_app_cluster.certificate_authority[0].data
}

# provider "kubernetes" {
#   host                   = aws_eks_cluster.to_do_app_cluster.endpoint
#   cluster_ca_certificate = base64decode(aws_eks_cluster.to_do_app_cluster.certificate_authority[0].data)
#   exec {
#     api_version = "client.authentication.k8s.io/v1alpha1"
#     args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.to_do_app_cluster.name]
#     command     = "aws"
#   }
# }


# resource "kubernetes_deployment" "to_do_app" {
#   metadata {
#     name = "to-do-app"
#     namespace = "to-do-app"
#     labels = {
#       app = "to_do_app"
#     }
#   }

#   spec {
#     replicas = 2

#     selector {
#       match_labels = {
#         app = "to_do_app"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "to_do_app"
#         }
#       }

#       spec {
#         container {
#           name  = "to_do_app"
#           image = "230273005112.dkr.ecr.ap-south-1.amazonaws.com/todo_app_vivek_anjith:f30c2d"

#           liveness_probe {
#             http_get {
#               path = "/"
#               port = 80
#             }

#             initial_delay_seconds = 3
#             period_seconds        = 3
#           }

#           port {
#             name = "web"
#             container_port = 80
#           }
#         }

#         image_pull_secrets {
#           name = "regcred"
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "to_do_app" {
#   metadata {
#     name = "to-do-app"
#     namespace = "to-do-app"
#     labels = {
#       app = "to_do_app"
#     }
#   }
#   spec {
#     selector = {
#       app = kubernetes_deployment.to_do_app.metadata.0.labels.app
#     }
#     session_affinity = "ClientIP"
#     port {
#       protocol = "TCP"
#       port        = 80
#       target_port = kubernetes_deployment.to_do_app.spec[0].template[0].spec[0].container[0].port[0].container_port
#     }

#     type = "LoadBalancer"
#   }
# }

# resource "kubernetes_namespace" "to_do_app" {
#   metadata {
#     annotations = {
#       name = "to_do_app"
#     }

#     labels = {
#       app = "to_do_app"
#     }

#     name = "to-do-app"
#   }
# }