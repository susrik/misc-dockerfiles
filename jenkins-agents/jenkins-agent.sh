#!/bin/sh

# Check if the necessary environment variables are provided
if [ -z "$JENKINS_HTTP_URL" ] || [ -z "$JENKINS_AGENT_NAME" ] || [ -z "$JENKINS_AGENT_SECRET" ]; then
    echo "Missing required environment variables (JENKINS_HTTP_URL, JENKINS_AGENT_NAME, JENKINS_AGENT_SECRET)."
    exit 1
fi

curl --create-dirs -sSLo /home/jenkins/agent/agent.jar \
  ${JENKINS_HTTP_URL}/jnlpJars/agent.jar

java -jar /home/jenkins/agent/agent.jar \
  -url ${JENKINS_HTTP_URL} \
  -secret ${JENKINS_AGENT_SECRET} \
  -name ${JENKINS_AGENT_NAME} \
  -workDir "/home/jenkins/agent"

