# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'
require './configure'

class TwitterPopular
	def user_t
	end

	def friends_t
	end

	def imagen_t
	end

	def get_amigos_t(num, amigos)
	end

	def ordenar_t
	end
end

get '/' do
		@n_amigos = 0 
		@name = '' 
		@pic = ''
		@usuarios = Hash.new
		erb :twitter
end
