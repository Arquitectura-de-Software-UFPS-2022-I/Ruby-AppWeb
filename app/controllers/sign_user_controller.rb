class SignUserController < ApplicationController
	before_action :authenticate_user!
	def index
		@sign_user_requested = HTTParty.get("http://52.240.59.172:8000/api/v1/signature_request_users_by_user/#{current_user.api_id}/")
		@sign_user_requested
  end
  def show
  end
	def sign_user_document
		signed = SignRequestUserService.new(params['sign_user_id']).call
		return redirect_to sign_user_index_path, notice: "Document was successfully signed." if signed
		redirect_to sign_user_index_path, notice: "A problem has ocurred."
	end
end
