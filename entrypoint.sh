#!/bin/bash
cd /opt/solr

bash /solr_config/entrypoint-solr.sh solr-precreate ${1}

for d in /opt/solr/server/solr/mycores/*/ ; do
	echo "$d"
	echo "*******************"
	cp /solr_config/schema.xml $d/conf/
	cp /solr_config/solrconfig.xml $d/conf/
done

exec solr start -f -p 8983