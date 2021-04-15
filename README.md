# Prostředí pro DEMOS web

Prostředí pro běh webových stránek projektu DEMOS je definováno v [Dockerfile](docker/Dockerfile).

## Vytvoření Image prostředí

```bash
./docker/build.bash
```

Je důležité skript volat ze stejného adresáře, kde je adresář `docker`.

## Deploy

Stačí spustit kontejner s nabindovaným socketem pro komunikaci s databází a směrovaným portem, na kterém web DEMOS poběží.

```bash
docker run \
    -d \
    -v /cesta/demos/www/stránek/:/var/www/html:rw \
    -v /var/run/mysqld/mysqld.sock:/tmp/mysql.sock \
    -p50042:80 \
    demos:1.0
```

Ukázka deploymentu je v `run.bash`.
