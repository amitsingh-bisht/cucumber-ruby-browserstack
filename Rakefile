# Rakefile
require 'rake/task'
require 'cucumber'
require 'cucumber/rake/task'
require 'rubygems'

task :all_tasks, :source, :tag do |_, args|
  Cucumber::Rake::Task.new(:search) do |t|
    ENV['source'] = args[:source]
    if args[:source].eql? 'no_browser'
      t.cucumber_opts = "features/ --tags '@api and @#{args[:tag]}'"
    else
      t.cucumber_opts = "features/ --tags '@ui and @#{args[:tag]}' username=#{ENV['username']} accesskey=#{ENV['accesskey']} -f pretty -f html -o ./reports/report_html.html -f pretty -f junit -o ./reports/ CUCUMBER_PUBLISH_ENABLED=true"
    end
  end
  Rake::Task[:search].invoke
end
