class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => {email: false, username: true}
 	has_many :orders
 	#attr_accessor :login

	#def email_required?
   # false
  #end

  #def email_changed?
  #  false
  #end
	

end
