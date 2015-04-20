class Contact < ActiveRecord::Base
	 belongs_to :"projects"
	 belongs_to :"users"
     has_many  :usercontacts, dependent: :destroy
    validates_presence_of :contact_name
end

