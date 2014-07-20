class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :rewards
  has_many :pledges, :through => :rewards
  has_many :reviews 
  has_many :users, :through => :reviews
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  scope :most_recent_five, -> { all.limit(5) }


  validates :title, :start_time, :end_time, :description, :presence => true
  validates :title, length: {minimum: 3} 
  validates :description, length: {minimum: 4}

  validates :goal, numericality:{
  	greater_than: 0
  }


  validate :start_time_greater_than_6_hours_from_now
  validate :end_time_greater_than_2_days_from_start_time
  private
  def start_time_greater_than_6_hours_from_now
  	return if (start_time.nil?) 
  		if DateTime.now + 6.hour > start_time
  			errors.add(:start_time, "start time must be for at least 6 hours from now")
  		end
  end 

  def end_time_greater_than_2_days_from_start_time
  	return if (start_time.nil?) or (end_time.nil?)

  	if end_time - start_time < 2.days
  		errors.add(:end_time,"the end time is not 2 days greater than the start_time")
  	end


  end

end
