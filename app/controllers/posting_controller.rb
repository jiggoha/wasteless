class PostingController < ApplicationController
	def index
		@postings = Posting.all
	end
end

# curl --data "name=HudsonHacks&description=food&amount=some&latitude=40.7399443&longitude=-73.9910549" http://wasteless.herokuapp.com/new