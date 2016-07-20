class Cab < ActiveRecord::Base
  include Calculate
  validates :latitude, presence: true
  validates :longitude, presence: true
  
  scope :available_cabs, -> { where(available: true) }
  scope :pink_cabs, -> { where(pink: true) }
  
  def getDistanceFromUser(userlatitude,userlongitude)
     measure(latitude,longitude,userlatitude,userlongitude)
  end
 
end