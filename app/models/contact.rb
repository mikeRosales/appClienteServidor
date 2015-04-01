class Contact < ActiveRecord::Base
	 belongs_to :"activities"
	 belongs_to :"projects"
	 belongs_to :"users"
	
end

