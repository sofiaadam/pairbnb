class SessionsController < Clearance::SessionsController
    
    
  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
        if authentication.user
      user = authentication.user 
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!"
    else
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      @next = root_url #edit_user_path(user)   
      @notice = "User created - confirm or edit details..."
    end
    sign_in(user)
    redirect_to @next, :notice => @notice
  end


    
     def create
        @user = authenticate(params)
        sign_in(@user) do |status|
      if status.success?
        flash[:success] = "Succesfully logged in"
        redirect_back_or url_after_create
      else
        flash[:danger]= status.failure_message
        render template: "sessions/new", status: :unauthorized
      end
    end
  end


    private

    def redirect_signed_in_users
      if signed_in?
        redirect_to url_for_signed_in_users
      end
    end

    def url_after_create
      Clearance.configuration.redirect_url
    end

    def url_after_destroy
      sign_in_url
    end

    def url_for_signed_in_users
      url_after_create
    end

end
