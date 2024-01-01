# README

```
rbenv local 3.3.0
touch .gitigore

bundle init
bundle config set path 'vendor/bundle'
bundle install

bundle exec rails new . --database=mysql --skip-action-mailbox --skip-action-text --skip-action-cable --skip-sprockets --skip-javascript --skip-hotwire --skip-jbuilder
```
