# Strong random password
# resource "random_password" "postgres" {
#   length  = 16
#   special = true
# }

# Namespace for DB
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }

  depends_on = [google_container_cluster.default]
}

# argocd Helm chart
resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
}
