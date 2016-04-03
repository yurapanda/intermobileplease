class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         #:recoverable, :, :
         :trackable, :rememberable , :validatable#, #
  before_validation :strip_whitespace
  before_save :strip_whitespace

  has_many :cars



  validates :first_name, 			 length: {minimum: 2, maximum: 20}
  validates :last_name, 			 length: {minimum: 2, maximum: 20}
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  validates :contact_number,  format: { with: /09[0-9]{2}-[0-9]{3}-[0-9]{4}/,
    message: "Follow (09xx-xxx-xxxx)" }
  

  def strip_whitespace
    self.first_name = self.first_name.strip unless self.first_name.nil?
    self.last_name = self.last_name.strip unless self.last_name.nil?
  end

  def technician?
    !technician = nil
  end
end
