class ActivitiesController < ApplicationController
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
     @activities =  Activity.joins(:useractivities)

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

    respond_to do |format|
      if @activity.save
         @useractivities = Useractivities.new(useractivities_params)
              @useractivities.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
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
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end
   def useractivities_params
    params[:user_id] = current_user.id
   params[:activity_id] = @activity.id
    params.permit(:user_id, :activity_id)
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:activity_name, :start_date, :end_date, :responsibles,:status)
    end
end
