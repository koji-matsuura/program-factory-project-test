class Issue < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: %w(open closed) }
  
  enum status: { open: 'open', closed: 'closed' }
end
