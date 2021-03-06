#!/bin/bash
set -e

DIR=$1
if [ "$DIR" = ""  ];then
    DIR=.
fi

POM=$DIR/pom.xml

echo "Add repos in $POM"

sed -i -e "s@<repositories>@<repositories><repository><id>private-snapshots</id><url>https://nexus.ik.am:8443/repository/maven-central/</url><snapshots><enabled>true</enabled></snapshots></repository><repository><id>private-releases</id><url>https://nexus.ik.am:8443/repository/maven-central/</url><snapshots><enabled>false</enabled></snapshots></repository>@" $POM
sed -i -e "s@<pluginRepositories>@<pluginRepositories><pluginRepository><id>private-snapshots</id><url>https://nexus.ik.am:8443/repository/maven-central/</url><snapshots><enabled>true</enabled></snapshots></pluginRepository><pluginRepository><id>private-releases</id><url>https://nexus.ik.am:8443/repository/maven-central/</url><snapshots><enabled>false</enabled></snapshots></pluginRepository>@" $POM
