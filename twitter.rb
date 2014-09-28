# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'
require './configure.rb'

class TwitterPopular
	def user_t(cliente, nom)
		cliente.user? nom
	end

	def friends_t(cliente, nom)
		cliente.user(nom).friends_count #client.user(name).friends_count
	end

	def imagen_t(cliente, nom)
		cliente.user(nom).profile_image_url #client.user(name).profile_image_url
	end

	def get_amigos_t(cliente,nom, num, amigos)
		
		amigos_t = cliente.friend_ids(nom).attrs[:ids].take(10) #client.friend_ids(@name).attrs[:ids].take(@fc) 
		
		if (num < 10)
		    num.times do |i|
		        user_n = cliente.user(amigos_t[i])
		        amigos[user_n.screen_name.to_s] = user_n.followers_count.to_i
		    end
		end

		if (num >= 10)
		    10.times do |i|
		        user_n = cliente.user(amigos_t[i])
		        amigos[user_n.screen_name.to_s] = user_n.followers_count.to_i
		    end
		end
	end

	def ordenar_t(usuarios)
		usuarios.sort_by {|user,followers| -followers}
	end
end

get '/' do
		@n_amigos = 0 
		@name = '' 
		@pic = ''
		@usuarios = Hash.new
		erb :twitter
end

post '/' do
	@n_amigos = 0
	@usuarios = Hash.new
	@name = params[:firstname] || ''
	client = my_twitter_client()


	#Si el usuario introducido es de Twitter:
	if (user_t(client, @name) == true)
		@n_amigos = friends_t(client, @name)
		@pic = imagen_t(client, @name)

		get_amigos_t(client, @name, @n_amigos, @usuarios)
		@usuarios = ordenar_t(@usuarios)
	end
end

