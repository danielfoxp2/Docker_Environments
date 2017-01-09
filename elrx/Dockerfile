FROM elixir:latest

RUN set -xe \
    && mix.local hex \
    && mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs

