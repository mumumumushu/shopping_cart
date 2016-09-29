class Address < ApplicationRecord
  belongs_to :user
  validates :consignee_address, presence: true,uniqueness: true
  validates :consignee_name, presence: true

  #def is_default
  	
  #	id == current_user.defalut_adresss_id ##????
  	
  #end

end
