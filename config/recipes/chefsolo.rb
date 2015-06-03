namespace :chef do
 desc "Install chef-solo after ruby is installed."
 task :install, roles: :app do
   run "#{sudo} gem install chef ruby-shadow --no-ri --no-rdoc"
 end
 after "rbenv:install", "chef:install"

 desc "Configure chef."
 task :setup, roles: :app do
   run "#{sudo} mkdir -p /var/chef/cookbooks"
 end
 after "chef:install", "chef:setup"
end
