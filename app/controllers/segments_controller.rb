class SegmentsController < ApplicationController
	before_filter { @trip = Trip.find(params[:trip_id]) }

  def create
  	start_date = Date.new(params[:start_date][:year].to_i, params[:start_date][:month].to_i, params[:start_date][:day].to_i)
		end_date = Date.new(params[:end_date][:year].to_i, params[:end_date][:month].to_i, params[:end_date][:day].to_i)
    @segment = Segment.new(:trip => @trip, :title => params[:title], :description => params[:description], :start_date => start_date, :end_date => end_date)

    respond_to do |format|
      if @segment.save
        format.html { redirect_to trip_segment_path(@trip, @segment.position), notice: 'Segment was successfully created.' }
        format.json { render json: @segment, status: :created, location: @segment }
      else
        format.html { render 'new' }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
  	@segment = @trip.segments.where(:position => params[:id]).first
  	@segment.destroy
  	
    respond_to do |format|
      format.html { redirect_to trip_path(@trip) }
      format.json { head :no_content }
    end  	
  end
  
  def edit
		@segment = @trip.segments.where(:position => params[:id]).first
	end
  
  def new
    @segment = Segment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @segment }
    end
  end
  
  def show
  	position = params[:id]
    @segment = @trip.segments.where(:position => position).first    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @segment }
    end
  end
end