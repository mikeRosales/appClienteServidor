class Activity < ActiveRecord::Base
	 belongs_to :contacts
	 belongs_to :projects

     validates_presence_of :activity_name
     validates_presence_of :start_date
     validates_presence_of :end_date
     validates_presence_of :status
     validates_presence_of :responsibles
end

