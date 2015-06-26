class User < ActiveRecord::Base
  validates :agreement, acceptance: {accept: 'yes', on: :create }
  validates :email, confirmation: true, presence: { unless: 'dm.blank?' }
end
