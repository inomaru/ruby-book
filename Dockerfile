FROM ruby:3.1.2

# 必要最低限のツールを入れる
RUN apt-get update -qq && apt-get install -y vim

# アプリケーションディレクトリを作成
RUN mkdir sample

# アプリケーションディレクトリを作業用ディレクトリに設定
WORKDIR /sample
ADD . .
EXPOSE 3000