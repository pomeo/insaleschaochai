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
set :supervisord_start_group, "test"
set :supervisord_stop_group, "test"
#========================
#ROLES
#========================
set  :gateway,    "#{application}"   # main server
role :app,        "ubuntu@10.3.42.1" # lxc container

after "deploy:create_symlink", "deploy:npm_install", "deploy:restart"
