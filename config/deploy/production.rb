# Set this to the version of RVM-managed Ruby on the remote server
# Run `rvm list` to get the exact version string
set :rvm_ruby_string, 'ruby-1.9.3-p194'

set :domain, '192.155.86.86'

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true        # This is where Rails migrations will run

# This is the user capistrano will use for SSH,
# and thus, who will own the files it deploys
set :user, 'rafe'
set :group, 'rafe'

set :deploy_to, "/var/www/#{application.downcase}"
set :rails_env, 'production'

# By default, bundler will install all gems unless you tell it to skip specific environments
set :bundle_without, [:test, :development, :staging]