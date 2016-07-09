class Place < ActiveRecord::Base
	# attr_accessor :address, :name, :description 
	belongs_to :user
end


# places
# id|address|lon|lat|name|updated_at|created_at
# 1|123 main|1.0|2.0|Store|today|       today
# 1|456 main|3.0|4.0|Store|today|       today

