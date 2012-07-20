set :application, "umtune.com"
set :repository,  "https://github.com/eoghanmc/sample_app.git"

set :scm, :git

set :user, 'eoghanmc'
set :use_sudo, false
set :deploy_to, "umtune.com/appdir"
set :deploy_via, :remote_cache

role :web, "umtune.com"                          # Your HTTP server, Apache/etc
role :app, "umtune.com"                         # This may be the same as your `Web` server
role :db,  "umtune.com", :primary => true # This is where Rails migrations will run


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after 'deploy', 'deploy:bundle_gems'
after 'deploy:bundle_gems', 'deploy:restart'

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
	task :bundle_gems do
		run "cd #{deploy_to}/current && bundle install vendor/gems"
	end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end