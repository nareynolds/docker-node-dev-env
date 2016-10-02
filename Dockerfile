FROM node:6.6-slim

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/myapp/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/myapp
RUN npm install

USER root
COPY . $HOME/myapp
RUN chown -R app:app $HOME/*
USER app

CMD ["node", "index.js"]
