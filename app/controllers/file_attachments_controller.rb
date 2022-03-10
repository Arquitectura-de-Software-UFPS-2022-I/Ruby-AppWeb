class FileAttachmentsController < ApplicationController
  before_action :set_file_attachment, only: %i[ show edit update destroy ]

  # GET /file_attachments or /file_attachments.json
  def index
    @file_attachments = FileAttachment.all
  end

  # GET /file_attachments/1 or /file_attachments/1.json
  def show
  end

  # GET /file_attachments/new
  def new
    @file_attachment = FileAttachment.new
  end

  # GET /file_attachments/1/edit
  def edit
  end

  # POST /file_attachments or /file_attachments.json
  def create
    @file_attachment = FileAttachment.new(file_attachment_params)

    respond_to do |format|
      if @file_attachment.save
        file_read = params[:file_attachment][:file].read
        @file_attachment.file = file_read

        file = HTTParty.post("http://52.240.59.172:8000/api/v1/files/",
          :body => {
            file: File.open(params[:file_attachment][:file].path),
            name: params[:file_attachment][:name]
          }
        )

        signature_request = HTTParty.post("http://52.240.59.172:8000/api/v1/signature_requests/",
          :body => {
            subject: params[:file_attachment][:subject],
            document: file.parsed_response['id'],
            user: current_user.api_id
          }
        )

        format.html { redirect_to file_attachment_url(@file_attachment), notice: "File attachment was successfully created." }
        format.json { render :show, status: :created, location: @file_attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @file_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_attachments/1 or /file_attachments/1.json
  def update
    respond_to do |format|
      if @file_attachment.update(file_attachment_params)
        file_read = params[:file_attachment][:file].read
        @file_attachment.file = file_read
        @file_attachment.save
        format.html { redirect_to file_attachment_url(@file_attachment), notice: "File attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @file_attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @file_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_attachments/1 or /file_attachments/1.json
  def destroy
    @file_attachment.destroy

    respond_to do |format|
      format.html { redirect_to file_attachments_url, notice: "File attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_attachment
      @file_attachment = FileAttachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def file_attachment_params
      params.require(:file_attachment).permit(:name, :file, :created_date)
    end
end
