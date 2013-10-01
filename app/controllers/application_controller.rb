class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  # Sorcery automatically looks for a method called not_authenticated  
  
  def not_authenticated
    redirect_to login_path, :alert => "Please login first."
  end

end

