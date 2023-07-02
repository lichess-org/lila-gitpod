FROM ubuntu:focal-20230605

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
  && apt update \
  && apt-get install -y build-essential ca-certificates curl gnupg locales sudo wget

ENV TZ=Etc/GMT
RUN sudo ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && sudo echo $TZ > /etc/timezone
RUN locale-gen "en_US.UTF-8"

# Install coursier (dependency of bloop)
RUN curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs \
  && chmod +x cs \
  && sudo mv cs /usr/local/bin/cs \
  && cs setup --yes

# Add mongodb apt source
RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

RUN sudo apt-get update && sudo apt update \
  && sudo apt-get install -y git-all mongodb-org nginx psmisc python3.9 python3-pip redis-server unzip vim zip

# Install Golang (For Picfit + Mailhog)
RUN wget https://go.dev/dl/go1.20.5.linux-amd64.tar.gz \
  && sudo tar -C /usr/local -xzf go1.20.5.linux-amd64.tar.gz \
  && rm go1.20.5.linux-amd64.tar.gz

# Cleanup
RUN sudo apt-get autoremove -y \
  && sudo apt-get clean

# Add nginx site config
COPY build/nginx/lichess.conf /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

# Build bbbpairings
RUN mkdir -p /opt \
  && git clone https://github.com/cyanfish/bbpPairings /opt/bbpPairings \
  && cd /opt/bbpPairings \
  && make \
  && chmod +x bbpPairings.exe

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod
USER gitpod

# Install pymongo needed for lila-db-seed
RUN python3.9 -m pip install pymongo

# Install nvm, npm, and pnpm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash \
  && export NVM_DIR="$HOME/.nvm" \
  && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
  && echo ". \"$HOME/.nvm/nvm.sh\"" >> ~/.bashrc \
  && nvm install 19 \
  && npm install -g pnpm

# Install Java
RUN curl -s "https://get.sdkman.io" | bash \
  && source "$HOME/.sdkman/bin/sdkman-init.sh" \
  && sdk version \
  && sdk install java 17.0.7-tem \
  && sdk install sbt

# Install Rust and Cargo, needed for fishnet
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install bloop + scala formatter
RUN cs install bloop --only-prebuilt=true \
  && cs install scalafmt \
  && echo 'export PATH="$PATH:$HOME/.local/share/coursier/bin"' >> ~/.bashrc

# Add golang binary to path
RUN echo 'export PATH="$PATH:/usr/local/go/bin"' >> ~/.bashrc
