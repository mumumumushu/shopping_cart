class Commodity < ApplicationRecord
	belongs_to :order

	validates :c_name, presence: true ,format: { with: /\A\w+\z/ }
						
	validates :c_price, presence: true ,numericality:{ greater_than: 0 }

	validates :c_num, presence: true ,
										numericality: { only_integer: true,greater_than: 0 }
						


end
