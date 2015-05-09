class Task < ActiveRecord::Base
    belongs_to :member
    validates :title, presence: true
    validates :description, presence: true
    validates :description, length: { maximum: 100 }
    validates :duration, presence: true, numericality: true
    
    
  
    
    
end
