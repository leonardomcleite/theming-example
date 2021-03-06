#!/bin/bash
HOSTNAME=$(hostname)
echo "${HOSTNAME}"

function reset() {
    echo "# Removendo imagens anteriores..."
    echo

    if [[ "$HOSTNAME" == "servidor-all-knowledge" ]]; then
        cd ~/projetos/theming-example
    else
        cd ~/Projetos/Pessoal/theming-example
    fi

    echo "rm -rf node_modules/"
    rm -rf node_modules/

    echo "rm -rf package-lock.json"
    rm -rf package-lock.json

    echo "rm -rf docs/docker/dist"
    rm -rf docs/docker/dist

    echo "docker rm --force /theming-example"
    docker rm --force /theming-example

    echo
    echo "SUCCESS RESET"
}

function deploy() {
    echo
    echo "# Deployando a aplicacao..."
    echo

    echo "npm install"
    npm install

    echo "npm run buildprod"
    npm run buildprod

    echo "... Realizando o build no docker: docker build -t theming-example docs/docker/ "
    docker build -t theming-example docs/docker/

    echo "... subindo container build no docker: docker run -d --name theming-example -it -p 80:80/tcp --privileged=true --env-file=docs/docker-conf/APP.env theming-example"
    # docker run -d -p 80:80/tcp --privileged=true --env-file=docs/docker-conf/APP.env theming-example
    docker run -d --name theming-example -it -p 80:80/tcp --privileged=true --env-file=docs/docker-conf/APP.env theming-example

    echo
    echo "SUCCESS BUILD"
}

reset
deploy