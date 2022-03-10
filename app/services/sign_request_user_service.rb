class SignRequestUserService
	include HTTParty

  attr_reader :sign_request_user_id

  def initialize(sign_request_user_id)
    @sign_request_user_id = sign_request_user_id
	end

	def call
	  @signature_request_user =	get_sign_request_user
    sign_request_user
  end

	private

	def get_sign_request_user
		HTTParty.get("http://52.240.59.172:8000/api/v1/signature_request_users/#{sign_request_user_id}").parsed_response
	end

	def sign_request_user
		
		HTTParty.put("http://52.240.59.172:8000/api/v1/signature_request_users/#{@signature_request_user['id']}/",
			:body => {
				id: @signature_request_user['id'],
				pos_x: @signature_request_user['pos_x'],
				pos_y: @signature_request_user['pos_x'],
				num_page: @signature_request_user['num_page'],
				request: @signature_request_user['request'],
				user: @signature_request_user['user'],
				signed: true
			}
		)
	end
end