#========================
#CONFIG
#========================
set :application, "test1.sovechkin.com"
#========================
#CONFIG
#========================
require           "capistrano-offroad"
offroad_modules   "defaults", "supervisord"
set :repository,  "git@github.com:pomeo/insaleschaochai.git"
set :deploy_to,   "/home/ubuntu/www/chaochai"
set :supervisord_start_group, "chaochai"
set :supervisord_stop_group, "chaochai"
#========================
#ROLES
#========================
role :app,        "ubuntu@#{application}"

namespace :deploy do
  desc "Change node.js port"
  task :chg_port do
    run "sed -i 's/3000/7000/g' #{current_path}/app.js"
  end
end

after "deploy:create_symlink", "deploy:npm_install", "deploy:chg_port", "deploy:restart"
