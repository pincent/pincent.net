FROM ruby:2.1.5

MAINTAINER Cai Guanhao (caiguanhao@gmail.com)

RUN echo Asia/Hong_Kong > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

RUN python2.7 -c 'from urllib import urlopen; from json import loads; \
    print(loads(urlopen("http://ip-api.com/json").read().decode("utf-8" \
    ).strip())["countryCode"])' > /tmp/country

RUN test "$(cat /tmp/country)" = "CN" && { \
    (echo "deb http://mirrors.aliyun.com/debian jessie main" && \
    echo "deb http://mirrors.aliyun.com/debian jessie-updates main" && \
    echo "deb http://mirrors.aliyun.com/debian-security/ jessie/updates main") \
    > /etc/apt/sources.list; \
    gem sources -r https://rubygems.org/; \
    gem sources -a https://ruby.taobao.org/; \
    } || true

RUN apt-get update && \
    apt-get install -y --no-install-recommends locales locales-all less

RUN export LANGUAGE=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    export LC_ALL=en_US.UTF-8 && \
    locale-gen en_US.UTF-8 && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN gem install --no-ri --no-rdoc bundler && bundle config --global jobs 2

WORKDIR /pincent

ADD Gemfile /pincent/Gemfile
ADD Gemfile.lock /pincent/Gemfile.lock

RUN test $(cat /tmp/country) = "CN" && { \
    sed -i 's/rubygems.org/ruby.taobao.org/g' Gemfile Gemfile.lock; \
    } || true

RUN bundle install

EXPOSE 4000

CMD jekyll build

ADD . /pincent
