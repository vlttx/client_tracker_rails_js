class Invoice < ApplicationRecord
	belongs_to :user
	belongs_to :project, optional: true
	validates_presence_of :service
	validates_presence_of :total
end
