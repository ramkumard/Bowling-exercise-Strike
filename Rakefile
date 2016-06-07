require 'rake'
require 'rake/testtask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test Bowling'
Rake::TestTask.new(:test) do |t|
	t.test_files = FileList['test/*_test.rb']
end
