class Segment < ActiveRecord::Base
	belongs_to :trip
	
	validates_numericality_of :position
end
