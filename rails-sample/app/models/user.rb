class User < ApplicationRecord
  has_many :issues, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  def full_name
    name
  end
end
