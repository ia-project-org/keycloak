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
ENV KC_DB_URL=jdbc:postgresql://dpg-ctkvo1tds78s73c328p0-a.oregon-postgres.render.com:5432/citythrillsdb
ENV KC_DB_USERNAME=citythrillsdb_user
ENV KC_DB_PASSWORD=YVXb8u1Uj7QP8YDMJdHC8r3Y1nvKYnVz
ENV KC_DB_URL_HOST=dpg-ctkvo1tds78s73c328p0-a
ENV KC_DB_URL_PORT=5432
ENV KC_DB_URL_DATABASE=citythrillsdb
ENV KC_HOSTNAME=keycloak-kv68.onrender.com
# Exposer le port 8080
EXPOSE 8080

# Construire d'abord en mode optimisé
RUN /opt/keycloak/bin/kc.sh build

# Démarrer Keycloak en mode production
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]