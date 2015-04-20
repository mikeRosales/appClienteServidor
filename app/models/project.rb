class Project < ActiveRecord::Base
	belongs_to :"user"
    has_many :contacts, dependent: :destroy
    has_many :userprojects, dependent: :destroy
    validates_presence_of :project_name
    validates_presence_of :company
    validates_presence_of :description

end
