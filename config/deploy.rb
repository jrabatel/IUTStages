require "bundler/capistrano"
require "bundler/sidekiq"

load "config/recipes/base"
load "config/recipes/bundle"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"
load "config/recipes/tools"
load "config/recipes/phantomjs"
load "config/recipes/imagemagick"
load "config/recipes/redis"
load "config/recipes/postgresql_backup"

server "replace_by_server_ip", :web, :app, :db, primary: true

set :user, "deployer"
set :application, "documents"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@198.199.73.178:programming/ruby/_rails/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases
