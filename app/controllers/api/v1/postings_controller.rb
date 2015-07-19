class Api::V1::PostingsController < Api::ApiController
	# before_action :authenticate

	HALF_MILE_IN_DEGREES = 0.00724637681
	MILE_IN_DEGREES = 0.01449275362

	def all
		json = {}
		json[:data] = Posting.all
		render :json => json
	end

	def create
		results = Geocoder.search(params[:address])
		location = results.first

		posting = Posting.new(name: params[:name],
												  description: params[:description],
												  time: Time.now,
												  latitude: location.latitude,
												  longitude: location.longitude,
												  address: location.address,
													city: location.city,
													state: location.state,
													state_code: location.state_code,
													postal_code: location.postal_code,
													country: location.country,
													country_code: location.country_code)

		if posting.save
			render plain: "#{posting.id}"
		else
			render status: 400
		end
	end

	def show_close
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
		else
			render status: 400
		end
	end

	def show
		@posting = Posting.find(params[:id])
		render :json => @posting
	end
end
