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

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://lorempixel.com/300/300/people/"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

