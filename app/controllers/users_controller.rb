class UsersController < Clearance::UsersController

    def new
      @user = user_from_params
      render template: "users/new"
    end

    def show
      @user = User.find(params[:id])
      
    end
    

    def create
    @user = user_from_params
    @user.role = 'customer'
    if @user.save
        sign_in @user
        redirect_back_or url_after_create
    else
      render template: "users/new"
      #AJAXED/signup new/remote true remove 
        # @message = @user.errors.full_messages.first
	      # respond_to do |format|
	      # 	format.js
	      # 	format.html
        # end
    end
  end
  
  

  

  private

  # def redirect_signed_in_users
  #   if signed_in?
  #     redirect_to Clearance.configuration.redirect_url
  #   end
  # end

  # def url_after_create
  #   Clearance.configuration.redirect_url
  # end

	def user_params
		params.require(:user).permit(:full_name, :email, :password, :age, :gender, :avatar)
	end 


end
