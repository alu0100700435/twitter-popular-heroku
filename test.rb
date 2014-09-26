ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'twitter.rb'

include Rack::Test::Methods

def app
    Sinatra::Application
end

describe "Twitter Popular" do
    it "should return user exists" do
        assert alu0100700435.user_t?
    end
    it "should return user's number of friends" do
        assert_equal 3, alu0100700435.friends_t
    end
    it "should say that user does not exit" do
        refute ksfadkg.user_t?
    end
    
    it "should return user's wrong number of friends" do
        assert_not_equal 4, alu0100700435.friends_t
    end
    
    
end
