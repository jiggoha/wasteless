class PostingController < ApplicationController
	skip_before_filter :verify_authenticity_token

	HALF_MILE_IN_DEGREES = 0.00724637681
	MILE_IN_DEGREES = 0.01449275362

	def create
		posting = Posting.new(name: params[:name],
												  description: params[:description],
												  amount: params[:amount],
												  time: Time.now,
												  latitude: params[:latitude],
												  longitude: params[:longitude])

		if posting.save
			render inline: "<%= #{posting.id} %>"
		else
			render status: 400
		end
	end

	def show
		# location given
		if params[:latitude] && params[:longitude]
			lat = params[:latitude].to_f
			long = params[:longitude].to_f

			lower_lat = lat - MILE_IN_DEGREES
			upper_lat = lat + MILE_IN_DEGREES
			lower_long = long - MILE_IN_DEGREES
			upper_long = long + MILE_IN_DEGREES

			@postings = Posting.where("latitude >= ?", lower_lat)
												 .where("latitude <= ?", upper_lat)
												 .where("longitude >= ?", lower_long)
												 .where("longitude <= ?", upper_long)
												 .order("time DESC")

			render :json => @postings

		# no location given
		else
			@posting = Posting.find(params[:id])
			render :json => @posting
		end
	end

	def all
		# add optional location params
		@postings = Posting.all
		render :json => @postings
	end
end

# curl --data "name=HudsonHacks&description=food&amount=some&latitude=40.7399443&longitude=-73.9910549" http://wasteless.herokuapp.com/new
