json.array!(@cameras) do |camera|
  json.extract! camera, :name, :host, :port, :camera_user, :camera_user_password, :description, :type, :full_url
  json.url camera_url(camera, format: :json)
end
