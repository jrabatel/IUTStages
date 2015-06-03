namespace :tools do
 desc "Install tools used for daily work. "
  task :install, roles: :app do
    run "#{sudo} apt-get -y install vim tmux"
  end
  after "deploy:install", "tools:install"

  task :config, roles: :app do
    run "cd ~"
  end
end
