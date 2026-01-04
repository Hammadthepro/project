# Base Image
FROM ubuntu

RUN apt-get update
RUN apt install -y curl


# Install Node.js and npm

# RUN apt-get update
# RUN apt-get install -y curl 
# RUN curl -sL https://deb.nodesource.com/setup_20.x -o /temp/nodesource_setup.sh
# RUN bash /temp/nodesource_setup.sh
# RUN apt-get install -y nodejs

RUN apt-get update \
    && apt-get install -y curl \
    && mkdir -p /tmp/setup \
    && curl -fsSL -o /tmp/setup/nodesource_setup.sh https://deb.nodesource.com/setup_20.x \
    && bash /tmp/setup/nodesource_setup.sh \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*






# copying the source code of docker image 
COPY index.js /home/app/index.js
COPY package-lock.json /home/app/package-lock.json
COPY package.json /home/app/package.json
EXPOSE 3000

# Bind to 0.0.0.0 and start the app
CMD ["node", "index.js"]

WORKDIR /home/app/

RUN npm install
