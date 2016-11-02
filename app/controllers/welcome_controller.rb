class WelcomeController < ApplicationController
      	
  def index
  	 if current_user 
     redirect_to articles_path
   else 
    redirect_to new_user_registration_path
   end
  end
end
