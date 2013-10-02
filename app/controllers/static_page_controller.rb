class StaticPageController < ApplicationController
	def index

	end

	def nav_state
		@nav = :home
	end
end
