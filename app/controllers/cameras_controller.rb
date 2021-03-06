class CamerasController < ApplicationController
  before_action :set_type_combo_values, only: [:new, :create, :edit, :update]
  before_action :set_camera, only: [:show, :edit, :update, :destroy]

  # GET /cameras
  # GET /cameras.json
  def index
    @cameras = Camera.all
  end

  # GET /cameras/1
  # GET /cameras/1.json
  def show
  end

  # GET /cameras/new
  def new
    @camera = Camera.new
  end

  # GET /cameras/1/edit
  def edit
  end

  # POST /cameras
  # POST /cameras.json
  def create
    set_default_dimension!(camera_params[:full_url]) unless camera_params[:full_url].blank?
    @camera = Camera.new(camera_params)

    respond_to do |format|
      if @camera.save
        format.html { redirect_to @camera, notice: I18n.t('.cameras.notice_successfully_created') }
        format.json { render action: 'show', status: :created, location: @camera }
      else
        format.html { render action: 'new' }
        format.json { render json: @camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cameras/1
  # PATCH/PUT /cameras/1.json
  def update
    set_default_dimension!(camera_params[:full_url]) unless camera_params[:full_url].blank?

    respond_to do |format|
      if @camera.update(camera_params)
        format.html { redirect_to @camera, notice: I18n.t('.cameras.notice_successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cameras/1
  # DELETE /cameras/1.json
  def destroy
    @camera.destroy
    respond_to do |format|
      format.html { redirect_to cameras_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camera
      @camera = Camera.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camera_params
      params.require(:camera).permit(:name, :host, :port, :camera_user, :camera_user_password, :description, :type, :full_url)
    end

  def set_type_combo_values
    @camera_types = %w(Câmera Internet)
  end

  def set_default_dimension!(full_url)
    full_url.gsub(full_url[8, 11], 'width="770"').gsub(full_url[20, 12], 'height="367"')
  end
end
