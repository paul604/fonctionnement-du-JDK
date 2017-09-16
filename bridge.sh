#!/bin/bash

# var     bridge
project="bridge"
lib="lib"
slf4j_api=$lib"/slf4j-1.7.25/slf4j-api-1.7.25.jar"
slf4j_simple=$lib"/slf4j-1.7.25/slf4j-simple-1.7.25.jar"


# 2
echo "Q2"
if [ ! -f temp/$project ]; then
        mkdir temp/$project
        # mkdir temp/bridge
fi
javac -classpath $slf4j_api java-design-patterns/$project/src/main/java/com/iluwatar/$project/*.java -d temp/$project/
# javac -classpath lib/slf4j-1.7.25/slf4j-api-1.7.25.jar java-design-patterns/bridge/src/main/java/com/iluwatar/bridge/*.java -d temp/bridge/

# 3
echo "Q3"
java -classpath $slf4j_simple:$slf4j_api:temp/$project/ com/iluwatar/$project/App
# java -classpath lib/slf4j-1.7.25/slf4j-simple-1.7.25.jar:lib/slf4j-1.7.25/slf4j-api-1.7.25.jar:temp/bridge/ com/iluwatar/bridge/App

# 4
echo "Q4"
jar cf jar/$project.jar -C temp/$project/ com
# jar cf jar/bridge.jar -C temp/bridge/ com

java -cp jar/*:$slf4j_simple:$slf4j_api com/iluwatar/$project/App
# java -cp jar/*:lib/slf4j-1.7.25/slf4j-simple-1.7.25.jar:lib/slf4j-1.7.25/slf4j-api-1.7.25.jar com/iluwatar/$project/App

# 5
echo "Q5"
jar cfm jar/$project.jar jar/MANIFEST.MF -C temp/$project/ com
# jar cfm jar/bridge.jar jar/MANIFEST.MF -C temp/bridge/ com

java -jar jar/$project.jar
# java -jar jar/bridge.jar

# 6
echo "Q6"
jar cmf jar/MANIFEST.MF jar/$project.jar -C temp/$project/ com -C java-design-patterns/$project/ src/main
# jar cmf jar/MANIFEST.MF jar/bridge.jar -C temp/ com -C java-design-patterns/bridge/ src/main
