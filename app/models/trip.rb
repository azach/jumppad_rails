class Trip < ActiveRecord::Base
  has_many :segments, :dependent => :destroy
	
  validate :start_date_must_be_before_end_date

  def self.near(location)
    Segment.geocoded.near(location, 200, :order => :distance).collect { |segment| segment.trip }.uniq
  end

  def geolocated_segments
    self.segments.reject { |segment| segment.latitude.nil? && segment.longitude.nil? }
  end

  def start_date_must_be_before_end_date
    errors.add(:end_date, "can't be before the start date") unless end_date.nil? || start_date.nil? || end_date > start_date
  end
end
