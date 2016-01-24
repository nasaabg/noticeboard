class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :products
  has_many :received_points
  has_many :given_points
  
  def active_for_authentication?
    super && !self.banned?
  end

   def inactive_message
    !self.banned? ? super : :locked
   end

   def received_points
     Point.where(receiver_id: id)
   end

   def given_points
     Point.where(rewarder_id: id)
   end
end
