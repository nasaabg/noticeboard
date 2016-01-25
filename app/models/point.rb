class Point < ActiveRecord::Base
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  belongs_to :rewarder, class_name: "User", foreign_key: "rewarder_id"

  validates :receiver_id, presence: true
  validates :rewarder_id, presence: true
end
