class Car < ActiveRecord::Base
  belongs_to :car_model
  belongs_to :user
  
 
	 

  validates :plate_number, uniqueness: true, presence: true
  validates :plate_number, format: { with: /[A-Z]{3}-[0-9]{3,4}/,
    message: "Follow (XXX-999/XXX-9999)" }

  validates :contact_number,  format: { with: /09[0-9]{2}-[0-9]{3}-[0-9]{4}/,
    message: "Follow (09xx-xxx-xxxx)" }
  
  
  end	
