
set :application, "mobtown"
set :repository, "https://github.com/danielballan/mobtown"
set :scm, :git

set :deploy_to, "/home/dallan/mobtown"
role :app, "mobtownballroom.com"
role :web, "mobtownballroom.com"
role :db, "mobtownballroom.com", :primary => true
set :user, "root" # necessary for nginx reload
set :use_sudo, false
set :scm_username, "danielballan"

# For capistrano-nginx
set :app_port, 80
set :sudo_user, "dallan"
set :server_name, "omar"

require 'capistrano/nginx/tasks'
require 'capistrano-unicorn'

namespace :deploy do
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/Gemfile #{release_path}/Gemfile"
  end  
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" # debug
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
after 'deploy:update', 'deploy:symlink_shared'

after 'deploy:restart', 'unicorn:reload' # app IS NOT preloaded
# after 'deploy:restart', 'unicorn:restart'  # app preloaded

after "deploy:setup", "nginx:setup", "nginx:reload"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
