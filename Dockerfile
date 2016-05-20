FROM ruby

RUN gem install slanger

CMD ["slanger", "--app_key", "key", "--secret", "secret", "-r", "redis://redis:6379"]