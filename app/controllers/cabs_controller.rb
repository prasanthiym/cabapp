class CabsController < ApplicationController
 def index
   @cabs = Cab.all
 end
end
