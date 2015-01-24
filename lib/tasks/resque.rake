require 'resque/tasks'

# load the Rails app all the time
namespace :resque do
  puts "Loading Rails environment for Resque"
  task :setup => :environment do
    ActiveRecord::Base.descendants.each { |klass|  klass.columns }
  end

  desc "Alias for resque:work (To run workers on Heroku)"
  task "jobs:work" => "resque:work"
end
