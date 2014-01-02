Rails.application.config.middleware.use OmniAuth::Builder do
  KEY = "AIzaSyAYgW6HlMfsdlUa0SWmM6szHQ46qlRx_c0"
  SECRET = "SLlGpwajHJT8k7DIpYY3STbD"

  provider :google_oauth2, KEY, SECRET#ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"]
end