class User < ActiveRecord::Base
  validates :agreement, acceptance: {accept: 'yes' }
  validates :email, confirmation: true
end
