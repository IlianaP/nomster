class Place < ActiveRecord::Base
	# attr_accessor :address, :name, :description 
	belongs_to :user 
	has_many :comments 
	validates :name, length: { minimum: 3, 
		too_short: "%{count} characters is the minimum allowed" }
	validates :address, presence: true 
	validates :description, presence: true 
	geocoded_by :address
	after_validation :geocode 
end


# places
# id|address|lon|lat|name|updated_at|created_at
# 1|123 main|1.0|2.0|Store|today|       today
# 1|456 main|3.0|4.0|Store|today|       today

