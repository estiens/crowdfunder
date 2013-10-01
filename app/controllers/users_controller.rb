class UsersController < ApplicationController

	def new
	 	@user = User.new
	end

	def create
		@user = User.new(params[:user])
    if @user.save
      redirect_to root_path
    else
      flash[:error] = "There was a problem with your registration, please try again."
      redirect_to users_path
    end
	end

	def show
		@user = User.find(params[:id])
	end
end



# def redirect_to_back_or_default(default = root_path)
#   if request.env["HTTP_REFERER"].present? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
#     redirect_to :back
#   else
#     redirect_to default
#   end
# end
