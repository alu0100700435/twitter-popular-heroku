task(:default) do
    require_relative 'test/test'
end
desc "run the tests"
    task :test => :default
    
desc "run service"
    task :server do
    sh "ruby twitter.rb"
end

