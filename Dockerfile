FROM ruby:2.5.1

# add nodejs and yarn dependencies for the frontend
# RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
build-essential libpq-dev imagemagick git-all nano


# Seta nosso path
ENV INSTALL_PATH /onebitbot

# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH

# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH

# Copia nosso Gemfile para dentro do container
COPY Gemfile ./

RUN bundle install

# Copia nosso código para dentro do container
COPY . .

CMD rackup config.ru -o 0.0.0.0

