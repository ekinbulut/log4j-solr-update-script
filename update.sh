#!/bin/sh
echo "version:$1"

wget https://dlcdn.apache.org/logging/log4j/$1/apache-log4j-$1-bin.tar.gz --no-check-certificate

tar -czvf /home/$USER/log4j_bakcup.tar.gz /opt/solr-8.4.1/server/lib/ext/
tar -xzf /home/$USER/apache-log4j-$1-bin.tar.gz

cp apache-log4j-$1-bin/log4j-slf4j-impl-$1.jar /opt/solr-8.4.1/server/lib/ext/
cp apache-log4j-$1-bin/log4j-core-$1.jar /opt/solr-8.4.1/server/lib/ext/
cp apache-log4j-$1-bin/log4j-api-$1.jar /opt/solr-8.4.1/server/lib/ext/
cp apache-log4j-$1-bin/log4j-1.2-api-$1.jar /opt/solr-8.4.1/server/lib/ext/
cp apache-log4j-$1-bin/log4j-web-$1.jar /opt/solr-8.4.1/server/lib/ext/

rm -f /opt/solr-8.4.1/server/lib/ext/log4j-web-2.11.2.jar /opt/solr-8.4.1/server/lib/ext/log4j-1.2-api-2.11.2.jar /opt/solr-8.4.1/server/lib/ext/log4j-api-2.11.2.jar /opt/solr-8.4.1/server/lib/ext/log4j-core-2.11.2.jar /opt/solr-8.4.1/server/lib/ext/log4j-slf4j-impl-2.11.2.jar

cp apache-log4j-$1-bin/log4j-slf4j-impl-$1.jar /opt/solr-8.4.1/contrib/prometheus-exporter/lib/
cp apache-log4j-$1-bin/log4j-core-$1.jar /opt/solr-8.4.1/contrib/prometheus-exporter/lib/
cp apache-log4j-$1-bin/log4j-api-$1.jar /opt/solr-8.4.1/contrib/prometheus-exporter/lib/

rm -f /opt/solr-8.4.1/contrib/prometheus-exporter/lib/log4j-api-2.11.2.jar /opt/solr-8.4.1/contrib/prometheus-exporter/lib/log4j-core-2.11.2.jar /opt/solr-8.4.1/contrib/prometheus-exporter/lib/log4j-slf4j-impl-2.11.2.jar
rm -rf apache-log4j-$1-bin apache-log4j-$1-bin.tar.gz

echo "###### UPDATED FOLDERS #######"
find / -iname "*log4j*.jar"

service solr restart
