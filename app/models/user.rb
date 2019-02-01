class User < ActiveRecord::Base
    has_many  :shows_watched
  
  
    has_secure_password
  
    def uname
      username.downcase.gsub(" ","-")
    end
  
    def self.find_by_slug(uname)
      User.all.find{|user| user.uname == uname}
    end
  
  end