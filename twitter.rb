# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'
require './configure'

class TwitterPopular
	def user_t(cliente)
		cliente.user? self
	end

	def friends_t
		self.friends_count
	end

	def imagen_t
		self.profile_image_url
	end

	def get_amigos_t(num, amigos)
		amigos_t = self.friend_ids(@name).attrs[:ids].take(10)
		if (num < 10)
				num.times do |i|
						user_n = self.user(amigos_t[i])
						usuarios[user_n.screen_name.to_s] = user_n.followers_count.to_i
				end
		end

		if (num >= 10)
				10.times do |i|
						user_n = self.user(amigos_t[i])
						usuarios[user_n.screen_name.to_s] = user_n.followers_count.to_i
				end
		end
	end

	def ordenar_t
		self.sort_by {|user,followers| -followers}
	end
end

get '/' do
		@n_amigos = 0 
		@name = '' 
		@pic = ''
		@usuarios = Hash.new
		erb :twitter
end
