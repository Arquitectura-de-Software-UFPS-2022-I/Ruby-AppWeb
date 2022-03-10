class GetUserByEmailService
	include HTTParty

  attr_reader :email

  def initialize(email)
    @email = email
	end

	def call
    get_user
  end

	private

	def get_user
		response =	HTTParty.get("http://52.240.59.172:8000/api/v1/users/")
		response.each do |user|
			return user['id'] if user ['email'] == email
		end
		return nil
	end
end