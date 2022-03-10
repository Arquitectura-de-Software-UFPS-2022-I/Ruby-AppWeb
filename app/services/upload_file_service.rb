class SignUpService
	include HTTParty

  attr_reader :name
	attr_reader :username
	attr_reader :email
	attr_reader :password

  def initialize(name, username, email, password)
    @name = name
		@username = username
		@email = email
		@password = password
	end

	def call
    create_user
  end

	private

	def create_user
		response = HTTParty.post("http://52.240.59.172:8000/api/v1/users/",
			:body => {
				full_name: name,
				username: username,
				email: email,
				password: password
			}.to_json,
			:headers => {'Content-Type' => 'application/json'}
		)

		return response
	end
end