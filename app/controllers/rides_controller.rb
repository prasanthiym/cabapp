class RidesController < ApplicationController
 protect_from_forgery with: :null_session
 include Calculate
 
 def nearest_cab
 
    @cab = CabMart.getCab(params[:start_latitude].to_i,params[:start_longitude].to_i)
    if @cab.present?
      render json: {cabId: "#{@cab.id}"}
    else
     render json: { message: 'No Cabs Available For Ride.'}
   end
 end
 
 
 def start_ride
    
      @cab = Cab.find(params[:cab_id])
     
     if @cab.present?
      @ride = Ride.new(:cab_id => @cab.id , :start_latitude => params[:start_latitude] ,:start_longitude => params[:start_longitude])
      @ride.save
     
      @cab.update(:available => false)
      render json: {cab_id: @cab.id,ride_id: @ride.id, message: 'Ride Started Successfully'}
   else
     render json: { message: 'Cab Not Available'}
   end
 end
 
 
 def end_ride
   @ride = Ride.find(params[:ride_id])
   @ride.update(:end_latitude => params[:end_latitude] ,:end_longitude => params[:end_longitude])
   
   @cab = Cab.find(@ride.cab_id)
   @cab.update(:available => true,:latitude => params[:end_latitude] ,:longitude => params[:end_longitude])
   
   @amount = calculate_bill(@ride.start_latitude,@ride.end_latitude,params[:end_latitude].to_i,params[:end_longitude].to_i)
   
   render json: {ride_id: @ride.id, amount: @amount,cab_id: @cab.id,  message: 'Ride Ended Successfully'}
 end
 
end
