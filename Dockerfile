FROM elixir:latest
MAINTAINER Zilvinas Verseckas <zverseckas@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

# Install hex
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install the Phoenix framework itself
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force

# Suggested https://hexdocs.pm/phoenix/installation.html
RUN apt-get update && apt-get install -y inotify-tools && rm -rf /var/lib/apt/lists/*

# When this image is run, make /app the current working directory
WORKDIR /app
