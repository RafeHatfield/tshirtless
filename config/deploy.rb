require 'rvm/capistrano'
require 'bundler/capistrano'
require 'capistrano/ext/multistage'

set :rvm_type, :user
default_run_options[:pty] = true  # Must be set for the password prompt

set :stages, %w(staging production)
#set :default_stage, 'production'

set :application, 'tshirtless'

# Capistrano assumes subversion, so if you use git, you need to specify it
set :scm, :git

# This makes capistrano keep a clone of the repo on the remote server so that it doesn't have to download an entire copy of the app w$
set :deploy_via, :remote_cache

set :repository,  "git@github.com:RafeHatfield/tshirtless.git"
set :branch, 'master'

set :git_enable_submodules, true
set :use_sudo, false

# The default value is "--deployment --quiet", but if you don't
# commit your Gemfile.lock to the repo then you'll have problems
#set :bundle_flags, '--quiet'

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# This causes SSH connections to your git server to use the keys
# on your local machine instead of having to store them on the server
#ssh_options[:forward_agent] = true

namespace :deploy do

  task :start do
    # Do nothing
  end

  task :stop do
    # Do nothing
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    # touch the restart.txt file to cause Passenger to reload the application
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end