@echo off
cls

:: var
set project="bridge"
set lib="lib"
set slf4j_api=%lib%"/slf4j-1.7.25/slf4j-api-1.7.25.jar"
set slf4j_simple=%lib%"/slf4j-1.7.25/slf4j-simple-1.7.25.jar"


echo "Q2"
if  not exist "temp/%project%" (
        mkdir "temp/%project%"
)
javac -classpath %slf4j_api% java-design-patterns/%project%/src/main/java/com/iluwatar/%project%/*.java -d temp/%project%/

echo "Q3"
java -classpath %slf4j_simple%:%slf4j_api%:temp/%project%/ com/iluwatar/%project%/App

echo "Q4"
jar cf jar/%project%.jar -C temp/%project%/ com

java -cp jar/*:%slf4j_simple%:%slf4j_api% com/iluwatar/%project%/App

echo "Q5"
jar cfm jar/%project%.jar jar/MANIFEST.MF -C temp/%project%/ com

java -jar jar/%project%.jar

echo "Q6"
jar cmf jar/MANIFEST.MF jar/%project%.jar -C temp/%project%/ com -C java-design-patterns/%project%/ src/main

pause
