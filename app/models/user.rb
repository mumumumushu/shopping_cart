class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => {email: false, username: true}
 	has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
 	#attr_accessor :login

	#def email_required?
   # false
  #end

  #def email_changed?
  #  false
  #end
	

end
