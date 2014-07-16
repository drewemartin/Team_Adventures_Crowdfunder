class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :projects
  has_many :rewards, :through => :projects
  has_many :pledges

end
