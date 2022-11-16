# Rakefile
require 'rake/task'
require 'cucumber'
require 'cucumber/rake/task'
require 'rubygems'

task :run_with_tag, :tag do |_, args|
  tag = args[:tag].downcase
  Cucumber::Rake::Task.new(:search) do |t|
    t.cucumber_opts = "-f pretty -f html --tags #{tag} -o ./reports/report.html"
  end
  Rake::Task[:search].invoke
end