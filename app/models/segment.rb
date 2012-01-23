class Segment < ActiveRecord::Base
  after_destroy :reorder_segment_positions
  before_save :set_default_position
	
  belongs_to :trip
	
  private
	
  def set_default_position
    self.position = self.trip.segments.count + 1 if self.position.nil?
  end

  def reorder_segment_positions
    self.trip.segments.where("position > ?", self.position).each do |segment|
      segment.position -= 1
      segment.save
    end
  end
end
