class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0}

end
