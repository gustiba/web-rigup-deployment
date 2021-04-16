# DEPLOYMENT POD BACKEND

resource "kubernetes_deployment" "backend" {
  metadata {
    name = "rigup-deployment-backend"
    labels = {
      app = var.app_name
    }
    namespace = var.namespace
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
          type = var.type_backend
        }
      }

      spec {
        container {
          image = "abitsugar/rigup_backend:0.3"
          name  = "rigup-cont-backend"

          port {
            container_port = 2000
          }

          env {
            name  = "DB_HOST"
            #value = kubernetes_service.db.metadata.name
            value = "rigup-service-db"
          }
          env {
            name  = "DB_USER"
            value = var.db_user
          }
          env {
            name  = "DB_PASSWORD"
            value = var.db_password
          }
          env {
            name  = "DB_NAME"
            value = var.db_name
          }

        }
      }
    }
  }
}

# DEPLOYMENT POD ADMINER

resource "kubernetes_deployment" "adminer" {
  metadata {
    name = "rigup-deployment-adminer"
    labels = {
      app = var.app_name
    }
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
          type = var.type_adminer
        }
      }

      spec {
        container {
          image = "adminer"
          name  = "rigup-cont-adminer"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

# DEPLOYMENT POD FRONTEND

resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "rigup-deployment-frontend"
    labels = {
      app = var.app_name
    }
    namespace = var.namespace
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
          type = var.type_frontend
        }
      }

      spec {
        container {
          image = "abitsugar/rigup_frontend:0.6"
          name  = "cont-rigup-frontend"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# DEPLOYMENT POD DB

resource "kubernetes_deployment" "db" {
  metadata {
    name = "rigup-deployment-db"
    labels = {
      app = var.app_name
    }
    namespace = var.namespace
  }

  spec {
    selector {
      match_labels = {
        app = var.app_name
      }
    }

    replicas = 1

    template {
      metadata {
        labels = {
          app = var.app_name
          type = var.type_db
        }
      }

      spec {
        container {
          image = "mariadb"
          name  = "rigup-cont-db"

          port {
            container_port = 3306
          }

          env {
              name  = "MYSQL_ROOT_PASSWORD"
              value = var.db_password
          }
          env {
              name = "MYSQL_DATABASE"
              value = var.db_name
          }
        }
      }
    }
  }
}