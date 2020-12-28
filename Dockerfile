FROM python

# Install hub
RUN apt-get update \
  && apt-get install -y wget apt-transport-https ca-certificates \
  && wget https://github.com/github/hub/releases/download/v2.14.2/hub-linux-amd64-2.14.2.tgz \
  && tar xvfz hub-linux-amd64-2.14.2.tgz \
  && rm hub-linux-amd64-2.14.2.tgz \
  && mv hub-linux-amd64-2.14.2/bin/hub /usr/bin/ \
  && chmod +x /usr/bin/hub \
  && alias git=hub

# Install commons
RUN apt install -y git software-properties-common


# Install gh CLI
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 \
  && apt-add-repository https://cli.github.com/packages \
  && apt update \
  && apt install gh

# Install lastversion
RUN pip3 install lastversion

ENTRYPOINT ["bash"]
