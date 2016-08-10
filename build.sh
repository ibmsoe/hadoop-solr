#!/bin/bash
set -ex
mkdir deps
cd deps
wget  https://github.com/ibmsoe/leveldbjni/releases/download/leveldbjni-1.8/leveldbjni-all-1.8.jar
mvn install:install-file -Dfile=leveldbjni-all-1.8.jar -DgroupId=org.fusesource.leveldbjni -DartifactId=leveldbjni-all -Dversion=1.8 -Dpackaging=jar
wget https://github.com/ibmsoe/snappy-java/releases/download/snappy-java-1.0.4.1/snappy-java-1.0.4.1.jar
mvn install:install-file -Dfile=snappy-java-1.0.4.1.jar -DgroupId=org.xerial.snappy -DartifactId=snappy-java -Dversion=1.0.4.1 -Dpackaging=jar
cd ..
rm -rf deps

git submodule init
git submodule update
./gradlew clean shadowJar --info
