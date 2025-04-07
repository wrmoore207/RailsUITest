class SessionsController < ApplicationController
    def mock
      session[:user_info] = {
        name: "Jane Doe",
        email: "jane@example.com",
        uid: "12345",
        provider: "developer"
      }
  
      redirect_to calendar_path, notice: "Mock login successful"
    end
  
    def destroy
      reset_session
      redirect_to root_path, notice: "Logged out"
    end
  end
  