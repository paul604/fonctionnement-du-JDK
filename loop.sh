#!/bin/bash

# var
lib="lib"
slf4j_api=$lib"/slf4j-1.7.25/slf4j-api-1.7.25.jar"
slf4j_simple=$lib"/slf4j-1.7.25/slf4j-simple-1.7.25.jar"

project=""
url=""
sousUrl=""
mainClass=""
cp=""
tmp=""


#projet ban
non=( "aggregator_microservices" "api_gateway" "caching" "converter" "cqrs_app" "dao" "datamapper" "dependency_injection" "event_sourcing_app" "fluentinterface_app" "flux_app" "hexagonal" "layers" "module" "publish_subscribe" "reactor_app" "repository" "servicelayer_app" "specification_app" "message_channel")

echo "finding"
for file in $(find . -regex ".*java\-design\-patterns/.*/src/main/java/com/iluwatar/.*/App\.java"); do

  url=${file%"App.java"*}

  tmp=${file#*"iluwatar/"}   # remove prefix ending in "iluwatar"
  sousUrl=${tmp%"/App.java"*}   # remove suffix starting with "App.java"
  project=${sousUrl//\//_}

  tmp=${file#*"src/main/java/"}
  mainClass=${tmp%".java"*}

  cp=${file%"com/"*}

  if [ "${non[*]/$project/}" = "${non[*]}"  ]; then

    echo $project
    echo "    compil"

    if [ ! -e temp/$project ]; then
            mkdir temp/$project
    fi

    javac -classpath $slf4j_api $(find . -regex "$url.*\.java") -d temp/$project/
    echo "    jar"
    jar cfme jar/$project.jar jar/MANIFEST_LOOP.MF $mainClass -C temp/$project/ com

    echo "    ok"
  fi
done
