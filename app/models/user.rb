class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :projects
  has_many :rewards, :through => :projects
  has_many :pledges

  validates :username, presence: true
  validates :username, length: {minimum: 2}
  validates :email, presence: true
  validates :email, uniqueness: true

  #required by sorcery gem

  validates :password, length: {minimum: 3}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
