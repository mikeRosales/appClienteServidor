class Usercontact < ActiveRecord::Base
	belongs_to :"users"
	belongs_to :"contacts"
end
