class RequestController < ApplicationController
	before_action :authenticate_user!
	def index
		@requests_by_user = HTTParty.get("http://52.240.59.172:8000/api/v1/signature_requests_by_user/#{current_user.api_id}/")
		@requests_by_user
  end
  def show
  end
	def request_sign
	end
	def request_sign_user
		user_id = GetUserByEmailService.new(params['email']).call
	  return redirect_to request_index_path, notice: "User don't exist" if user_id.nil?
		CreateRequestUserService.new(params['pos_x'], params['pos_y'], params['page'], params['request_id'], user_id).call
		redirect_to request_index_path, notice: "Sign was successfully requested."
	end
end
