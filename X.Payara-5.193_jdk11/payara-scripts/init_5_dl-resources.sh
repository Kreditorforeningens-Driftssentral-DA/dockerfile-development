#!/bin/bash
set -x
export ACTIVEMQ_RAR_VER='5.15.9'
export JDBC_POSTGRES_VER='42.2.8'
export JDBC_MMSQL_VER='7.4.1.0'
export JDBC_MMSQL_URL='https://download.microsoft.com/download/6/9/9/699205CA-F1F1-4DE9-9335-18546C5C8CBD/sqljdbc_7.4.1.0_enu.tar.gz'
export LOGBACK_VER='1.0.13'
export SIMPLE_LOG_VER='1.7.25'

echo '----- CUSTOM START Downloading files..'
#                                                      Microsoft SQL JDBC driver
# ------------------------------------------------------------------------------
wget -qO /tmp/sqljdbc_${JDBC_MMSQL_VER}_enu.tar.gz ${JDBC_MMSQL_URL}
tar xzC /tmp/ -f /tmp/sqljdbc_${JDBC_MMSQL_VER}_enu.tar.gz
mv /tmp/sqljdbc_${JDBC_MMSQL_VER}/enu/mssql-jdbc-7.4.1.jre11.jar /opt/payara/appserver/glassfish/domains/production/lib/
rm -rf /tmp/sqljdbc*

#                                                         PostgreSQL JDBC driver
# ------------------------------------------------------------------------------
wget -qO /opt/payara/appserver/glassfish/domains/production/lib/postgresql-${JDBC_POSTGRES_VER}.jar https://jdbc.postgresql.org/download/postgresql-${JDBC_POSTGRES_VER}.jar

#                                                                    Log drivers
# ------------------------------------------------------------------------------
wget -qO /opt/payara/appserver/glassfish/domains/production/lib/logback-classic-${LOGBACK_VER}.jar https://repo1.maven.org/maven2/ch/qos/logback/logback-classic/${LOGBACK_VER}/logback-classic-${LOGBACK_VER}.jar
wget -qO /opt/payara/appserver/glassfish/domains/production/lib/logback-core-${LOGBACK_VER}.jar https://repo1.maven.org/maven2/ch/qos/logback/logback-core/${LOGBACK_VER}/logback-core-${LOGBACK_VER}.jar
wget -qO /opt/payara/appserver/glassfish/domains/production/lib/slf4j-api-${SIMPLE_LOG_VER}.jar https://repo1.maven.org/maven2/org/slf4j/slf4j-api/${SIMPLE_LOG_VER}/slf4j-api-${SIMPLE_LOG_VER}.jar

#                                                                       ActiveMQ
# ------------------------------------------------------------------------------
wget -qO /tmp/activemq-rar-${ACTIVEMQ_RAR_VER}.rar https://search.maven.org/remotecontent?filepath=org/apache/activemq/activemq-rar/${ACTIVEMQ_RAR_VER}/activemq-rar-${ACTIVEMQ_RAR_VER}.rar

#                                                       Change owner to 'payara'
# ------------------------------------------------------------------------------
chown payara:payara /opt/payara/appserver/glassfish/domains/production/lib/*.jar
chown payara:payara /tmp/*.rar
echo '----- CUSTOM END Downloading files..'
