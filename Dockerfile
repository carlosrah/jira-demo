FROM carlosrah/houston-base-image
MAINTAINER Carlos Aparicio

ENV JIRA_INST_DIR   "/opt/atlassian"
ENV JIRA_HOME       "/var/atlassian"
ENV DOWNLOAD_URL    "https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.9.0.tar.gz"
ENV DOWNLOAD_PATH   "/tmp"

RUN mkdir -p  ${JIRA_INST_DIR}
RUN mkdir -p  ${JIRA_HOME}
RUN curl -L -o ${DOWNLOAD_PATH}/jira.tar.gz   ${DOWNLOAD_URL}
RUN tar -xf ${DOWNLOAD_PATH}/jira.tar.gz -C ${JIRA_INST_DIR} --strip-components 1
RUN mkdir -p ${JIRA_INST_DIR}/conf/Catalina
        
RUN rm -rf /tmp/*
EXPOSE 8080

WORKDIR ${JIRA_INST_DIR}
CMD ["./bin/start-jira.sh", "-fg"]