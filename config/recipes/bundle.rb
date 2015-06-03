namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
 
  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} ; bundle check 2>&1 > /dev/null ; if [ $? -ne 0 ] ; then sh -c 'bundle install --path .bundle/gems --without test' ; fi"
  end
  after 'deploy:update_code', 'bundler:bundle_new_release'
end
