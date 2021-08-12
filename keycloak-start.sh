docker network create keycloak-network

docker run -d --name postgres --net keycloak-network -e POSTGRES_DB=keycloak -e POSTGRES_USER=keycloak -e POSTGRES_PASSWORD=password postgres

docker run -p 8080:8080 --name keycloak --net keycloak-network \
    -e DB_USER=keycloak -e DB_PASSWORD=password \
    -e DB_VENDOR=POSTGRES \
    -e JDBC_PARAMS='connectTimeout=60' \
    -e DB_ADDR=postgres \
    -e DB_DATABASE=keycloak \
    -e KEYCLOAK_USER=keycloak \
    -e KEYCLOAK_PASSWORD=password \
    -e PROXY_ADDRESS_FORWARDING=true \
    quay.io/keycloak/keycloak