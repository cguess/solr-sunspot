FROM solr

EXPOSE 8983

USER 'root'
RUN mkdir /solr_config

COPY ./config_files/schema.xml /solr_config/
COPY ./config_files/solrconfig.xml /solr_config/
COPY ./entrypoint.sh /solr_config/
COPY ./entrypoint-solr.sh /solr_config/

WORKDIR /solr_config/

RUN chmod +x /solr_config/entrypoint.sh

USER $SOLR_USER

WORKDIR /opt/solr

ENTRYPOINT /solr_config/entrypoint.sh ${1} 
 