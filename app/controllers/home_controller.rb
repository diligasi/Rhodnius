class HomeController < ApplicationController
  def index
    session[:id_camera] = params[:selected_cam_id] unless params[:selected_cam_id].blank?
    @current_camera = session[:id_camera] ? Camera.find(session[:id_camera]) : nil
    # todo: Montar o link com as câmeras por ip
    @current_cam_adress =  @current_camera && !@current_camera.full_url.blank? ? @current_camera.full_url : nil
    @comment = Comment.new
  end
end
