class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
before_action :auth_user!

  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  def auth_user!
      if admin_signed_in?
        authenticate_admin!
      else
        authenticate_user!
      end
  end
  # GET /activities
  # GET /activities.json
  def index
     if admin_signed_in?
      @activities = Activity.all
    else
     @activities = current_user.contacts
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)
    @activity.status = "por hacer"
    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:activity_name,:project_id,:start_date,:end_date,:responsibles)
    end
end


