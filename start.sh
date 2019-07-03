# Instala as Gems
bundle check || bundle install

# Roda nosso server
rackup config.ru -o 0.0.0.0
