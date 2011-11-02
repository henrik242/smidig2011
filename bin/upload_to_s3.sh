#!/bin/sh

s3curl.pl --id=personal  --put ${WORKSPACE}/my-webapp/target/my-webapp.war -- http://${S3_URL}/my-webapp-${BUILD_NUMBER}.war

