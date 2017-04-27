class SessionsController < Clearance::BaseController

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
