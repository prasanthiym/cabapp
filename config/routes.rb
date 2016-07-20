Cabapp::Application.routes.draw do
 
   resources :cabs
     
   post 'nearest-cab', :to => "rides#nearest_cab"
   put 'start-ride', :to => "rides#start_ride"
   put 'end-ride', :to => "rides#end_ride"
   
   root 'cabs#index'

end
