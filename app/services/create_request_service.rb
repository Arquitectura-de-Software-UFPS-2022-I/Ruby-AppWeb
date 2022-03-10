class CreateRequestService
	include HTTParty

  attr_reader :subject
	attr_reader :document_id
	attr_reader :user_id

  def initialize(subject, document_id, user_id)
    @subject = subject
		@document_id = document_id
		@user_id = user_id
	end

	def call
    create_request
  end

	private

	def create_request
		HTTParty.post("http://52.240.59.172:8000/api/v1/signature_requests/",
			:body => {
				subject: subject,
				document: document_id,
				user: user_id
			}
		)
	end
end