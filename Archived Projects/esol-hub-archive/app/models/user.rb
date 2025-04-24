class User < ActiveRecord::Base
    include SimpleDiscussion::ForumUser

    def name
      "#{first_name} #{last_name}"
    end 
    
  end
  