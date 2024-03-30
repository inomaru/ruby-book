FROM ruby:3.1.2

# 必要最低限のツールを入れる
RUN apt-get update -qq && apt-get install -y vim

# gemを入れる
RUN gem install debug

# アプリケーションディレクトリを作成
RUN mkdir work

# アプリケーションディレクトリを作業用ディレクトリに設定
WORKDIR /work
ADD . .
EXPOSE 3000