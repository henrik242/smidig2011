#!/bin/sh

if [ $# -eq 0 ]; then
  DEFAULT=migrate
fi

export LIQUIBASE_HOME=`dirname $0`
export CP=liquibase.jar:sqlitejdbc.jar
java -cp $CP liquibase.integration.commandline.Main \
  --driver=org.sqlite.JDBC \
  --classpath=. \
  --changeLogFile=$LIQUIBASE_HOME/changeset.xml \
  --url="jdbc:sqlite:/opt/sqlite/smidig2011.sqlite" \
  $DEFAULT $*

