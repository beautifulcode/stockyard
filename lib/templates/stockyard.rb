# Stockyard Base App Install


# Gem Dependencies
gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
gem 'thoughbot-factory_girl', :lib => 'factory_girl', :source => 'http://gems.github.com'
gem 'resource_controller', :lib => 'resource_controller', :source => 'http://gems.github.com'
gem 'haml', :lib => 'haml', :source => 'http://gems.github.com'
run 'haml --rails .'

rake "gems:install"

# Install Stockyard itself
plugin 'stockyard', :git => 'git://github.com/beautifulcode/stockyard.git'

# Install Stockyard Plugin Dependencies
plugin 'acts_as_tree'
plugin 'better_nested_set'
plugin 'permalink_fu'
plugin 'simply_versioned'
plugin 'validation_reflection'

# Install Testing Frameworks
if yes?("Do you want to include Shoulda & Webrat?")
  plugin 'thoughtbot-shoulda', :git => 'git://github.com/thoughtbot/shoulda.git'
  plugin 'webrat', :git => 'git://github.com/brynary/webrat.git'
end

# Install Notification/Analysis Plugins
if yes?("Do you want to include Hoptoad and New Relic?")
  plugin 'hoptoad_notifier', :git => 'git://github.com/thoughtbot/hoptoad_notifier.git'
  plugin 'newrelic_rpm', :svn => 'http://newrelic.rubyforge.org/svn/newrelic_rpm'
end


# GIT Action
git :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

# Copy Stockyard Assets to public
# run "ln -fs vendor/plugins/stockyard/public/ public/stockyard"
run "cp -R vendor/plugins/stockyard/public/javascripts/* public/stockyard/javascripts/"
run "cp -R vendor/plugins/stockyard/public/stylesheets/* public/stockyard/stylesheets/"
run "cp -R vendor/plugins/stockyard/public/images/* public/stockyard/images/"

# git :add => ".", :commit => "-m 'initial commit'"
# 
# 
# 
# # Capistrano setup
# run "capify ."