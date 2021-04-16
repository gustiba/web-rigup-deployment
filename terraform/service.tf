#SERVICE POD BACKEND
resource "kubernetes_service" "backend" {
  metadata {
    name = "rigup-service-backend"
    namespace = var.namespace
  }
  spec {
    selector = {
      #app = kubernetes_deployment.backend.metadata.0.match_labels.app
      app = var.app_name
      type = var.type_backend
    }
    #session_affinity = "ClientIP"
    port {
      port        = 2000
      target_port = 2000
      node_port = 30030
    }

    type = "NodePort"
  }
}

#SERVICE POD ADMINER
resource "kubernetes_service" "adminer" {
  metadata {
    name = "rigup-service-adminer"
    namespace = var.namespace
  }
  spec {
    selector = {
      #app = kubernetes_deployment.adminer.metadata.0.match_labels.app
      app = var.app_name
      type = var.type_adminer
    }
    #session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 8080
      node_port = 30031
    }

    type = "NodePort"
  }
}

#SERVICE POD FRONTEND
resource "kubernetes_service" "frontend" {
  metadata {
    name = "rigup-service-frontend"
    namespace = var.namespace
  }
  spec {
    selector = {
      #app = kubernetes_deployment.frontend.metadata.0.match_labels.app
      app = var.app_name
      type = var.type_frontend
    }
    #session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 80
      #node_port = 30032
    }

    type = "LoadBalancer"
  }
}

#SERVICE POD DB
resource "kubernetes_service" "db" {
  metadata {
    name = "rigup-service-db"
    namespace = var.namespace
  }
  spec {
    selector = {
      #app = kubernetes_deployment.frontend.metadata.0.match_labels.app
      app = var.app_name
      type = var.type_db
    }
    #session_affinity = "ClientIP"
    port {
      port        = 3306
      target_port = 3306
    }

    type = "ClusterIP"
  }
}
