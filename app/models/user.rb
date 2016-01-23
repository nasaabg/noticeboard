class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :products
  has_many :points
  
  def active_for_authentication?
    super && !self.banned?
  end

   def inactive_message
      !self.banned? ? super : :locked
    end
end
