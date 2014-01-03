Rails.application.config.middleware.use OmniAuth::Builder do
  KEY = "226574923986-piarv0928u5qe2fij1qm5g03prklivsf.apps.googleusercontent.com"
  SECRET = "C6GZVErRS8dsmwx2yE9mpKmp"

  provider :google_oauth2, KEY, SECRET #ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"]
end