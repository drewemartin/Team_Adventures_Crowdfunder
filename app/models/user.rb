class User < ActiveRecord::Base
has_secure_password

    
  has_many :projects
  has_many :rewards, :through => :projects
  has_many :pledges
  has_many :reviews

  #validates :username, :presence => true
  #validates :username, length: {minimum: 2}
  validates :email, :presence => true
  validates :email, :uniqueness => true
end

