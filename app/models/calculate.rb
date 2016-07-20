module Calculate

    def measure(fromlatitude,fromlongitude,endlatitude,endlongitude)
       ((fromlatitude+fromlongitude)-(endlatitude+endlongitude)).to_i.abs 
       
    end
    
    def calculate_bill(fromlatitude,fromlongitude,endlatitude,endlongitude)
         distance = measure(fromlatitude,fromlongitude,endlatitude,endlongitude)
         @price = distance * 5
         @price
    end
    
end
