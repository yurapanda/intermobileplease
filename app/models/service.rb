class Service < ActiveRecord::Base


	validates :name, uniqueness: true, presence: true
	validates :price, presence: true

end
