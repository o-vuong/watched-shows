class Show < ActiveRecord::Base
    
    validates_presence_of :title, :date
    belongs_to :user
end
