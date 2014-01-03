class AuthenticationsController < ApplicationController
  def index
    @authentications = current_admin.authentications if current_admin
  end

  def create
    auth = request.env["omniauth.auth"]
    if admin_signed_in?
      current_admin.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
      flash[:notice] = "Account added"
    else
      uid =  auth[:uid]
      authentication = Authentication.find_by_uid(uid)
      if authentication
        #admin exists
        admin = authentication.admin
        sign_in(admin)
      else
        #new admin
        image_url = auth[:info][:image]
        name = auth[:info][:name]
        email = auth[:info][:email]
        if email.split("@")[1] == "coshx.com"
          password_length = 8
          password = Devise.friendly_token.first(password_length)
          admin = Admin.new(:image_url => image_url, :name => name, :email => email, :password => password, :password_confirmation => password)
          admin.save!
          sign_in(admin)
          current_admin.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
          flash[:notice] = "Account created"
        else
          wrong_domain = true
        end
      end
    end

    if wrong_domain
      redirect_to wrong_domain_path
    else
      redirect_to :root
    end

  end

  def destroy
    @authentication = current_admin.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end

end