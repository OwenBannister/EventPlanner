class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    if current_user == nil
      flash[:notice] = 'Please register or sign in to continue.'
      redirect_to root_path
    else
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users }
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        if signed_in?
          signin_as @user
        end
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def login
       
  end

  def logout
    signout
    redirect_to root_path
  end

  def after_login

        @user = User.find_by_email(params[:email])
        signin_as(@user)
        if @user != nil 
            flash[:notice] = "Successful Login: Logged in as #{@user.name}"
        redirect_to user_path(@user)
        else 
          flash[:notice] = "Failed Login: Please try again"
        redirect_to login_path
      end
   end


def signin_as(user)
  if user != nil then
    session[:user_id] = user.id
    @current_user = user
  end
end

def my_events
      enrollments_in = Enrollment.select {|en| en.user_id == current_user.id}
      
      @events_in = []
         enrollments_in.each do |en| 
        @events_in << Event.find_by_id(en.event_id)
      end

  end


end
