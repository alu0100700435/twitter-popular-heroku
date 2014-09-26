# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'
require './configure'

	get '/' do
		@n_amigos = 0 
		@name = '' 
		@pic = ''
		@usuarios = Hash.new
		erb :twitter
	end