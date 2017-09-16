@echo off
cls

:: var
set lib="lib"
set slf4j_api=%lib%"/slf4j-1.7.25/slf4j-api-1.7.25.jar"
set slf4j_simple=%lib%"/slf4j-1.7.25/slf4j-simple-1.7.25.jar"

set project=""
set url=""
set sousUrl=""
set mainClass=""
set cp=""
set tmp=""


::projet ban
REM set non=( "aggregator_microservices" "api_gateway" "caching" "converter" "cqrs_app" "dao" "datamapper" "dependency_injection" "event_sourcing_app" "fluentinterface_app" "flux_app" "hexagonal" "layers" "module" "publish_subscribe" "reactor_app" "repository" "servicelayer_app" "specification_app" "message_channel")

echo "finding"
for /r %%f in ('dir java-design-patterns\*\src\main\java\com\iluwatar\*\App.java /A:-D /A:-A /S') do (
  echo %%f
  REM url=${file%"App.java"*}
  REM
  REM tmp=${file#*"iluwatar/"}   # remove prefix ending in "iluwatar"
  REM sousUrl=${tmp%"/App.java"*}   # remove suffix starting with "App.java"
  REM project=${sousUrl//\//_}
  REM
  REM tmp=${file#*"src/main/java/"}
  REM mainClass=${tmp%".java"*}
  REM
  REM cp=${file%"com/"*}
  REM
  REM if [ "${non[*]/$project/}" = "${non[*]}"  ]; then
  REM
  REM   echo %project%
  REM   echo "    compil"
  REM
  REM   if [ not exist "temp/%project%" ](
  REM           mkdir "temp/%project%"
  REM   )
  REM
  REM   javac -classpath $slf4j_api $(find . -regex "$url.*\.java") -d temp/$project/
  REM   echo "    jar"
  REM   jar cfme jar/$project.jar jar/MANIFEST_LOOP.MF $mainClass -C temp/$project/ com
  REM
  REM   echo "    ok"
  REM fi
)

pause
