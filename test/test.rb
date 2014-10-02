ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../twitter.rb'
require './configure.rb'

include Rack::Test::Methods

def app
    Sinatra::Application
end


describe "Twitter Popular" do
    before :all do
        @twitt = TwitterPopular.new
        @client = my_twitter_client()
        @nom = "crguezl"
        @nom1 = "ksfadkg"

    end
    
    it "should return user exists" do
        assert @twitt.user_t(@client, @nom)
    end
    it "should return user's number of friends" do
        assert_equal 849, @twitt.friends_t(@client, @nom)
    end
    it "should say that user does not exit" do
        refute @twitt.user_t(@client, @nom1)
    end
    
    it "should return user's wrong number of friends" do
        refute_equal 4, @twitt.friends_t(@client, @nom)
    end 

end

describe "Web" do
    it "should load the index page" do
        get '/'
            assert last_response.ok?
        end

    it "it should exits a username field" do
        get '/'
            assert last_response.body.include?("Introduzca un usuario Twitter")
        end  
end




