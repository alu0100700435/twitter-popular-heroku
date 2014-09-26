ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require './configure.rb'
require_relative 'twitter.rb'

include Rack::Test::Methods

def app
    Sinatra::Application
end

describe TwitterPopular do
    describe "Twitter Popular" do
        before :all do
            
            @client = my_twitter_client()
            @nom = "crguezl"
            @nom1 = "ksfadkg"

        end
        
        it "should return user exists" do
            assert user_t(@client, @nom)
        end
        it "should return user's number of friends" do
            assert_equal 849, friends_t(@cliente, @nom)
        end
        it "should say that user does not exit" do
            refute user_t(@client, @nom1)
        end
        
        it "should return user's wrong number of friends" do
            assert_not_equal 4, friends_t(@client, @nom)
        end    
    
    end

end
