class AirController < ApplicationController

  require "net/http"
  
  
  
  def index
    @url="https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=32233&distance=25&API_KEY=E2BDE2A9-B6E8-4B75-8219-5CA31048834D"
    @uri=URI(@url)
    @response=Net::HTTP.get(@uri)
    @output=JSON.parse(@response)
    
    if @output.empty?
      @final_output="Please enter a valid pin code"
    else
      @final_output=@output[0]['AQI']  
      if @final_output > 0 && @final_output <= 20
        @color="green"
      elsif @final_output > 20 && @final_output <= 40
        @color="yellow" 
      elsif @final_output > 40 && @final_output <= 60
        @color="Red"
      else
        @color="maroon"    
      end  
    end  






    




#88540



  end
end
