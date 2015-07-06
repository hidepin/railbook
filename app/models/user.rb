class User < ActiveRecord::Base
  has_one :author
  validates :agreement, acceptance: {accept: 'yes', on: :create }
  validates :email, confirmation: true, presence: { unless: 'dm.blank?' }
end
