namespace :imagemagick do
 desc "Install imagemagick for image manipulation"
  task :install, roles: :app do
    run "#{sudo} apt-get -y install imagemagick libmagickwand-dev"
  end
  after "deploy:install", "imagemagick:install"
end
