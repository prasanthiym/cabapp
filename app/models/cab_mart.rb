class CabMart 

  def self.getCab(userlatitude,userlongitude)
  
      @min = Float::MAX 
      @cabs = Cab.available_cabs
      @tempcab = nil
    
      @cabs.each do |cab|
          if cab.getDistanceFromUser(userlatitude,userlongitude) < @min
            @min = cab.getDistanceFromUser(userlatitude,userlongitude)
            @tempcab = cab
          end
      end
              @tempcab
 end
 
end