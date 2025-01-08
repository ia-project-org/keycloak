# Dockerfile
FROM quay.io/keycloak/keycloak:latest

# Configuration de l'environnement
ENV KC_BOOTSTRAP_ADMIN_USERNAME=admin
ENV KC_BOOTSTRAP_ADMIN_PASSWORD=admin_password
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_CACHE=local
ENV KC_CACHE_STACK=local
ENV KC_DB=postgres

# Exposer le port 8080
EXPOSE 8080

# Construire d'abord en mode optimisé
RUN /opt/keycloak/bin/kc.sh build

# Démarrer Keycloak en mode production
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]