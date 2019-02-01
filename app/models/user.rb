class User < ActiveRecord::Base
    has_many :shows
    has_secure_password

    def uname
        username.downcase.gsub(" ", "-")
    end

    def self.find_by_uname(uname)
        User.all.find{|user| user.uname == uname}
    end
end
