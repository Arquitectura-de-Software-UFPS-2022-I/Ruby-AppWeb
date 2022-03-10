class CreateRequestUserService
	include HTTParty

  attr_reader :pos_x
	attr_reader :pos_y
	attr_reader :num_page
	attr_reader :id_signature_request
	attr_reader :id_user_to_signed

  def initialize(pos_x, pos_y, num_page, id_signature_request, id_user_to_signed)
    @pos_x = pos_x
		@pos_y = pos_y
		@num_page = num_page
		@id_signature_request = id_signature_request
		@id_user_to_signed = id_user_to_signed
	end

	def call
    create_request_user
  end

	private

	def create_request_user
		
		HTTParty.post("http://52.240.59.172:8000/api/v1/signature_request_users/",
			:body => {
				pos_x: pos_x,
				pos_y: pos_y,
				num_page: num_page,
				request: id_signature_request,
				user: id_user_to_signed
			}
		)
	end
end