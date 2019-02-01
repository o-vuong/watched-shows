class User < ActiveRecord::Base
    has_many  :tweets
  
  
    has_secure_password
  
    def uname
      username.downcase.gsub(" ","-")
    end
  
    def self.find_by_slug(uname)
      User.all.find{|user| user.uname == uname}
    end
  
  end