FROM jenkins/jenkins:lts-jdk17
USER root

ENV JAVA_OPTS="-Dpermissive-script-security.enabled=no_security -Dcom.cloudbees.workflow.rest.external.JobExt.maxRunsPerJob=30"
RUN cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
  echo "Asia/Seoul" >/etc/timezone

RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y apt-utils apt-transport-https \
  ca-certificates curl wget gnupg lsb-release gnupg2 dialog g++ \
  software-properties-common vim make git gcc python3-pip zip ncdu \
  ansible

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null

RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin nodejs amazon-ecr-credential-helper 
RUN mkdir -p /var/jenkins_backup && chown jenkins:jenkins /var/jenkins_backup

# RUN pip3 install ansible boto3 boto botocore --break-system-packages

USER jenkins
COPY plugin.yml /var/jenkins_home/plugin.yml
RUN jenkins-plugin-cli --plugin-file ~/plugin.yml
