FROM elixir:latest

ARG phoenix_version

RUN set -xe \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install --force https://github.com/phoenixframework/archives/raw/master/$phoenix_version.ez \
    && apt-get install -y inotify-tools

