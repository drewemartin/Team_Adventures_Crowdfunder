class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :projects
  has_many :rewards, :through => :projects
  has_many :pledges

  validates :username, :presence => true
  validates :username, length: {minimum: 2}
  validates :email, :presence => true
  validates :email, :uniqueness => true
end
