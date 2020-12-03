require 'rspec/core/rake_task'
load 'lib/tasks/doc.rake'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--color -fd'
  t.pattern = 'spec/**/*_spec.rb'
end

desc 'Run Tests'
task default: :spec
