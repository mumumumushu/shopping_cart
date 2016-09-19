class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def sum
   self.sum_price = 0 
    self.commodities.each do |c|
      self.sum_price = c.c_num.to_f * c.c_price.to_f +  self.sum_price
    end 
  end
  attr_accessor :email,:password,:username,:password_confirmation


 

end
