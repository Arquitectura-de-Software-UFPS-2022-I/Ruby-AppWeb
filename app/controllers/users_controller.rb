class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    unless current_user == @user
      redirect_to profile_index_path, :alert => "Restricted area" 
    end
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save!
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
         # store uploaded image as blob
        file_read = params[:user][:file_attachment][:file].read
        @user.file_attachment = FileAttachment.new(name: 'signature - ' + @user.username, file: file_read)

        file = HTTParty.post("http://52.240.59.172:8000/api/v1/files/",
          :body => {
            file: File.open(params[:user][:file_attachment][:file].path),
            name: @user.file_attachment.name
          }
        )
        remote_user = HTTParty.get("http://52.240.59.172:8000/api/v1/users/#{@user.api_id}/")

        remote_user_update_sign = HTTParty.put("http://52.240.59.172:8000/api/v1/users/#{@user.api_id}/",
          :body => {
            id: remote_user.parsed_response['id'],
            full_name: remote_user.parsed_response['full_name'],
            username: remote_user.parsed_response['username'],
            email: remote_user.parsed_response['email'],
            password: remote_user.parsed_response['password'],
            signature: file.parsed_response['id']
          }
        )
        @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :username, :password, :file_attachment, :modified_date, :created_date)
    end
end
