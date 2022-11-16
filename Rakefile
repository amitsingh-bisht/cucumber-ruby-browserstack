# Rakefile
require 'rake/task'
require 'cucumber'
require 'cucumber/rake/task'
require 'rubygems'

task :all_tasks, :tag do |_, args|
  tag = args[:tag].downcase
  Cucumber::Rake::Task.new(:search) do |t|
    t.cucumber_opts = "features/ --tags #{tag} -f pretty -f html -o ./reports/report.html -f pretty -f junit -o ./reports/report_xml CUCUMBER_PUBLISH_ENABLED=true"
  end
  Rake::Task[:search].invoke
end
