class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    if current_user == nil
      flash[:notice] = 'Please register or sign in to continue.'
      redirect_to root_path
    else
      enrollments_in = Enrollment.select {|en| en.user_id == current_user.id}
      
      @events_in = []
         enrollments_in.each do |en| 
        @events_in << Event.find_by_id(en.event_id)
      end

      @events_not_in = Event.all - @events_in

   

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @events }
      end
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    other_enrollments = Enrollment.select { |en| en.event_id == @event.id}
    @others_signed_up = []
    other_enrollments.each do |en|
       @others_signed_up << User.find_by_id(en.user_id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    @event.update_attributes(:current_users =>  0)

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def signup
  @event = Event.find_by_id(params[:id])
  @user = User.find_by_id(session[:user_id])
    @e = Enrollment.new
    @e.event = @event
    @e.user = @user
    @event.update_attributes(:current_users =>  @event.current_users+1)
    if !@e.save && !@event.save then
        flash[:notice] = "Could not sign up for event"
        redirect_to events_path
    end


  end
end
