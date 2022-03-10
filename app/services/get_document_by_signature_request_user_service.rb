class GetDocumentBySignatureRequestUserService
	include HTTParty

  attr_reader :signature_request_user_id

  def initialize(signature_request_user_id)
    @signature_request_user_id = signature_request_user_id
	end

	def call
    get_document
  end

	private

	def get_document
		signature_request_user =	HTTParty.get("http://52.240.59.172:8000/api/v1/signature_request_users/#{signature_request_user_id}").parsed_response
		signature_request =	HTTParty.get("http://52.240.59.172:8000/api/v1/signature_requests/#{signature_request_user['request']}").parsed_response
		file = HTTParty.get("http://52.240.59.172:8000/api/v1/files/#{signature_request['document']}").parsed_response
	end
end