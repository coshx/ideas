KEY = Rails.env.production? ? ENV["GOOGLE_CLIENT"] : "226574923986-piarv0928u5qe2fij1qm5g03prklivsf.apps.googleusercontent.com"
SECRET = Rails.env.production? ? ENV["GOOGLE_SECRET"] : "C6GZVErRS8dsmwx2yE9mpKmp"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, KEY, SECRET
end